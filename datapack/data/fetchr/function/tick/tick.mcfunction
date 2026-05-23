#> fetchr:tick/tick
#
# This function is called every tick
#
# This contains some base logic, but most of the stuff happens in
# fetchr:lobby/tick and fetchr:game/tick
#
# @within tag/function minecraft:tick
# @handles #minecraft:tick

#NEUN_SCRIPT since 62 until 69
	#tellraw @a { "translate": "fetchr.error.incompatible_minecraft_version.incompatible_snapshot", "color": "red", "with": [ "25w02a", "25w09a", "25w09b" ]}
	#return fail
#NEUN_SCRIPT end

#NEUN_SCRIPT until {NEUN_SCRIPT:min_pack_format}
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
#NEUN_SCRIPT end
#NEUN_SCRIPT since {NEUN_SCRIPT:min_pack_format} until {NEUN_SCRIPT:first_unsupported_format}
	execute \
		in fetchr:lobby \
		as @e[x=0,y=0,z=0,distance=..1,limit=1] \
		if data entity @s "Bukkit.updateLevel" \
		run function fetchr:tick/spigot
	execute \
		in fetchr:lobby \
		as @e[x=0,y=0,z=0,distance=..1,limit=1] \
		if data entity @s "Spigot.ticksLived" \
		unless data entity @s "Bukkit.updateLevel" \
		run function fetchr:tick/spigot
	execute \
		if score $lobby_generated fetchr.state matches -1 \
		run tellraw @a {"translate": "fetchr.error.cannot_update", "with":["5.0.1", "5.1-beta1"], "color": "red"}

	execute \
	in minecraft:overworld \
	run function neun_einser.timer:store_current_time

	# Detect second (or more) players in a LAN world
	#NEUN_SCRIPT unless {NEUN_SCRIPT:realms}
		execute \
			store result score $is_multiplayer fetchr.state \
			if entity @a
		scoreboard players remove $is_multiplayer fetchr.state 1
		execute \
			if score $is_multiplayer fetchr.state matches 2.. \
			run scoreboard players set $is_multiplayer fetchr.state 1

		execute \
			in minecraft:overworld \
			positioned 0 0 0 \
			run function fetchr:tick/resource_pack_check
	#NEUN_SCRIPT end

	# Loop depending on game state
	execute \
		if entity @a[predicate=fetchr:is_in_lobby, limit=1] \
		in fetchr:lobby \
		run function #fetchr:lobby/tick
	execute \
		at @a[tag=fetchr.in_skybox, limit=1] \
		as @e[type=minecraft:marker, tag=fetchr.spawn, distance=..12, limit=1] \
		at @s \
		run function #fetchr:spawn_preview/tick
	execute \
		if score $lobby_generated fetchr.state matches 4 \
		if score $game_state fetchr.state matches 1..2 \
		in fetchr:default \
		run function fetchr:game/start/pre_gen/tick
	execute \
		if score $game_state fetchr.state matches 4 \
		run function #fetchr:game/tick

	scoreboard players operation $last_tick_second fetchr.state = $raw 91.timer.io

	# player tick
	data modify storage tmp.fetchr:custom_hud handled set value []
	execute \
		as @a \
		at @s \
		run function #fetchr:player_tick
	data modify storage fetchr:custom_hud players append from storage tmp.fetchr:custom_hud handled[]
	scoreboard players reset $update_card fetchr.state
#NEUN_SCRIPT end