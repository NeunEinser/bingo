#!/usr/bin/env python3

# This script is used for building this pack
import datetime
import hashlib
import json
import nbtlib
import os
import re
import requests
import shutil
import subprocess
import zipfile
from io import BytesIO
from typing import Any, TypedDict
from distutils.dir_util import copy_tree
from sys import stderr

class Range(TypedDict):
	min_inclusive: int
	max_inclusive: int
class Pack(TypedDict):
	pack_format: int | None
	min_format: int | list[int] | None
	max_format: int | list[int] | None
	supported_formats: Range | list[int] | None
	description: Any
class Overlay(TypedDict):
	directory: str
	min_format: int | list[int] | None
	max_format: int | list[int] | None
	formats: Range | list[int] | None
class Overlays(TypedDict):
	entries: list[Overlay]
class PackFormat(TypedDict):
	pack: Pack
	overlays: Overlays | None

class VersionInfo(TypedDict):
	initial_supported: dict | None
	lowest_release: dict | None
	latest_supported: dict | None

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

	mc_versions: list[dict] = requests.get("https://raw.githubusercontent.com/misode/mcmeta/refs/heads/summary/versions/data.json").json()
	mc_versions.reverse()

	name=config.get("name")
	version=config.get("version")
	if version == None:
		version=config.get("versionName")

	if name == None:
		name = "unnamed"
	
	if version == None:
		version = "1.0.0"

	world_config=config.get("world")

	mc_version_info: VersionInfo = {
		"initial_supported": None,
		"latest_supported": None,
		"lowest_release": None,
		"current_overlay_version": None,
	}
	if resourcepack_config is not None:
		(mc_version_info["initial_supported"], mc_version_info["latest_supported"]) = get_version(resourcepack_config.get("path"), mc_versions, True)
	if datapack_config is not None:
		(data_initial_supported, data_latest_supported) = get_version(datapack_config.get("path"), mc_versions, False)
		if mc_version_info["initial_supported"] is None or mc_version_info["initial_supported"]["data_version"] < data_initial_supported["data_version"]:
			mc_version_info["initial_supported"] = data_initial_supported
		if mc_version_info["latest_supported"] is None or mc_version_info["latest_supported"]["data_version"] > data_latest_supported["data_version"]:
			mc_version_info["latest_supported"] = data_latest_supported

	if mc_version_info["initial_supported"] is not None:
		mc_version_info["lowest_release"] = next((
			v for v in mc_versions \
				if v["type"] == "release" and v["data_version"] >= mc_version_info["initial_supported"]["data_version"]
		), mc_versions[-1])


	if mc_version_info["latest_supported"] is not None:
		mc_version_info["latest_release"] = next((
			v for v in reversed(mc_versions) if v["type"] == "release" and v["data_version"] <= mc_version_info["latest_supported"]["data_version"]
		), mc_versions[-1])

	vars = config.get("vars")
	if(vars is None):
		vars = {}
	vars["minecraft_latest_release"] = mc_version_info.get("latest_release") and mc_version_info["latest_release"]["name"]
	vars["minecraft_initial_release"] = mc_version_info.get("lowest_release") and mc_version_info["lowest_release"]["name"]
	vars["minecraft_latest_snapshot"] = mc_version_info.get("latest_supported") and mc_version_info["latest_supported"]["name"]
	vars["minecraft_initial_snapshot"] = mc_version_info.get("initial_supported") and mc_version_info["initial_supported"]["name"]
	config["vars"] = vars

	def get_version_string(pack_format: tuple[int, int] | None):
		return pack_format and f"{pack_format[0]}.{pack_format[1]}"
	
	def set_version_vars(vars: dict, is_rp: bool):
		vars["min_pack_format"] = mc_version_info.get("initial_supported") and get_version_string(get_version_from_version_info(mc_version_info["initial_supported"], is_rp))
		max_pack_format = mc_version_info.get("latest_supported") and get_version_from_version_info(mc_version_info["latest_supported"], is_rp)
		vars["max_pack_format"] = get_version_string(max_pack_format)
		vars["first_unsupported_format"] = None
		if max_pack_format is not None:
			vars["first_unsupported_format"] = get_version_string(next((get_version_from_version_info(v, is_rp) for v in mc_versions if get_version_from_version_info(v, is_rp) > max_pack_format), (max_pack_format[0] + 1, 0)))

	os.mkdir("dist")

	variantDict: dict | None = config.get("versions")
	if variantDict == None:
		variantDict = {}
	variants: list[tuple[str,dict|None]] = list(variantDict.items())
	variants.insert(0, ("", None))

	for variant, override in variants:
		variant_config = config.copy()
		if override != None:
			dict_apply(variant_config, override)
		variant_name_part = "-" + variant if variant else ""

		if "resource_pack_sha1" in variant_config["vars"]:
			del variant_config["resource_pack_sha1"]
		if "resource_pack_path" in variant_config:
			del variant_config["resource_pack_path"]
		if "data_pack_path" in variant_config:
			del variant_config["data_pack_path"]
		if resourcepack_config is not None:
			set_version_vars(variant_config["vars"], True)

			rppath = f"{target}{os.sep}{name}-{version}-resourcepack{variant_name_part}.zip"
			iterate_files(variant_config, resourcepack_config, rppath, mc_versions, mc_version_info, 1)

			sha1 = hashlib.sha1()
			with open(rppath, 'rb') as f:
				data = f.read()
				sha1.update(data)
			variant_config["vars"]["resource_pack_sha1"] = sha1.hexdigest().upper()
			variant_config["resource_pack_path"] = rppath

		if datapack_config is not None:
			dppath = f"{target}{os.sep}{name}-{version}-datapack{variant_name_part}.zip"
			set_version_vars(variant_config["vars"], False)
			iterate_files(variant_config, datapack_config, dppath, mc_versions, mc_version_info, 0)
			variant_config["data_pack_path"] = dppath

		if world_config is not None:
			world_vars = variant_config["vars"]
			world_vars["min_pack_format"] = None
			world_vars["max_pack_format"] = None
			world_vars["first_unsupported_format"] = None
			iterate_files(variant_config, world_config, f"{target}{os.sep}{name}-{version}{variant_name_part}.zip", mc_versions, mc_version_info, 2)

		includes = config.get("include")
		if includes != None:
			pack_format = (
				mc_version_info["latest_supported"]["data_pack_version"],
				mc_version_info["latest_supported"]["data_pack_version_minor"]
			)
			min_pack_format = (
				mc_version_info["initial_supported"]["data_pack_version"],
				mc_version_info["initial_supported"]["data_pack_version_minor"]
			)
			format_versions = sorted({
				(v["data_pack_version"], v["data_pack_version_minor"]) for v in mc_versions
			})
			for path in includes:
				file_name: str = path[max(path.rfind("/"), 0):]
				extension = file_name[file_name.rfind("."):] if "." in file_name else ""

				out_path = f"{path[:len(path) - len(extension)]}{variant_name_part}{extension}"
				print(out_path)
				out_path = f"{target}{os.sep}{out_path}"
				result = handle_file("", file_name, path[:-len(file_name)], pack_format, min_pack_format, mc_versions, format_versions, variant_config, mc_version_info, {})["content"]

				try:
					if isinstance(result, str):
						with open(out_path, "w", encoding="utf-8") as file:
							file.write(result)
					else:
						with open(out_path, "wb") as file:
							file.write(result)
				except:
					shutil.copy2(path, out_path)

