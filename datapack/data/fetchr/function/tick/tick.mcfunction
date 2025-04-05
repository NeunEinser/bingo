#> fetchr:tick/tick
#
# This function is called every tick
#
# This contains some base logic, but most of the stuff happens in
# fetchr:lobby/tick and fetchr:game/tick
#
# @within tag/function minecraft:tick
# @handles #minecraft:tick
	function neun_einser.timer:store_current_time

	# Detect second (or more) players in a LAN world
		execute \
			store result score $is_multiplayer fetchr.state \
			if entity @a
		scoreboard players remove $is_multiplayer fetchr.state 1
		execute \
			if score $is_multiplayer fetchr.state matches 2.. \
			run scoreboard players set $is_multiplayer fetchr.state 1

		# Detect the resource pack not being active server-side (So either we are on a
		# server, or resourcepack is missing in single player for some reason)
		#
		# Uses name-check from technical translation:
		# - "fetchr.technical.detect_multiplayer" -> "DoNotTranslateThis<X>"
		#    <X> being version-check iteration (3+) (also used below)
		execute \
			if score $is_multiplayer fetchr.state matches 0 \
			unless score $integrated_server fetchr.state matches 1 \
			in fetchr:resourcepack_check positioned 0 0 0 \
			if entity @e[name="DoNotTranslateThis{NEUN_SCRIPT:rp_version}", distance=..0.1, limit=1] \
			run scoreboard players set $integrated_server fetchr.state 1
		execute \
			unless score $integrated_server fetchr.state matches 1 \
			run scoreboard players set $is_multiplayer fetchr.state 1

		# Place the sign in resource pack check chamber
		execute \
			if entity @a[tag=fetchr.resourcepack_check, limit=1] \
			run setblock 1 2 1 minecraft:air

	# Loop depending on game state
	execute \
		at @a[tag=fetchr.in_skybox, limit=1] \
		as @e[type=minecraft:marker, tag=fetchr.spawn, distance=..12, limit=1] \
		at @s \
		run function fetchr:game/skybox/tick
	execute \
		if score $game_state fetchr.state matches 4 \
		run function fetchr:game/tick

	scoreboard players operation $last_tick_second fetchr.state = $raw 91.timer.io

	# player tick
	data modify storage tmp.fetchr:custom_hud handled set value []
	execute \
		as @a \
		at @s \
		run function fetchr:tick/player_tick
	data modify storage fetchr:custom_hud players append from storage tmp.fetchr:custom_hud handled[]
	scoreboard players reset $update_card fetchr.state