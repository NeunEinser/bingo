# This script is used for building this pack
import hashlib, io, json, os, re, requests, shutil, pyjson5, zipfile
from typing import Any
from distutils.dir_util import copy_tree
from sys import stderr

import python_nbt.nbt as nbt

lines = 0

def main():
	config: dict[str, Any] = {}
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

	resourcepack_config : dict | None = config.get("resourcepack")
	datapack_config: dict | None = config.get("datapack")

	mc_version_info = None
	version_id: str | None = config.get("mc")

	if version_id != None:
		version_manifest : dict = requests.get("https://piston-meta.mojang.com/mc/game/version_manifest_v2.json").json()
		version_data: dict = next(filter(lambda v: v["id"] == version_id, version_manifest["versions"]))
		if version_data != None:
			version_info: dict = requests.get(version_data["url"]).json()
			override_default_lang_strings(f"{target}{os.sep}tmp{os.sep}resourcepack", version_info["assetIndex"]["url"])

			minecraft_jar = zipfile.ZipFile(io.BytesIO(requests.get(version_info["downloads"]["client"]["url"]).content))
			minecraft_jar.extract("version.json", f"{target}{os.sep}tmp")
			with open(f"{target}{os.sep}tmp{os.sep}version.json", "r", encoding="utf-8") as version_info_file:
				mc_version_info: dict | None = json.loads(version_info_file.read())
			os.remove(f"{target}{os.sep}tmp{os.sep}version.json")

	name=config.get("name")
	version=config.get("version")
	if version == None:
		version=config.get("versionName")

	if name == None:
		name = "unnamed"
	
	if version == None:
		version = "1.0.0"

	world_config=config.get("world")

	requested_rp_sha = []
	if resourcepack_config is not None:
		requested_rp_sha.extend(iterate_files(config, resourcepack_config, f"{target}{os.sep}tmp{os.sep}resourcepack", mc_version_info))

	if datapack_config is not None:
		requested_rp_sha.extend(iterate_files(config, datapack_config, f"{target}{os.sep}tmp{os.sep}datapack", mc_version_info))

	if world_config is not None:
		requested_rp_sha.extend(iterate_files(config, world_config, f"{target}{os.sep}tmp{os.sep}world", mc_version_info))

	includes = config.get("include")
	if includes != None:
		for path in includes:
			out_path = f"{target}{os.sep}tmp{os.sep}{path}"
			try:
				file_content = None
				with open(path, "r", encoding="utf-8") as file:
					file_content = file.read()
				file_content = replace_variables(file_content, out_path, config, requested_rp_sha)
				with open(out_path, "w", encoding="utf-8") as file:
					file.write(file_content)
			except:
				shutil.copy2(path, out_path)

	variants: dict | None = config.get("versions")
	if variants == None:
		variants = {}
	variants[""] = None
	for variant, _ in variants.items():
		rppath=f"{target}{os.sep}{name}-{version}-resourcepack{'-' + variant if variant else ''}"
		shutil.make_archive(rppath, "zip", f"{target}{os.sep}tmp{os.sep}resourcepack{'-' + variant if variant else ''}")
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
			if variant not in file_path:
				continue
			with open(file_path, "r+", encoding="utf-8") as file:
				file_content = file.read()
				file_content = file_content.replace("{NEUN_SCRIPT:resource_pack_sha1}", sha1.hexdigest().upper())
				file.seek(0)
				file.write(file_content)
				file.truncate()
		
		dppath = f"{target}{os.sep}{name}-{version}-datapack{'-' + variant if variant else ''}"
		shutil.make_archive(dppath, "zip", f"{target}{os.sep}tmp{os.sep}datapack{'-' + variant if variant else ''}")
		dppath += ".zip"
		
		worldpath=f"{target}{os.sep}tmp{os.sep}world{'-' + variant if variant else ''}"
		os.makedirs(f"{worldpath}{os.sep}region", exist_ok=True)
		shutil.copy2(rppath, f"{worldpath}{os.sep}resources.zip")
		os.mkdir(f"{worldpath}{os.sep}datapacks")
		shutil.copy2(dppath, f"{worldpath}{os.sep}datapacks{os.sep}{name}.zip")
		shutil.move(worldpath, f"{target}{os.sep}tmp{os.sep}w{os.sep}{name}-{version}")

		shutil.make_archive(f"{target}{os.sep}{name}-{version}{'-' + variant if variant else ''}", "zip", f"{target}{os.sep}tmp{os.sep}w")
		shutil.rmtree(f"{target}{os.sep}tmp{os.sep}w")
		
		if includes != None:
			for path in includes:
				copy_file_or_dir(f"{target}{os.sep}tmp{os.sep}{path}", f"{target}{os.sep}{path}")
	
	shutil.rmtree(f"{target}{os.sep}tmp")
	print(f"minified {lines} lines")

