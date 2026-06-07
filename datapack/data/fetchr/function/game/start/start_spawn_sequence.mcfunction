#> fetchr:game/start/start_spawn_sequence
#
# This function is called when a player starts the game and either starts pre-
# generating or spawns the skybox.
#
# @within function fetchr:game/start/start_if_ready

scoreboard players reset @a fetchr.seed

scoreboard players set $game_state fetchr.state 3
scoreboard players reset $black_player_count fetchr.state
scoreboard players reset $blue_player_count fetchr.state
scoreboard players reset $cyan_player_count fetchr.state
scoreboard players reset $dark_blue_player_count fetchr.state
scoreboard players reset $dark_gray_player_count fetchr.state
scoreboard players reset $dark_red_player_count fetchr.state
scoreboard players reset $gray_player_count fetchr.state
scoreboard players reset $green_player_count fetchr.state
scoreboard players reset $light_blue_player_count fetchr.state
scoreboard players reset $lime_player_count fetchr.state
scoreboard players reset $magenta_player_count fetchr.state
scoreboard players reset $orange_player_count fetchr.state
scoreboard players reset $purple_player_count fetchr.state
scoreboard players reset $red_player_count fetchr.state
scoreboard players reset $white_player_count fetchr.state
scoreboard players reset $yellow_player_count fetchr.state

kill @e[type=minecraft:marker, tag=fetchr.skybox_button, distance=..9]
kill @e[type=minecraft:item_frame, tag=fetchr.card_frame, distance=..9]
kill @e[type=minecraft:marker, tag=fetchr.card_frame_start, distance=..9]
kill @e[type=minecraft:item_display, distance=..1]

fill ~-8 ~-1 ~-8 ~9 ~5 ~9 minecraft:air
fill ~-1 62 ~-1 ~1 ~3 ~1 minecraft:barrier replace #fetchr:sky_box_chute_replaceables
fill ~ 62 ~ ~ ~2 ~ minecraft:air replace minecraft:barrier

execute \
	as @a[predicate=fetchr:is_in_game] \
	unless score @s fetchr.game_id = $current_game_id fetchr.game_id \
	run function fetchr:util/go_to_lobby

setblock ~ ~-1 ~ minecraft:lime_stained_glass
teleport @a[predicate=fetchr:is_in_game] ~ ~ ~
tag @a remove fetchr.in_skybox
effect give @a[predicate=fetchr:is_in_game] minecraft:invisibility infinite 1 true
clear @a

scoreboard players operation $lockout_mode fetchr.state = $lockout_mode fetchr.setting_values
execute \
	in fetchr:lobby \
	run function fetchr:game/start/init_teams
execute \
	if score $team_count fetchr.state matches 1 \
	run scoreboard players set $lockout_mode fetchr.state 0

teleport @e[type=minecraft:item, distance=..9] ~ -128 ~
kill @e[y=-128, distance=..1]

#NEUN_SCRIPT until 69
#execute \
	if score $allow_spectating fetchr.setting_values matches 1 \
	in fetchr:lobby \
	as @e[type=minecraft:marker, tag=fetchr.join_game_sign, distance=0..] \
	run data \
		modify entity @s data.front_text.messages set value [\
		'{\
			"translate": "fetchr.lobby.card_generation.join_as_spectator.sign.line1",\
			"bold": true,\
			"color": "#8eedeb",\
			"clickEvent": { "action": "run_command", "value": "/function fetchr:lobby/settings/join_game" }\
		}',\
		'{ "translate": "fetchr.lobby.card_generation.join_as_spectator.sign.line2", "bold": true, "color": "#8eedeb" }',\
		'{ "translate": "fetchr.lobby.card_generation.join_as_spectator.sign.line3", "bold": true, "color": "#8eedeb" }',\
		'{ "translate": "fetchr.lobby.card_generation.join_as_spectator.sign.line4", "bold": true, "color": "#8eedeb" }'\
	]
#execute \
	if score $allow_spectating fetchr.setting_values matches 1 \
	in fetchr:lobby \
	as @e[type=minecraft:marker, tag=fetchr.join_game_sign, distance=0..] \
	if data entity @s data.back_text \
	run data \
		modify entity @s data.back_text.messages set value [\
		'{\
			"translate": "fetchr.lobby.card_generation.join_as_spectator.sign.line1",\
			"bold": true,\
			"color": "#8eedeb",\
			"clickEvent": { "action": "run_command", "value": "/function fetchr:lobby/settings/join_game" }\
		}',\
		'{ "translate": "fetchr.lobby.card_generation.join_as_spectator.sign.line2", "bold": true, "color": "#8eedeb" }',\
		'{ "translate": "fetchr.lobby.card_generation.join_as_spectator.sign.line3", "bold": true, "color": "#8eedeb" }',\
		'{ "translate": "fetchr.lobby.card_generation.join_as_spectator.sign.line4", "bold": true, "color": "#8eedeb" }'\
	]
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score $allow_spectating fetchr.setting_values matches 1 \
	in fetchr:lobby \
	as @e[type=minecraft:marker, tag=fetchr.join_game_sign, distance=0..] \
	run data \
		modify entity @s data.front_text.messages set value [\
		{\
			translate: "fetchr.lobby.card_generation.join_as_spectator.sign.line1",\
			bold: true,\
			color: "#8eedeb",\
			click_event: { action: "run_command", command: "function fetchr:lobby/settings/join_game" }\
		},\
		{ translate: "fetchr.lobby.card_generation.join_as_spectator.sign.line2", bold: true, color: "#8eedeb" },\
		{ translate: "fetchr.lobby.card_generation.join_as_spectator.sign.line3", bold: true, color: "#8eedeb" },\
		{ translate: "fetchr.lobby.card_generation.join_as_spectator.sign.line4", bold: true, color: "#8eedeb" }\
	]
execute \
	if score $allow_spectating fetchr.setting_values matches 1 \
	in fetchr:lobby \
	as @e[type=minecraft:marker, tag=fetchr.join_game_sign, distance=0..] \
	if data entity @s data.back_text \
	run data \
		modify entity @s data.back_text.messages set value [\
		{\
			translate: "fetchr.lobby.card_generation.join_as_spectator.sign.line1",\
			bold: true,\
			color: "#8eedeb",\
			click_event: { action: "run_command", command: "function fetchr:lobby/settings/join_game" }\
		},\
		{ translate: "fetchr.lobby.card_generation.join_as_spectator.sign.line2", bold: true, color: "#8eedeb" },\
		{ translate: "fetchr.lobby.card_generation.join_as_spectator.sign.line3", bold: true, color: "#8eedeb" },\
		{ translate: "fetchr.lobby.card_generation.join_as_spectator.sign.line4", bold: true, color: "#8eedeb" }\
	]
#NEUN_SCRIPT end

schedule function #fetchr:start_sequence/players_start_falling 2s