class ExistingOverlay(TypedDict):
	dir: str
	min: int
	max: int

def get_version(pack_path: str, mc_versions: list[dict], is_rp: bool):
	if not os.path.isfile(f"{pack_path}{os.sep}pack.mcmeta"):
		return (None, None)
	with open(f"{pack_path}{os.sep}pack.mcmeta") as file:
		pack_mcmeta: PackFormat = json.loads(file.read())

		min_pack_format = pack_mcmeta["pack"].get("min_format")
		if min_pack_format is not None: min_pack_format = to_pack_format_tuple(min_pack_format)
		max_pack_format = pack_mcmeta["pack"].get("max_format")
		if max_pack_format is not None: max_pack_format = to_pack_format_tuple(max_pack_format, 2**31-1)

		if min_pack_format is None or max_pack_format is None:
			if min_pack_format is None:
				min_pack_format = (pack_mcmeta["pack"]["pack_format"], 0)
			if max_pack_format is None:
				max_pack_format = (min_pack_format[0], 2**31-1)
			supported_versions = pack_mcmeta["pack"].get("supported_formats")

			if isinstance(supported_versions, dict):
				if min_pack_format > (supported_versions["min_inclusive"], 0):
					min_pack_format = (supported_versions["min_inclusive"], 0)
				if max_pack_format < (supported_versions["max_inclusive"], 0):
					max_pack_format = (supported_versions["max_inclusive"], 2**31-1)
			elif supported_versions is not None:
				min_version = (min(supported_versions), 0)
				if min_pack_format > min_version:
					min_pack_format = min_version
				max_version = max(supported_versions)
				if max_pack_format < (max_version, 0):
					max_pack_format = (max_version, 2**31-1)

		return (
			next((v for v in mc_versions if get_version_from_version_info(v, is_rp) >= min_pack_format), None),
			next((v for v in reversed(mc_versions) if get_version_from_version_info(v, is_rp) <= max_pack_format), None)
		)

