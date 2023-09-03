# This script is used for building this pack
import hashlib, io, json, os, re, requests, shutil, pyjson5, zipfile
from distutils.dir_util import copy_tree
from sys import stderr

import python_nbt.nbt as nbt


def main():
	config = {}
	if os.path.exists("neunscript.config.json"):
		with open("neunscript.config.json", "r") as config_file:
			config_raw = config_file.read()
			config_file.close()
			try:
				config=json.loads(config_raw)
			except Exception:
				pass

	target = config.get("target")
	if target == None:
		target="neunscript_out"

	if os.path.exists(target):
		shutil.rmtree(target)

	resourcepack_config = config.get("resourcepack")
	languages = None
	mc_version_info = None

	if resourcepack_config != None:
		copy_pack(resourcepack_config, f"{target}{os.sep}tmp{os.sep}resourcepack", ["assets", "pack.mcmeta", "pack.png"])
		version_id: str = config.get("mc")

		if version_id != None:
			version_manifest : dict = requests.get("https://piston-meta.mojang.com/mc/game/version_manifest_v2.json").json()
			version_data: dict = next(filter(lambda v: v["id"] == version_id, version_manifest["versions"]))
			if version_data != None:
				version: dict = requests.get(version_data["url"]).json()
				override_default_lang_strings(f"{target}{os.sep}tmp{os.sep}resourcepack", version["assetIndex"]["url"])

				minecraft_jar = zipfile.ZipFile(io.BytesIO(requests.get(version["downloads"]["client"]["url"]).content))
				minecraft_jar.extract("version.json", f"{target}{os.sep}tmp")
				with open(f"{target}{os.sep}tmp{os.sep}version.json", "r", encoding="utf-8") as version_info_file:
					mc_version_info: dict = json.loads(version_info_file.read())
				os.remove(f"{target}{os.sep}tmp{os.sep}version.json")

	datapack_config = config.get("datapack")
	if datapack_config != None:
		copy_pack(datapack_config, f"{target}{os.sep}tmp{os.sep}datapack", ["data", "pack.mcmeta", "pack.png"])

	name=config.get("name")
	version=config.get("version")
	if version == None:
		version=config.get("versionName")

	if name == None:
		name = "unnamed"
	
	if version == None:
		version = "1.0.0"

	includes = config.get("include")
	if includes != None:
		for path in includes:
			copy_file_or_dir(path, f"{target}{os.sep}tmp{os.sep}{path}")

	world_config=config.get("world")
	worldpath=f"{target}{os.sep}tmp{os.sep}world{os.sep}{name}-{version}"
	if world_config != None:
		copy_pack(world_config, worldpath, None)

	copy_tree(f"{target}{os.sep}tmp", f"{target}{os.sep}out")
	requested_rp_sha = iterate_files(config, target, mc_version_info)

	variants:dict = config.get("versions")
	if variants == None:
		variants = {}
	variants[""] = None
	for variant, _ in variants.items():
		rppath=f"{target}{os.sep}{name}-{version}-resourcepack{'-' + variant if variant else ''}"
		shutil.make_archive(rppath, "zip", f"{target}{os.sep}out{os.sep + variant if variant else ''}{os.sep}resourcepack")
		rppath += ".zip"

		BUF_SIZE = 65536
		sha1 = hashlib.sha1()
		with open(rppath, 'rb') as f:
			while True:
				data = f.read(BUF_SIZE)
				if not data:
					break
				sha1.update(data)

		for file_path in requested_rp_sha:
			if version not in file_path:
				continue
			with open(file_path, "r+", encoding="utf-8") as file:
				file_content = file.read()
				file_content = file_content.replace("{NEUN_SCRIPT:resource_pack_sha1}", sha1.hexdigest().upper())
				file.seek(0)
				file.write(file_content)
				file.truncate()
		
		dppath = f"{target}{os.sep}{name}-{version}-datapack{'-' + variant if variant else ''}"
		shutil.make_archive(dppath, "zip", f"{target}{os.sep}out{os.sep + variant if variant else ''}{os.sep}datapack")
		dppath += ".zip"
		
		worldpathroot=f"{target}{os.sep}out{os.sep + variant if variant else ''}{os.sep}world"
		worldpath=f"{worldpathroot}{os.sep}{name}-{version}"
		if variant:
			shutil.move(worldpath, worldpath + "-" + variant)
			worldpath += "-" + variant

		shutil.copy2(rppath, f"{worldpath}{os.sep}resources.zip")
		os.mkdir(f"{worldpath}{os.sep}datapacks")
		shutil.copy2(dppath, f"{worldpath}{os.sep}datapacks{os.sep}{name}.zip")

		shutil.make_archive(f"{target}{os.sep}{name}-{version}{'-' + variant if variant else ''}", "zip", worldpathroot)
		
		if includes != None:
			for path in includes:
				copy_file_or_dir(f"{target}{os.sep}out{os.sep}{path}", f"{target}{os.sep}{path}")
	
	shutil.rmtree(f"{target}{os.sep}tmp")
	shutil.rmtree(f"{target}{os.sep}out")