def iterate_files(config: dict, pack_config: dict, target: str, mc_version_info: dict | None):
	requested_rp_sha = []
	pack_formats_for_overlay = []
	remove_extensions = config.get("remove_file_types")
	versionDict: dict | None = config.get("versions")
	if versionDict == None:
		versionDict = {}
	excludes: list[str] | None = pack_config.get("exclude")
	if excludes == None:
		excludes = []
	source = pack_config.get("path")
	if source is None:
		print("invalid datapack config")
		return;
	main_pack_format = None
	min_pack_format = None
	max_pack_format = None
	existing_overlays = []
	mc_versions: list[dict] = []
	if os.path.isfile(f"{source}{os.sep}pack.mcmeta"):
		with open(f"{source}{os.sep}pack.mcmeta") as file:
			pack_format: dict[str, Any] = json.loads(file.read())
			main_pack_format: str = pack_format["pack"]["pack_format"]
			min_pack_format = main_pack_format
			max_pack_format = main_pack_format
			supported_formats: dict[str, int] | list[int] | None = pack_format["pack"].get("supported_formats")
			if supported_formats is not None:
				if isinstance(supported_formats, dict):
					min_pack_format = supported_formats["min_inclusive"]
					max_pack_format = supported_formats["max_inclusive"]
				else:
					min_pack_format = min(supported_formats)
					max_pack_format = max(supported_formats)
				if min_pack_format < 16 and main_pack_format >= 16:
					main_pack_format = 15
			overlays: dict[str, list[dict[str, Any]]] | None = pack_format.get("overlays")
			if overlays is not None:
				mc_versions = requests.get("https://raw.githubusercontent.com/misode/mcmeta/refs/heads/summary/versions/data.json").json()
				for overlay in overlays["entries"]:
					min_format = 0
					max_format = 2**31-1
					formats: dict[str, int] | list[int] = overlay.get("formats")
					if (isinstance(formats, dict)):
						min_format = formats["min_inclusive"]
						max_format = formats["max_inclusive"]
					else:
						min_format = min(formats)
						max_format = max(formats)
					existing_overlays.append({
						"dir": overlay["directory"],
						"min": min_format,
						"max": max_format
					})

	versions:list[tuple[str,dict|None]] = list(versionDict.items())
	versions.insert(0, ("", None))

	if remove_extensions is not None:
		for i, ext in enumerate(remove_extensions):
			remove_extensions[i] = "." + ext
	if remove_extensions == None:
		remove_extensions=()
	else:
		remove_extensions = tuple(remove_extensions)

	for directory, _, files in os.walk(source):
		for file_name in files:
			relative_path = f"{directory.removeprefix(source)}"
			file_path = f"{relative_path}{os.sep}{file_name}"
			if any(file_path.startswith(f"/{exclude}") for exclude in excludes):
				continue
			overlay = next((overlay for overlay in existing_overlays if file_path.startswith(f"/{overlay['dir']}")), None)

			version_info = dict(mc_version_info)

			if overlay is not None:
				format_version = overlay["min"] if overlay["min"] > min_pack_format else min_pack_format
				if format_version > min_pack_format:
					version = next(v for v in mc_versions if v["data_pack_version"] == format_version)
					version_info["world_version"] = version["data_version"]
			else:
				format_version = max((overlay["max"] for overlay in existing_overlays \
					if overlay['max'] < main_pack_format and os.path.isfile(f"{source}{os.sep}{overlay['dir']}{file_path}")),
					default= None)
				if format_version is not None:
					version = next(v for v in mc_versions if v["data_pack_version"] == format_version)
					version_info["world_version"] = version["data_version"]
				else:
					for overlay in existing_overlays:
						t = f"{source}{overlay['dir']}{os.sep}{file_path}"

			for version, override in versions:
				version_config = config.copy()
				if override != None:
					dict_apply(version_config, override)
				
				if version:
					out_root = f"{target}-{version}"
				else:
					out_root = target
				out_dir = f"{out_root}{relative_path}"
				out_path = f"{out_dir}{os.sep}{file_name}"
				
				file_path = f"{source}{file_path}"
				print(out_path)

				if not file_name.endswith(remove_extensions):
					if file_name.endswith(".nbt") or file_name.endswith(".dat"):
						nbt_content = nbt.read_from_nbt_file(file_path)
						handle_nbt(nbt_content, out_path, version_config, version_info)
						os.makedirs(out_dir, exist_ok=True)
						nbt.write_to_nbt_file(out_path, nbt_content)

					elif file_name.endswith(".png") and not file_name.endswith(".bin"):
						os.makedirs(out_dir, exist_ok=True)
						shutil.copy2(file_path, out_path)
					else:
						file_content: str | None = None
						try:
							with open(file_path, "r", encoding="utf-8") as file:
								file_content = file.read()

						except UnicodeDecodeError:
							pass
						if file_content == None:
							os.makedirs(out_dir, exist_ok=True)
							shutil.copy2(file_path, out_path)
						else:	
							if file_name.endswith(".json") or file_name.endswith(".mcmeta"):
								file_content = minify_json_file(file_content)
							elif file_name.endswith(".mcfunction"):
								function_result = minify_function_file(file_content, version_config, main_pack_format, min_pack_format, max_pack_format)
								pack_formats = sorted(function_result.get("pack_formats"))
								for i in range(0, len(pack_formats)):
									pack_format = pack_formats[i]
									max_format = pack_formats[i+1] - 1 if i+1 < len(pack_formats) else None
									if main_pack_format >= pack_format and (max_format is None or main_pack_format < max_format):
										continue
									pack_formats_for_overlay.append([pack_format if pack_format > 1 else None, max_format])
									overlay_content = minify_function_file(file_content, version_config, pack_format, min_pack_format, max_pack_format)\
										.get("content")

									if overlay_content:
										overlay_path = f"{out_root}{os.sep}pack_format\
											{f'_from_{pack_format}' if pack_format > 1 else ''}\
											{f'_until_{max_format}' if max_format != None else ''}\
											{os.sep}{relative_path}".replace("\t", "")
										os.makedirs(overlay_path, exist_ok=True)
										with open(f"{overlay_path}{os.sep}{file_name}", "w", encoding="utf-8") as file:
											file.write(overlay_content)
								file_content: str = function_result.get("content")
								if override == None:
									global lines
									lines += file_content.count("\n") + 1

							file_content = replace_variables(file_content, out_path, version_config, requested_rp_sha)

							if file_content:
								os.makedirs(out_dir, exist_ok=True)
								with open(out_path, "w", encoding="utf-8") as file:
									file.write(file_content)

	pack_path = f"{target}{os.sep}pack.mcmeta"
	if os.path.exists(pack_path) and len(pack_formats_for_overlay) > 0:
		with open(f"{target}{os.sep}pack.mcmeta", "r+", encoding="utf-8") as file:
			pack_def = json.loads(file.read())
			pack = pack_def.get("pack")
			supported_formats = pack.get("supported_formats")
			pack["pack_format"] = main_pack_format
			overlays = pack_def.get("overlays")
			if overlays is None:
				overlays = {}
			entries = overlays.get("entries")
			if entries is None:
				entries = []

			for pack_format in pack_formats_for_overlay:
				min_inc = pack_format[0] if pack_format[0] != None else 1
				max_inc = pack_format[1] if pack_format[1] != None else 2**31-1
				overlay_name = f"pack_format{f'_from_{min_inc}' if min_inc > 1 else ''}{f'_until_{max_inc}' if max_inc != 2**31-1 else ''}"
				if not any (entry["directory"] == overlay_name for entry in entries):
					entries.append({"formats": {"min_inclusive": min_inc, "max_inclusive": max_inc}, "directory": overlay_name })
			overlays["entries"] = entries
			pack_def["overlays"] = overlays
			file.seek(0)
			file.write(json.dumps(pack_def, ensure_ascii=False, separators=(",", ":")))
			file.truncate()

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