def iterate_files(config: dict, pack_config: dict, outpath: str, mc_versions: list[dict], version_info: VersionInfo, type: int):
	with zipfile.ZipFile(outpath, "w", zipfile.ZIP_DEFLATED, compresslevel=9) as out:
		pack_format_ranges: set[tuple[tuple[int, int], tuple[int, int]]] = set()
		remove_extensions = config.get("remove_file_types")


		zip_root_path = ""
		if type == 2:
			zip_root_path = outpath[outpath.rfind(os.sep) + 1:]
			if zip_root_path.endswith(".zip"):
				zip_root_path = zip_root_path[:-4]

		excludes: list[str] | None = pack_config.get("exclude")
		if excludes == None:
			excludes = []
		source = pack_config.get("path")
		if source is None:
			print("Pack config was missing a path, skipping", stderr)
			return
		
		is_repo = is_git_repo(source)

		default_lang_path = f"{source}{os.sep}assets{os.sep}minecraft{os.sep}lang{os.sep}en_us.json"
		default_strings = {}
		if type == 1 and os.path.isfile(default_lang_path):
			with open(default_lang_path, "r", encoding="utf-8") as lang_file:
				default_strings: dict[str, str] = json.loads(lang_file.read())
		
		format_versions = sorted({
			(v["resource_pack_version"], v["resource_pack_version_minor"]) if type == 1
			else (v["data_pack_version"], v["data_pack_version_minor"])
			for v in mc_versions
		})

		main_pack_format: tuple[int, int] = (
			version_info["latest_supported"]["resource_pack_version"],
			version_info["latest_supported"]["resource_pack_version_minor"]
		) if type == 1 else (
			version_info["latest_supported"]["data_pack_version"],
			version_info["latest_supported"]["data_pack_version_minor"]
		)
		min_pack_format: tuple[int, int] = (
			version_info["initial_supported"]["resource_pack_version"],
			version_info["initial_supported"]["resource_pack_version_minor"]
		) if type == 1 else (
			version_info["initial_supported"]["data_pack_version"],
			version_info["initial_supported"]["data_pack_version_minor"]
		)
		if os.path.isfile(f"{source}{os.sep}pack.mcmeta"):
			with open(f"{source}{os.sep}pack.mcmeta") as file:
				pack_mcmeta: PackFormat = json.loads(file.read())
				main_format_major = pack_mcmeta["pack"].get("pack_format")
				if main_pack_format[0] != main_format_major:
					main_pack_format = (pack_mcmeta["pack"]["pack_format"], next((v[1] for v in reversed(format_versions) if v[0] <= main_format_major), 2**31-1))
				if min_pack_format < main_pack_format:
					min_pack_format = main_pack_format
				supported_formats = pack_mcmeta["pack"].get("supported_formats")
				if supported_formats is not None:
					if isinstance(supported_formats, dict):
						min_pack_format = min(min_pack_format, (supported_formats["min_inclusive"], 0))
					else:
						min_pack_format = min(min_pack_format, (supported_formats[0], 0))
					if min_pack_format < (16, 0) and main_pack_format >= (16, 0):
						main_pack_format = (15, 0)

		if remove_extensions is not None:
			for i, ext in enumerate(remove_extensions):
				remove_extensions[i] = "." + ext
		if remove_extensions == None:
			remove_extensions=()
		else:
			remove_extensions = tuple(remove_extensions)

		created_directories: set[str] = set()

		for directory, _, files in os.walk(source):
			contains_file = False
			relative_path: str = directory.removeprefix(source).strip(os.sep)
			for file_name in files:
				file_path = f"{relative_path}{os.sep}{file_name}".strip(os.sep)
				if file_name == "pack.mcmeta" or any(file_path.startswith(exclude) for exclude in excludes):
					continue
				contains_file = True

				if not file_name.endswith(remove_extensions):
					default_contents = {}
					if type == 1 and relative_path.startswith(f"assets{os.sep}minecraft{os.sep}lang"):
						default_contents = default_strings

					file_result = handle_file(source, file_name, relative_path, main_pack_format,
					min_pack_format, mc_versions, format_versions, config, version_info, default_contents)

					pack_formats = sorted(file_result["formats"])
					should_create_main_as_overlay = False
					for i in range(0, len(pack_formats)):
						min_format = pack_formats[i]
						max_format = max_excl_to_max_inc(pack_formats[i+1], format_versions) if i+1 < len(pack_formats) else None

						if main_pack_format >= min_format and (max_format is None or main_pack_format <= max_format):
							continue

						overlay_content = handle_file(source, file_name, relative_path, min_format,
							min_pack_format, mc_versions, format_versions, config, version_info, default_contents)\
							["content"]

						if overlay_content is not None:
							pack_format_ranges.add((min_format, max_format))
							overlay_prefix = f"{zip_root_path}{os.sep}{get_overlay_dir_name((min_format, max_format), type == 1)}".strip(os.sep)
							overlay_path = f"{overlay_prefix}{os.sep}{file_path}"
							print(f"{outpath}: {overlay_path}")
							out.writestr(get_zipinfo(is_repo, source, f"{source}{os.sep}{file_path}", overlay_path), overlay_content, zipfile.ZIP_DEFLATED, 9)

							mkdirs_zip(is_repo, out, source, relative_path, created_directories, overlay_prefix)
						else:
							should_create_main_as_overlay = True

					file_content = file_result["content"]
					if file_content is not None:
						main_path = f"{zip_root_path}{os.sep}{file_path}".strip(os.sep)
						if should_create_main_as_overlay:
							if (pack_formats[0] != (1, 0)):
								pack_formats.insert(0, (1, 0))
							format_range = get_format_range(pack_formats, main_pack_format, format_versions)
							pack_format_ranges.add(format_range)
							overlay_prefix = f"{zip_root_path}{os.sep}{get_overlay_dir_name(format_range, type == 1)}"
							main_path = f"{overlay_prefix}{os.sep}{file_path}"
							
							mkdirs_zip(is_repo, out, source, relative_path, created_directories, overlay_prefix)
						
						print(f"{outpath}: {main_path}")
						out.writestr(get_zipinfo(is_repo, source, f"{source}{os.sep}{file_path}", main_path), file_content, zipfile.ZIP_DEFLATED, 9)

			if contains_file:
				mkdirs_zip(is_repo, out, source, relative_path, created_directories, zip_root_path)

		if type == 1:
			version_json: dict = requests.get(f"https://piston-meta.mojang.com/v1/packages/{version_info['latest_supported']['sha1']}/{version_info['latest_supported']['id']}.json").json()
			
			assets: dict = requests.get(version_json["assetIndex"]["url"]).json()
			pack_mcmeta_hash: str = assets["objects"]["pack.mcmeta"]["hash"]
			pack_mcmeta: dict = requests.get(f"https://resources.download.minecraft.net/{pack_mcmeta_hash[0:2]}/{pack_mcmeta_hash}").json()
			languages: list[str] = list(pack_mcmeta["language"])

			default_lang_contents = json.dumps(default_strings, ensure_ascii=False, separators=(",", ":")).encode()

			for lang in languages:
				lang_path = f"assets{os.sep}minecraft{os.sep}lang{os.sep}{lang}.json"
				if lang == "en_us" or any(i.filename == lang_path  for i in out.infolist()):
					continue

				out.writestr(get_zipinfo(is_repo, source, default_lang_path, lang_path), default_lang_contents, zipfile.ZIP_DEFLATED, 9)
		elif type == 2:
			if "region" not in created_directories:
				region_path = f"{zip_root_path}{os.sep}region"
				out.mkdir(get_zipinfo(is_repo, source, source, region_path))
				print(f"{outpath}: {region_path}")

			rppath = config.get("resource_pack_path")
			dppath = config.get("data_pack_path")
			zip_rootpath_info = out.getinfo(f"{zip_root_path}{os.sep}")
			if (rppath != None):
				rp_filename = f"{zip_root_path}{os.sep}resources.zip"
				print(f"{outpath}: {rp_filename}")
				zipinfo = zipfile.ZipInfo.from_file(rppath, rp_filename)
				rp_source = config["resourcepack"].get("path")
				rp_is_repo = is_git_repo(rp_source)
				zipinfo.date_time = get_zipinfo(rp_is_repo, rp_source, rp_source, rp_filename, True).date_time
				if zipinfo.date_time > zip_rootpath_info.date_time:
					zip_rootpath_info.date_time = zipinfo.date_time

				with open(rppath, "rb") as pack_file:
					out.writestr(zipinfo, pack_file.read(), zipfile.ZIP_DEFLATED, 9)

			if (dppath != None):
				dp_filename = f"{zip_root_path}{os.sep}datapacks{os.sep}Fetchr.zip"
				print(f"{outpath}: {dp_filename}")
				zipinfo = zipfile.ZipInfo.from_file(dppath, dp_filename)
				dp_source = config["datapack"].get("path")
				dp_is_repo = is_git_repo(dp_source)
				zipinfo.date_time = get_zipinfo(dp_is_repo, dp_source, dp_source, dp_filename, True).date_time
				if zipinfo.date_time > zip_rootpath_info.date_time:
					zip_rootpath_info.date_time = zipinfo.date_time

				with open(dppath, "rb") as pack_file:
					out.writestr(zipinfo, pack_file.read(), zipfile.ZIP_DEFLATED, 9)

				zipinfo = get_zipinfo(dp_is_repo, dp_source, dp_source, f"{zip_root_path}{os.sep}datapacks", True)
				out.mkdir(zipinfo)

		pack_path = f"{source}{os.sep}pack.mcmeta"
		if os.path.exists(pack_path) and len(pack_format_ranges) > 0:
			print(f"{outpath}: pack.mcmeta")
			pack_def = dict()
			with open(pack_path, "r", encoding="utf-8") as file:
				pack_def: PackFormat = json.loads(file.read())

			pack = pack_def and pack_def.get("pack")

			if pack != None:
				pack["pack_format"] = main_pack_format[0]
				overlays = pack_def.get("overlays")
				if overlays is None:
					overlays = {}
				entries = overlays.get("entries")
				if entries is None:
					entries = []

				existing_overlays = { e["directory"] for e in entries if "directory" in e.keys() }
				min_overlay_format = min(f[0] for f in pack_format_ranges)
				requires_old = min_overlay_format < (65, 0) if type == 1 else min_overlay_format < (82, 0)

				if requires_old:
					for existing_overlay in entries:
						if "formats" in existing_overlay.keys():
							continue
						min_format = existing_overlay.get("min_format")
						max_format = existing_overlay.get("max_format")
						if min_format == None or max_format == None:
							continue
						min_format = to_pack_format_tuple(min_format)
						max_format = to_pack_format_tuple(max_format)
						existing_overlay["formats"] = [min_format[0], max_format[0]]

				for pack_format_range in sorted(pack_format_ranges, key=lambda f: (f[0] or (1, 0), f[1] or (2**31-1, 2**31-1))):
					overlay_name = get_overlay_dir_name(pack_format_range, type == 1)
					if overlay_name in existing_overlays:
						continue

					min_inc = pack_format_range[0] if pack_format_range[0] != None else (16, 0)
					max_inc = pack_format_range[1] if pack_format_range[1] != None else (2**31-1, 2**31-1)
					overlay = { "directory": overlay_name }
					if requires_old:
						overlay["formats"] = [ min_inc[0],  max_inc[0] ]
					if max_inc >= ((65, 0) if type == 1 else (82, 0)):
						overlay["min_format"] = min_inc[0] if min_inc[1] == 0 else min_inc
						overlay["max_format"] = max_inc[0] \
							if max_inc[1] == 2**31-1 or (max_inc[0] < format_versions[-1][0] \
								and next(f for f in format_versions if f > max_inc)[0] > max_inc[0]) \
							else max_inc
					entries.append(overlay)
				overlays["entries"] = entries
				pack_def["overlays"] = overlays
				out.writestr(get_zipinfo(is_repo, source, pack_path, "pack.mcmeta"), json.dumps(pack_def, ensure_ascii=False, separators=(",", ":")), zipfile.ZIP_DEFLATED, 9)