def iterate_files(config: dict, target: str, mc_version_info: dict | None):
	requested_rp_sha = []
	remove_extensions = config.get("remove_file_types")
	versionDict: dict = config.get("versions")
	if versionDict == None:
		versionDict = {}
	versions:list[tuple[str,dict]] = list(versionDict.items())
	versions.insert(0, ("", None))

	for i, ext in enumerate(remove_extensions):
		remove_extensions[i] = "." + ext
	if remove_extensions == None:
		remove_extensions=()
	else:
		remove_extensions = tuple(remove_extensions)

	for directory, _, files in os.walk(f"{target}{os.sep}tmp"):
		for file_name in files:

			for version, override in versions:
				version_config = config.copy()
				if override != None:
					dict_apply(version_config, override)
				
				if version:
					out_path = f"{target}{os.sep}out{os.sep}{version}{directory.removeprefix(target + os.sep + 'tmp')}"
					file_path = out_path + os.sep + file_name
					os.makedirs(out_path, exist_ok=True)
					shutil.copy2(directory + os.sep + file_name, file_path)
				else:
					file_path = f"{target}{os.sep}out{directory.removeprefix(target + os.sep + 'tmp')}" + os.sep + file_name
				print(file_path)

				if file_name.endswith(remove_extensions):
					os.remove(file_path)
				elif file_name.endswith(".nbt") or file_name.endswith(".dat"):
					nbt_content = nbt.read_from_nbt_file(file_path)
					handle_nbt(nbt_content, file_path, version_config, mc_version_info)
					nbt.write_to_nbt_file(file_path, nbt_content)

				elif not file_name.endswith(".png") and not file_name.endswith(".bin"):
					try:
						with open(file_path, "r+", encoding="utf-8") as file:
							file_content = file.read()

							if file_name.endswith(".json") or file_name.endswith(".mcmeta"):
								file_content = minify_json_file(file_content)
							elif file_name.endswith(".mcfunction"):
								file_content = minify_function_file(file_content, version_config)

							file_content = replace_variables(file_content, file_path, version_config, requested_rp_sha)

							file.seek(0)
							file.write(file_content)
							file.truncate()
					except UnicodeDecodeError:
						pass
	return requested_rp_sha

def replace_variables(content: str, file_path: str, config, requested_rp_sha: list):
	indexDiff = 0
	for match in re.finditer(r"\{NEUN_SCRIPT:([a-zA-Z0-9_-]+)(?:\s*([+\-*/%])\s*([+-]?\d+))?\}", content):
		variable = match.group(1)
		replace=get_variable(variable, config, requested_rp_sha, file_path)
		if replace == None:
			continue
		if replace == variable:
			replace = ""
			print(f"variable {variable} not found", file=stderr)
		
		if match.group(2) != None:
			if match.group(2) == "+":
				replace = str(int(replace) + int(match.group(3)))
			elif match.group(2) == "-":
				replace = str(int(replace) - int(match.group(3)))
			elif match.group(2) == "*":
				replace = str(int(replace) * int(match.group(3)))
			elif match.group(2) == "/":
				replace = str(int(replace) / int(match.group(3)))
			else:
				replace = str(int(replace) % int(match.group(3)))

		content = content[0:match.start() + indexDiff] + replace + content[match.end() + indexDiff:]
		indexDiff += len(replace) - match.end() + match.start()
	return content

def get_variable(variable: str, config: dict, requested_rp_sha: list | None = None, file_path: str | None = None):
	vars = config.get("vars")

	if variable == "version":
		return config.get("version")
	elif variable == "resource_pack_sha1" and requested_rp_sha != None and file_path != None:
		requested_rp_sha.append(file_path)
		return None
	elif vars != None:
		ret = vars.get(variable)
		if ret != None:
			return ret
		return variable
	return variable

def handle_nbt(nbt_tag, file_path: str, config: dict, mc_version_info: dict | None, key: str | None = None):
	if isinstance(nbt_tag, dict):
		if file_path.endswith("level.dat") and key == "Version" and mc_version_info != None:
			nbt_tag["Id"].value = mc_version_info["world_version"]
			nbt_tag["Name"].value = mc_version_info["name"]
		else:
			for key, value in nbt_tag.items():
				handle_nbt(value, file_path, config, mc_version_info, key)
	elif isinstance(nbt_tag, list):
		for value in nbt_tag:
			handle_nbt(value, file_path, config, key)
	elif hasattr(nbt_tag, "value") and isinstance(nbt_tag.value, str):
		nbt_tag.value = replace_variables(nbt_tag.value, file_path, config, [])
	elif key == "DataVersion" and mc_version_info != None:
		nbt_tag.value = mc_version_info["world_version"]

