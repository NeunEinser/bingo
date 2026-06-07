#> fetchr:tick/tick
#
# Shows an error message in Minecraft versions old enough to still have the
# plural form of `functions`
#
# @within tag/function minecraft:tick
# @handles #minecraft:tick

#NEUN_SCRIPT if {NEUN_SCRIPT:builtin.minecraft_version_info.initial_supported.data_version} < 4764
	#NEUN_SCRIPT if "{NEUN_SCRIPT:builtin.minecraft_version_info.initial_release.name}" = "{NEUN_SCRIPT:builtin.minecraft_version_info.latest_supported.name}"
		#tellraw @a {\
			"translate": "fetchr.error.incompatible_minecraft_version.single_compatible",\
			"color": "red",\
			"with": [ "{NEUN_SCRIPT:builtin.minecraft_version_info.initial_release.name}" ]\
		}
	#NEUN_SCRIPT end

	#NEUN_SCRIPT if "{NEUN_SCRIPT:builtin.minecraft_version_info.initial_release.name}" != "{NEUN_SCRIPT:builtin.minecraft_version_info.latest_supported.name}"
		#NEUN_SCRIPT if "{NEUN_SCRIPT:builtin.minecraft_version_info.initial_release.name}" = "{NEUN_SCRIPT:builtin.minecraft_version_info.latest_release.name}"
			#tellraw @a {\
				"translate": "fetchr.error.incompatible_minecraft_version.single_compatible.with_latest_snapshot",\
				"color": "red",\
				"with": [ "{NEUN_SCRIPT:builtin.minecraft_version_info.initial_release.name}", "{NEUN_SCRIPT:builtin.minecraft_version_info.latest_supported.name}" ]\
			}
		#NEUN_SCRIPT end

		#NEUN_SCRIPT if "{NEUN_SCRIPT:builtin.minecraft_version_info.initial_release.name}" != "{NEUN_SCRIPT:builtin.minecraft_version_info.latest_release.name}"
			#NEUN_SCRIPT if "{NEUN_SCRIPT:builtin.minecraft_version_info.latest_release.name}" = "{NEUN_SCRIPT:builtin.minecraft_version_info.latest_supported.name}"
				#tellraw @a {\
					"translate": "fetchr.error.incompatible_minecraft_version.multiple_compatible",\
					"color": "red",\
					"with": [ "{NEUN_SCRIPT:builtin.minecraft_version_info.initial_release.name}", "{NEUN_SCRIPT:builtin.minecraft_version_info.latest_release.name}" ]\
				}
			#NEUN_SCRIPT end

			#NEUN_SCRIPT if "{NEUN_SCRIPT:builtin.minecraft_version_info.latest_release.name}" != "{NEUN_SCRIPT:builtin.minecraft_version_info.latest_supported.name}"
				#NEUN_SCRIPT if {NEUN_SCRIPT:builtin.minecraft_version_info.latest_supported.data_version} < 4764
					#tellraw @a {\
						"translate": "fetchr.error.incompatible_minecraft_version.multiple_compatible.with_latest_snapshot",\
						"color": "red",\
						"with": [\
							"{NEUN_SCRIPT:builtin.minecraft_version_info.initial_release.name}",\
							"{NEUN_SCRIPT:builtin.minecraft_version_info.latest_release.name}",\
							"{NEUN_SCRIPT:builtin.minecraft_version_info.latest_supported.name}"\
						]\
					}
				#NEUN_SCRIPT end
				#NEUN_SCRIPT if {NEUN_SCRIPT:builtin.minecraft_version_info.latest_supported.data_version} >= 4764
					#tellraw @a {\
						"translate": "fetchr.error.incompatible_minecraft_version.multiple_compatible",\
						"color": "red",\
						"with": [\
							"{NEUN_SCRIPT:builtin.minecraft_version_info.initial_release.name}",\
							"{NEUN_SCRIPT:builtin.minecraft_version_info.latest_supported.name}"\
						]\
					}
				#NEUN_SCRIPT end
			#NEUN_SCRIPT end
		#NEUN_SCRIPT end
	#NEUN_SCRIPT end
#NEUN_SCRIPT end
#NEUN_SCRIPT if {NEUN_SCRIPT:builtin.minecraft_version_info.initial_supported.data_version} >= 4764
	#NEUN_SCRIPT if "{NEUN_SCRIPT:builtin.minecraft_version_info.initial_supported.name}" = "{NEUN_SCRIPT:builtin.minecraft_version_info.latest_supported.name}"
		#tellraw @a {\
			"translate": "fetchr.error.incompatible_minecraft_version.single_compatible",\
			"color": "red",\
			"with": [ "{NEUN_SCRIPT:builtin.minecraft_version_info.initial_supported.name}" ]\
		}
	#NEUN_SCRIPT end

	#NEUN_SCRIPT if "{NEUN_SCRIPT:builtin.minecraft_version_info.initial_supported.name}" != "{NEUN_SCRIPT:builtin.minecraft_version_info.latest_supported.name}"
		#tellraw @a {\
			"translate": "fetchr.error.incompatible_minecraft_version.multiple_compatible",\
			"color": "red",\
			"with": [ "{NEUN_SCRIPT:builtin.minecraft_version_info.initial_supported.name}", "{NEUN_SCRIPT:builtin.minecraft_version_info.latest_supported.name}" ]\
		}
	#NEUN_SCRIPT end
#NEUN_SCRIPT end