def replace_variables(content: str, config):
	indexDiff = 0
	for match in re.finditer(r"\{NEUN_SCRIPT:([a-zA-Z0-9_-]+)(?:\s*([+\-*/%])\s*([+-]?\d+))?\}", content):
		variable = match.group(1)
		replace = get_variable(variable, config)
		replace = str(replace) if replace is not None else None
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

def get_variable(variable: str, config: dict):
	vars = config.get("vars")

	if variable == "version":
		return config.get("version")
	elif vars != None:
		ret = vars.get(variable)
		if ret != None:
			return ret
	return variable

class FileResult(TypedDict):
	formats: set[tuple[int, int]]
	content: bytes | str | None

def get_format_range(formats: list[tuple[int, int]], format: tuple[int, int], format_versions: list[tuple[int, int]]):
	min_format = (0, 0)
	max_format = None
	for i in range(0, len(formats)):
		min_format = formats[i]
		max_format = None
		if len(formats) > i + 1:
			max_format = max_excl_to_max_inc(formats[i+1], format_versions)
		if min_format <= format and (max_format is None or max_format >= format):
			break
	return (min_format, max_format)

def max_excl_to_max_inc(max_excl: tuple[int, int], format_versions: list[tuple[int, int]]):
	max_inc = max_excl
	if max_excl is not None:
		if max_excl not in format_versions:
			if max_excl[1] == 0:
				max_inc = (max_excl[0] - 1, 2**31-1)
			elif max_excl[1] < 2**31-1:
				max_inc =  (max_excl[0], max_excl[1] - 1)
		else: max_inc =  next(v for v in reversed(format_versions) if v < max_excl)
	if (max_inc == format_versions[-1]):
		max_inc = (max_excl[0], 2**31 - 1)
	return max_inc

