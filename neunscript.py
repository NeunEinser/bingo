# This script is used for building this pack
import hashlib
import json
import os
import re
import shutil
import urllib.request
from distutils.dir_util import copy_tree
from sys import stderr

import python_nbt.nbt as nbt


def main():
	if os.path.exists("dist"):
		shutil.rmtree("dist")
	
	os.makedirs("dist/tmp")

	config = {}
	if os.path.exists("neunscript.config.json"):
		with open("neunscript.config.json", "r") as config_file:
			config_raw = config_file.read()
			config_file.close()
			try:
				config=json.loads(config_raw)
			except Exception:
				pass

	deps = config.get("dependencies")

	if deps != None:
		dataPackDeps = deps.get("dataPacks")
		if dataPackDeps != None:
			for dep in dataPackDeps:
				downloadTo(dep, "data", "datapack/data")

		resourcePackDeps = deps.get("resourcePacks")
		if resourcePackDeps != None:
			for dep in resourcePackDeps:
				downloadTo(dep, "assets", "resourcepack/assets")

	name=config.get("name")
	version=config.get("version")
	if version == None:
		version=config.get("versionName")

	if name == None:
		name = "unnamed"
	
	if version == None:
		version = "1.0.0"

	copy_tree("data", "dist/tmp/datapack/data")
	shutil.copy2("pack.mcmeta", "dist/tmp/datapack")
	shutil.copy2("pack.png", "dist/tmp/datapack")

	copy_tree("assets", "dist/tmp/resourcepack/assets")

	shutil.copy2("pack.mcmeta", "dist/tmp/resourcepack")
	shutil.copy2("pack.png", "dist/tmp/resourcepack")

	shutil.copy2("server.properties", "dist/tmp")

	worldpath = f"dist/tmp/world/{name}-{version}"
	os.makedirs(worldpath)
	shutil.copy2("level.dat", worldpath)
	shutil.copy2("icon.png", worldpath)
	requested_rp_sha = iterate_files(config)

	rppath=f"dist/{name}-{version}-resourcepack"
	shutil.make_archive(rppath, "zip", "dist/tmp/resourcepack")
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
		with open(file_path, "r+", encoding="utf-8") as file:
			file_content = file.read()
			file_content = file_content.replace("{NEUN_SCRIPT:resource_pack_sha1}", sha1.hexdigest())
			file.seek(0)
			file.write(file_content)
			file.truncate()
	
	dppath = f"dist/{name}-{version}-datapack"
	shutil.make_archive(dppath, "zip", "dist/tmp/datapack")
	dppath += ".zip"
	shutil.copy2(rppath, f"{worldpath}/resources.zip")
	os.mkdir(f"{worldpath}/datapacks")
	shutil.copy2(dppath, f"{worldpath}/datapacks/{name}.zip")

	shutil.make_archive(f"dist/{name}-{version}", "zip", "dist/tmp/world")
	shutil.copy2("dist/tmp/server.properties", "dist")
	
	shutil.rmtree("dist/tmp")

def iterate_files(config):
	requested_rp_sha=[]
	for root, _, files in os.walk("dist/tmp"):
		for file_name in files:
			file_path = root + os.sep + file_name

			if file_name.endswith(".xcf") or file_name.endswith(".py"):
				os.remove(file_path)
			elif file_name.endswith(".nbt") or file_name.endswith(".dat"):
				nbt_content = nbt.read_from_nbt_file(file_path)
				handle_nbt(nbt_content, file_path, config)
				nbt.write_to_nbt_file(file_path, nbt_content)

			elif not file_name.endswith(".png") and not file_name.endswith(".bin"):
				try:
					with open(file_path, "r+", encoding="utf-8") as file:
						file_content = file.read()

						if file_name.endswith(".json") or file_name.endswith(".mcmeta"):
							file_content = minify_json_file(file_content)
						elif file_name.endswith(".mcfunction"):
							file_content = minify_function_file(file_content)

						file_content = replace_variables(file_content, file_path, config, requested_rp_sha)

						file.seek(0)
						file.write(file_content)
						file.truncate()
				except UnicodeDecodeError:
					pass
	return requested_rp_sha

def replace_variables(content: str, file_path: str, config, requested_rp_sha: list):
	indexDiff = 0
	for match in re.finditer(r"\{NEUN_SCRIPT:([a-zA-Z_-]+)\}", content):
		variable = match.group(1)
		replace=None
		vars = config.get("vars")

		if variable == "version":
			replace = config.get("version")
		elif variable == "resource_pack_sha1":
			requested_rp_sha.append(file_path)
			continue
		elif vars != None:
			replace = vars.get(variable)

		if replace == None:
			replace=""

		content = content[0:match.start() + indexDiff] + replace + content[match.end() + indexDiff:]
		indexDiff += len(replace) - match.end() + match.start()
	return content

def handle_nbt(nbt_tag, file_path: str, config):
	if isinstance(nbt_tag, dict):
		for _, value in nbt_tag.items():
			handle_nbt(value, file_path, config)
	elif isinstance(nbt_tag, list):
		for value in nbt_tag:
			handle_nbt(value, file_path, config)
	elif hasattr(nbt_tag, "value") and isinstance(nbt_tag.value, str):
		nbt_tag.value = replace_variables(nbt_tag.value, file_path, config, [])

def minify_json_file(file_content: str):
	try:
		json_content = json.loads(file_content)
		return json.dumps(json_content, ensure_ascii=False, separators=(",", ":"))

	except Exception:
		print("failed to parse json file\n" + file_content, file=stderr)

def minify_function_file(file_content: str):
	output=""
	remove=0
	uncomment=0

	for line in file_content.splitlines():
		line = line.strip()

		if line.startswith("#") and uncomment != 0:
			line = line[1:]
			uncomment -= 1
		elif uncomment < 0:
			uncomment = 0

		if remove > 0:
			remove -= 1
		elif not line.startswith("#") and line:
			if output:
				output += "\n"
			output += line
		elif line.startswith("#NEUN_SCRIPT"):
			match=re.match("#NEUN_SCRIPT\s+(.*)", line)

			if match != None:
				command = re.sub("\s+", " ", match.group(1)).lower().split(" ")

				if command[0] == "uncomment":
					uncomment = -1
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
	return output

def downloadTo(url: str, source: str, target: str):
	if os.path.exists("dist/tmp/dependency"):
		shutil.rmtree("dist/tmp/dependency")
		
	urllib.request.urlretrieve(url, "dist/tmp/dependency.zip")
	shutil.unpack_archive("dist/tmp/dependency.zip", "dist/tmp/dependency")
	copy_tree("dist/tmp/dependency/" + source, "dist/tmp/" + target)



if __name__ == '__main__':
    main()