def minify_json_file(file_content: str):
	try:
		# pyjson5 allows for comments and other json5 features when reading
		json_content = pyjson5.decode(file_content)
		# json serializes as utf-8 when called like this, increasing minification 
		return json.dumps(json_content, ensure_ascii=False, separators=(",", ":"))

	except Exception:
		print("failed to parse json file\n" + file_content, file=stderr)

def minify_function_file(file_content: str, config: dict):
	output=""
	remove=0
	uncomment=0

	for line in file_content.splitlines():
		line = line.strip()

		if not line or line == "#":
			continue

		if line == "#NEUN_SCRIPT end":
			uncomment = 0
			remove = 0

		if line.startswith("#") and uncomment != 0:
			line = line[1:]
			uncomment -= 1

		if remove > 0:
			remove -= 1
			continue
		elif remove < 0:
			continue
		
		if not line.startswith("#"):
			if output:
				output += "\n"
			output += line
		elif line.startswith("#NEUN_SCRIPT"):
			match=re.match("#NEUN_SCRIPT\s+(.*)", line)

			if match != None:
				command = re.sub("\s+", " ", match.group(1)).lower().split(" ")

				if command[0] == "uncomment":
					uncomment = 1
					if len(command) > 1:
						try:
							uncomment = int(command[1])
						except ValueError:
							pass

				if command[0] == "remove":
					remove = 1
					if len(command) > 1:
						try:
							remove = int(command[1])
						except ValueError:
							pass
				
				if command[0] == "if" or command[0] == "unless":
					if len(command) < 2:
						raise ValueError("if/unless needs at least one argument")
					value = get_variable(command[1], config)
					if bool(value) == (command[0] == "if"):
						uncomment = -1
					else:
						remove = -1
						

	return output

def copy_pack(pack_config: dict, tmp_dir: str, paths: list[str] | None):
	os.makedirs(tmp_dir)
	src=pack_config.get("path")
	if src == None:
		src = "."

	deps = pack_config.get("dependencies")
	if deps != None:
		for dep in deps:
			dependency = zipfile.ZipFile(io.BytesIO(requests.get(dep).content))
			dependency.extractall( f"{tmp_dir}{os.sep}dependency")

			if paths != None:
				for path in paths:
					copy_file_or_dir(f"{tmp_dir}{os.sep}dependency{os.sep}{path}", f"{tmp_dir}{os.sep}{path}")
			else:
				copy_file_or_dir(f"{tmp_dir}{os.sep}dependency", tmp_dir)
			shutil.rmtree(f"{tmp_dir}{os.sep}dependency")

	
	if paths != None:
		for path in paths:
			copy_file_or_dir(f"{src}{os.sep}{path}", f"{tmp_dir}{os.sep}{path}")
	else:
		copy_file_or_dir(src, tmp_dir)

	
	exclude=pack_config.get("exclude")
	if exclude != None:
		for file in exclude:
			os.remove(f"{tmp_dir}{os.sep}{file}")

def copy_file_or_dir(src: str, target: str):
	if os.path.isdir(src):
		copy_tree(src, target)
	elif os.path.exists(src):
		shutil.copy2(src, target)

def dict_apply(src: dict, other: dict):
	for key, value in other.items():
		if isinstance(src[key], dict) and isinstance(value, dict):
			if key in src:
				cpy = src[key].copy()
				src[key] = cpy
				dict_apply(cpy, value)
			else:
				src[key] = value
		else:
			src[key] = value

def override_default_lang_strings(rp_root: str, assetUrl: str):
	default_strings = None
	if os.path.isfile(f"{rp_root}{os.sep}assets{os.sep}minecraft{os.sep}lang{os.sep}en_us.json"):
		with open(f"{rp_root}{os.sep}assets{os.sep}minecraft{os.sep}lang{os.sep}en_us.json", "r", encoding="utf-8") as lang_file:
			default_strings: dict[str, str] = pyjson5.decode(lang_file.read())

	if default_strings == None:
		return

	assets: dict = requests.get(assetUrl).json()
	pack_mcmeta_hash: str = assets["objects"]["pack.mcmeta"]["hash"]
	pack_mcmeta: dict = requests.get(f"https://resources.download.minecraft.net/{pack_mcmeta_hash[0:2]}/{pack_mcmeta_hash}").json()
	languages: list[str] = list(pack_mcmeta["language"])

	for lang in languages:
		if lang != "en_us":
			lang_path=f"{rp_root}{os.sep}assets{os.sep}minecraft{os.sep}lang{os.sep}{lang}.json"
			if os.path.isfile(lang_path):
				with open(lang_path, "r+", encoding="utf-8") as lang_file:
					lang_json: dict[str, str] = pyjson5.decode(lang_file.read())
					for (key, default) in default_strings.items():
						if key not in lang_json or not lang_json[key] or lang_json[key].isspace():
							lang_json[key] = default
					lang_file.seek(0)
					lang_file.write(json.dumps(lang_json))
					lang_file.truncate()
			else:
				with open(lang_path, "w", encoding="utf-8") as lang_file:
					lang_file.write(json.dumps(default_strings))

if __name__ == '__main__':
    main()