def get_overlay_dir_name(format_range: tuple[tuple[int, int] | None, tuple[int, int] | None], is_rp: bool):
	from_part = ""
	if format_range[0] is not None and format_range[0] > (1, 0):
		from_part = "_from_" + (str(format_range[0][0])
			if (format_range[0] < (65, 0) if is_rp else format_range[0] < (82, 0))
			else f"{format_range[0][0]}.{format_range[0][1]}")
	to_part = ""
	if format_range[1] is not None and format_range[0] < (2**31-1, 0):
		if (format_range[1] < (65, 0) if is_rp else format_range[1] < (82, 0)):
			to_part = f"_to_{format_range[1][0]}"
		else:
			to_part = "_to_" + (f"{format_range[1][0]}.{format_range[1][1]}" if format_range[1][1] != 2**31-1 else f"{format_range[1][0]}.x")
	return "pack_format" + from_part + to_part

def handle_file(
	source: str,
	file_name: str,
	relative_path: str,
	pack_format: tuple[int, int],
	min_pack_format: tuple[int, int],
	versions: list[dict],
	format_versions: list[tuple[int, int]],
	version_config: dict,
	version_info: VersionInfo,
	default_contents: dict,
) -> FileResult:
	file_path = f"{source}{os.sep}{relative_path}{os.sep}{file_name}".strip("/")
	if file_name.endswith(".nbt") or file_name.endswith(".dat"):
		nbt_content = nbtlib.load(file_path)
		nbt_result = handle_structued(nbt_content, file_path, version_config, version_info, pack_format, min_pack_format, True)
		set_default_values(nbt_result, default_contents)

		formats = sorted(nbt_result[0])
		min_format = get_format_range(formats, pack_format, format_versions)[0]
		min_format = max(min_pack_format, min_format)
		version = next(v for v in versions if (get_version_from_version_info(v, False)) >= min_format)
		data_version = version["data_version"]

		if file_name == "level.dat":
			data = nbt_content.get("Data")
			if isinstance(data, dict):
				data["DataVersion"] = nbtlib.Int(data_version)
		else:
			file_data_version = nbt_content["DataVersion"]

			if min_pack_format > min_format or not isinstance(file_data_version, int) or file_data_version > data_version:
				nbt_content["DataVersion"] = nbtlib.Int(data_version)

		buffer = BytesIO()
		nbt_content.save(buffer)
		buffer.seek(0)
		binary_contents = buffer.read()

		return {
			"formats": nbt_result[0],
			"content": binary_contents if nbt_result[1] else None
		}

	binary = file_name.endswith(".png") or file_name.endswith(".bin")
	
	file_content: str | None = None
	if not binary:
		try:
			with open(file_path, "r", encoding="utf-8") as file:
				file_content = file.read()

		except UnicodeDecodeError:
			binary = True
	if file_content is None:
		with open(file_path, "rb") as file:
			content = file.read()
			return {
				"formats": set(),
				"content": content
			}

	minify_result: StringFileMinifyResult = {
		"formats": set(),
		"content": file_content
	}

	if file_name.endswith(".json") or file_name.endswith(".mcmeta"):
		minify_result = minify_json_file(file_content, file_path, version_config, version_info, pack_format, min_pack_format, default_contents)

	elif file_name.endswith(".mcfunction"):
		file_content = replace_variables(file_content, version_config)
		minify_result = minify_function_file(file_content, version_config, pack_format, min_pack_format)
	else:
		minify_result["content"] = replace_variables(file_content, version_config)

	file_content = minify_result["content"]
	return {
		"formats": minify_result["formats"],
		"content": file_content if file_content else None
	}

