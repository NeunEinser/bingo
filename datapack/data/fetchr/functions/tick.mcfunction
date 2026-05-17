#> fetchr:tick/tick
#
# Shows an error message in Minecraft versions old enough to still have the
# plural form of `functions`
#
# @within tag/function minecraft:tick
# @handles #minecraft:tick

#NEUN_SCRIPT if {NEUN_SCRIPT:minecraft_initial_release} = {NEUN_SCRIPT:minecraft_latest_snapshot}
	#tellraw @a {\
		"translate": "fetchr.error.incompatible_minecraft_version.single_compatible",\
		"color": "red",\
		"with": [ "{NEUN_SCRIPT:minecraft_initial_release}" ]\
	}
#NEUN_SCRIPT end

#NEUN_SCRIPT if {NEUN_SCRIPT:minecraft_initial_release} != {NEUN_SCRIPT:minecraft_latest_snapshot}
	#NEUN_SCRIPT if {NEUN_SCRIPT:minecraft_initial_release} = {NEUN_SCRIPT:minecraft_latest_release}
		#tellraw @a {\
			"translate": "fetchr.error.incompatible_minecraft_version.single_compatible.with_latest_snapshot",\
			"color": "red",\
			"with": [ "{NEUN_SCRIPT:minecraft_initial_release}", "{NEUN_SCRIPT:minecraft_latest_snapshot}" ]\
		}
	#NEUN_SCRIPT end

	#NEUN_SCRIPT if {NEUN_SCRIPT:minecraft_initial_release} != {NEUN_SCRIPT:minecraft_latest_release}
		#NEUN_SCRIPT if {NEUN_SCRIPT:minecraft_latest_release} = {NEUN_SCRIPT:minecraft_latest_snapshot}
			#tellraw @a {\
				"translate": "fetchr.error.incompatible_minecraft_version.multiple_compatible",\
				"color": "red",\
				"with": [ "{NEUN_SCRIPT:minecraft_initial_release}", "{NEUN_SCRIPT:minecraft_latest_release}" ]\
			}
		#NEUN_SCRIPT end

		#NEUN_SCRIPT if {NEUN_SCRIPT:minecraft_latest_release} != {NEUN_SCRIPT:minecraft_latest_snapshot}
			#tellraw @a {\
				"translate": "fetchr.error.incompatible_minecraft_version.multiple_compatible.with_latest_snapshot",\
				"color": "red",\
				"with": [\
					"{NEUN_SCRIPT:minecraft_initial_release}",\
					"{NEUN_SCRIPT:minecraft_latest_release}",\
					"{NEUN_SCRIPT:minecraft_latest_snapshot}"\
				]\
			}
		#NEUN_SCRIPT end
	#NEUN_SCRIPT end
#NEUN_SCRIPT end