def minify_function_file(file_content: str, config: dict, pack_format: int, min_format, max_format):
	output=""
	remove=0
	uncomment=0
	pack_formats = set()
	file_content = re.sub(r"\\\r?\n\s*", "", file_content)

	for line in file_content.splitlines():
		line = line.strip()

		if not line or line == "#":
			continue

		if line == "#NEUN_SCRIPT end":
			uncomment = 0
			remove = 0

		if uncomment == -2:
			if line.startswith("#"):
				uncomment = -1
			else:
				uncomment = 0

		if uncomment != 0 and line.startswith("#") and not line.startswith("# ") and not line.startswith("#>"):
			line = line[1:]
			if uncomment > 0:
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
						uncomment = -2
					else:
						remove = -1
				
				if command[0] == "until" or command[0] == "since":
					if len(command) < 2:
						raise ValueError("until/since needs at least one argument")
					min_value = 1
					max_value = None
					if command[0] == "since":
						min_value = int(command[1])
						if len(command) >= 4 and command[2] == "until":
							max_value = int(command[3])
					else:
						max_value = int(command[1])
					pack_formats.add(min_value)
					if max_value is not None:
						pack_formats.add(max_value)
					if pack_format >= min_value and (max_value is None or pack_format < max_value):
						uncomment = -2
						if min_value > min_format:
							pack_formats.add(1)
					else:
						remove = -1

	return { "content": output, "pack_formats": pack_formats }

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