def handle_structued(
	tag,
	file_path: str,
	config: dict,
	mc_version_info: VersionInfo,
	pack_format: list[int],
	min_format: list[int],
	is_nbt: bool,
	key: str | None = None
):
	pack_formats: set[tuple[int, int]] = set()
	keep_self = True
	if isinstance(tag, dict):
		if is_nbt and file_path.endswith("level.dat") and key == "Version" and mc_version_info["lowest_release"] != None:
			tag["Id"] = nbtlib.Int(mc_version_info["lowest_release"]["data_version"])
			tag["Name"] = nbtlib.String(mc_version_info["lowest_release"]["id"])
		else:
			to_remove = set()
			to_replace = {}
			for key, value in tag.items():
				new_key = replace_variables(key, config)
				if new_key != key:
					to_remove.add(key)
					to_replace[new_key] = value
					
				if isinstance(value, str):
					new_value = replace_variables(value, config)
					if new_value != value:
						if is_nbt:
							new_value = nbtlib.String(new_value)
						value = new_value
						to_replace[key] = new_value

				if new_key.startswith("NEUN_SCRIPT "):
					match=re.match("NEUN_SCRIPT\s+(.*)", new_key)
					if match != None:
						should_execute_action = False
						force_child_evaluation = False
						command = re.sub("\s+", " ", match.group(1)).lower().split(" ")

						command_offset = 1 if command[0] not in ["replace", "remove"] else 2
						if len(command) == command_offset:
							should_execute_action = True
						elif len(command) < command_offset:
							raise ValueError(f"command needs {command_offset} arguments")
						else:
							match command[command_offset]:
								case "if" | "unless":
									if len(command) != command_offset + 2:
										raise ValueError("if/unless needs one argument")
									value = get_variable(command[command_offset + 1], config)
									value = value != None and (
										(isinstance(value, bool) and value)
										or (isinstance(value, str) and value.lower() == "true")
									)
									if value == (command[command_offset] == "if"):
										should_execute_action = True
									
								case "since" | "until":
									force_child_evaluation = True

									if len(command) < command_offset + 2:
										raise ValueError("until / since needs at least one argument")

									min_value = (1, 0)
									max_value = None

									if command[command_offset] == "since":
										min_value = to_pack_format_tuple(list(map(lambda v: int(v), command[command_offset + 1].split("."))))
										if len(command) > command_offset + 2 and command[command_offset + 2] == "until":
											if len(command) < command_offset + 4:
												raise ValueError("Syntax: since <pack_format> until <pack_format>")
											max_value = map(lambda v: int(v), command[command_offset + 3].split("."))
									else:
										max_value = map(lambda v: int(v), command[command_offset + 1].split("."))

									pack_formats.add(min_value)

									if max_value is not None:
										max_value = to_pack_format_tuple(list(max_value))
										pack_formats.add(max_value)
									if pack_format >= min_value and (max_value is None or pack_format < max_value):
										should_execute_action = True
										if min_value > min_format:
											pack_formats.add((1, 0))

						val_result = None
						if should_execute_action:
							match command[0]:
								case "remove_self":
									keep_self = False
								case "remove":
									to_remove.add(command[1])
								case "merge":
									val_result = handle_structued(value, file_path, config, mc_version_info, pack_format, min_format, is_nbt, new_key)
									if val_result[1] and isinstance(value, dict):
										for k, v in value.items():
											to_replace[k] = v
								case "replace":
									val_result = handle_structued(value, file_path, config, mc_version_info, pack_format, min_format, is_nbt, new_key)
									if val_result[1]:
										to_replace[command[1]] = value
									else:
										to_remove.add(command[1])

						if force_child_evaluation and val_result is None:
							val_result = handle_structued(value, file_path, config, mc_version_info, pack_format, min_format, is_nbt, new_key)
						if val_result is not None:
							pack_formats.update(val_result[0])
						to_remove.add(new_key)
							
				else:
					val_result = handle_structued(value, file_path, config, mc_version_info, pack_format, min_format, is_nbt, new_key)
					if val_result[1]:
						pack_formats.update(val_result[0])
					else:
						to_remove.add(new_key)

			for key, val in to_replace.items():
				tag[key] = val
			for key in to_remove:
				del tag[key]

	elif isinstance(tag, list):
		remove_indices = []
		for i, value in enumerate(tag):
			val_result = handle_structued(value, file_path, config, mc_version_info, pack_format, min_format, is_nbt)
			if val_result[1]:
				pack_formats.update(val_result[0])
			else:
				remove_indices.append(i)
		remove_indices.reverse()
		for i in remove_indices:
			del tag[i]
	return (pack_formats, keep_self)

class StringFileMinifyResult(TypedDict):
	formats: set[int]
	content: str

def minify_json_file(
	file_content: str,
	file_path: str,
	config: dict,
	mc_version_info: VersionInfo,
	pack_format: int,
	min_format: int,
	default_contents: dict
) -> StringFileMinifyResult:
	json_content = json.loads(file_content)
	structured_result = handle_structued(json_content, file_path, config, mc_version_info, pack_format, min_format, False)

	set_default_values(json_content, default_contents)

	# json serializes as utf-8 when called like this, increasing minification 
	return {
		"content": json.dumps(json_content, ensure_ascii=False, separators=(",", ":")) if structured_result[1] else "",
		"formats": structured_result[0]
	}

class StackEntry(TypedDict):
	remove: int
	uncomment: int

def minify_function_file(file_content: str, config: dict, pack_format: tuple[int, int], min_format: tuple[int, int]) -> StringFileMinifyResult:
	output=""
	stack: list[StackEntry] = [{"remove": 0, "uncomment": 0}]
	pack_formats: set[tuple[int, int]] = set()
	file_content = re.sub(r"\\\r?\n\s*", "", file_content)

	for line in file_content.splitlines():
		line = line.strip()

		if not line or line == "#":
			continue

		if line.startswith("#NEUN_SCRIPT"):
			match=re.match("#NEUN_SCRIPT\s+(.*)", line)

			if match != None:
				command = re.sub("\s+", " ", match.group(1)).lower().split(" ")
				if command[0] == "end":
					if len(stack) < 1:
						raise IndexError("Encountered unexpected end instruction")
					stack.pop()

				elif command[0] == "uncomment":
					uncomment = 1
					remove = stack[-1]["remove"]
					if (remove > 0):
						remove = 0
					if len(command) > 1:
						try:
							uncomment = int(command[1])
						except ValueError:
							pass
					stack.append({ "remove": remove, "uncomment": uncomment })

				elif command[0] == "remove":
					remove = 1
					if len(command) > 1:
						try:
							remove = int(command[1])
						except ValueError:
							pass
					stack.append({ "remove": remove, "uncomment": 0 })
				
				elif command[0] == "if" or command[0] == "unless":
					uncomment = 0
					remove = stack[-1]["remove"]
					if (remove > 0):
						remove = 0
					if len(command) < 2:
						raise ValueError("if/unless needs at least one argument")
					
					result = True
					if len(command) == 2:
						result = (command[1].lower() == "true") == (command[0] == "if")
					elif len(command) == 4:
						match command[2]:
							case "=":
								result = command[1] == command[3]
							case "!=":
								result = command[1] != command[3]
							case "<":
								result = int(command[1]) < int(command[3])
							case "<=":
								result = int(command[1]) <= int(command[3])
							case ">":
								result = int(command[1]) > int(command[3])
							case ">=":
								result = int(command[1]) >= int(command[3])
							case _:
								raise ValueError(f"cannot parse conditional {command[2]} in if/unless")
					else:
						raise ValueError(f"if/unless needs either 1 or 3 arguments")
					
					if result:
						uncomment = -1
					else:
						remove = -1

					stack.append({ "remove": remove, "uncomment": uncomment })
				
				elif command[0] == "until" or command[0] == "since":
					uncomment = 0
					remove = stack[-1]["remove"]
					if (remove > 0):
						remove = 0
					if len(command) < 2:
						raise ValueError("until/since needs at least one argument")
					min_value = (1, 0)
					max_value = None
					if command[0] == "since":
						min_value = to_pack_format_tuple(list(map(lambda v: int(v), command[1].split("."))))
						if len(command) >= 4 and command[2] == "until":
							max_value = map(lambda v: int(v), command[3].split("."))
					else:
						max_value = map(lambda v: int(v), command[1].split("."))
					pack_formats.add(min_value)
					if max_value is not None:
						max_value = to_pack_format_tuple(list(max_value))
						pack_formats.add(max_value)
					if pack_format >= min_value and (max_value is None or pack_format < max_value):
						uncomment = -1
						if min_value > min_format:
							pack_formats.add((1, 0))
					else:
						remove = -1
					stack.append({ "remove": remove, "uncomment": uncomment })

		elif stack[-1]["remove"] != 0:
			if stack[-1]["remove"] > 0:
				stack[-1]["remove"] -= 1
				if stack[-1]["remove"] == 0:
					if len(stack) < 1:
						raise IndexError("Encountered unexpected end instruction")
					stack.pop()
			continue

		elif stack[-1]["uncomment"] != 0 and line.startswith("#") and not line.startswith("# ") and not line.startswith("#>"):
			line = line[1:]
			if stack[-1]["uncomment"] > 0:
				stack[-1]["uncomment"] -= 1

		if not line.startswith("#"):
			if output:
				output += "\n"
			output += line

	return { "content": output, "formats": pack_formats }

def copy_file_or_dir(src: str, target: str):
	if os.path.isdir(src):
		copy_tree(src, target)
	elif os.path.exists(src):
		shutil.copy2(src, target)

def dict_apply(src: dict, other: dict):
	for key, value in other.items():
		if isinstance(src.get(key), dict) and isinstance(value, dict):
			if key in src:
				cpy = src[key].copy()
				src[key] = cpy
				dict_apply(cpy, value)
			else:
				src[key] = value
		else:
			src[key] = value

def set_default_values(target: dict, default_contents: dict):
	for key, val in default_contents.items():
		if key in target:
			current_value = target[key]
			if isinstance(current_value, dict) and isinstance(val, dict):
				set_default_values(current_value, val)
		else:
			target[key] = val

def is_git_repo(path: str):
	abspath = os.path.abspath(path)
	while os.sep in abspath:
		if os.path.isdir(f"{abspath}{os.sep}.git"):
			return True
		abspath = abspath[:abspath.rfind(os.sep)]
	return False

def get_zipinfo(is_repo: bool, source: str, path: str, target_path: str | None, include_renames = False):
	zipinfo = zipfile.ZipInfo.from_file(path, target_path)
	if zipinfo.is_dir():
		zipinfo.CRC = 0

	if is_repo:
		try:
			git_result = subprocess.Popen(
				["git", "log", "--follow", "--diff-filter" , "r" if not include_renames else "", '--pretty="%at"', "-n", "1", "--", os.path.abspath(path)],
				cwd=source,
				stdout=subprocess.PIPE
			)
			authored_date = datetime.datetime.fromtimestamp(float(git_result.stdout.readline().strip().strip(b'"').strip(b"'")), datetime.timezone.utc)
		except:
			return zipinfo
		zipinfo.date_time = (
			authored_date.year,
			authored_date.month,
			authored_date.day,
			authored_date.hour,
			authored_date.minute,
			authored_date.second
		)
	return zipinfo


def mkdirs_zip(is_repo: bool, zip: zipfile.ZipFile, source: str, path: str, existing: set[str], target_prefix = ""):
	path_members = [ d for d in path.split(os.sep) if d != "" ]
	def get_tuple(i: int):
		dir_name = os.sep.join(path_members[:i+1])
		return (f"{source}{os.sep}{dir_name}".strip("/"), f"{target_prefix}{os.sep}{dir_name}".strip("/"))

	prefix_path_members = [ p for p in target_prefix.split(os.sep) if p != "" ]
	prefix_source = f"{source}{os.sep}{path_members[0]}".strip("/") if len(path_members) > 0 else source
	dirs = ([ (prefix_source, os.sep.join(prefix_path_members[:i+1]).strip("/")) for i in range(len(prefix_path_members)) ])
	dirs.extend([ get_tuple(i) for i in range(len(path_members)) ])

	for source_dir, target_dir in reversed(dirs):
		if target_dir in existing: break
		zip.mkdir(get_zipinfo(is_repo, source, source_dir, target_dir))

		existing.add(target_dir)

def to_pack_format_tuple(format: list[int] | int, default_minor: int = 0):
	return (format[0], format[1] if len(format) >= 2 else default_minor) if not isinstance(format, int) else (format, default_minor)

def get_version_from_version_info(mc_version: dict, is_rp: bool):
	return (mc_version["resource_pack_version" if is_rp else "data_pack_version"], 
		mc_version["resource_pack_version_minor" if is_rp else "data_pack_version_minor"])

if __name__ == '__main__':
	main()
