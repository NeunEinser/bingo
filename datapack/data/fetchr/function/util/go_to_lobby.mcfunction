#> fetchr:util/go_to_lobby
#
# Moves @s to the lobby
#
# @public
# @context
# 	entity The player who wants to go back to the lobby

execute \
	unless score $game_state fetchr.state matches 3.. \
	run team leave @s
execute \
	unless score @s fetchr.game_id = $current_game_id fetchr.game_id \
	run team leave @s

execute \
	if score @s fetchr.game_id = $current_game_id fetchr.game_id \
	unless entity @a[scores={fetchr.teleport_all=1}] \
	if entity @s[predicate=fetchr:is_in_game] \
	run tellraw @a { "translate": "fetchr.lobby.returned", "with": [{ "selector": "@s" }]}

effect clear @s
clear @s minecraft:spyglass[minecraft:custom_data={ fetchr: { skybox_spyglass: true }}]

function fetchr:util/find_leashed_entities
execute \
	at @s \
	as @e[distance=..50, tag=fetchr.leashed] \
	in fetchr:lobby \
	run teleport @s 7.5 3 7.5 180 0
function fetchr:util/find_owned_entities
execute \
	at @s \
	as @e[distance=..50, tag=fetchr.owned] \
	in fetchr:lobby \
	run teleport @s 7.5 3 7.5 180 0
execute \
	in fetchr:lobby \
	positioned 7.5 3 7.5 \
	run tag @e[distance=...1] remove fetchr.owned
execute \
	in fetchr:lobby \
	on vehicle \
	run teleport @s 7.5 3 7.5 180 0
execute \
	unless entity @s[predicate=fetchr:is_in_lobby] \
	in fetchr:lobby \
	run teleport @s 7.5 3 7.5 180 0
#NEUN_SCRIPT until 87.1
#execute \
	in fetchr:lobby \
	run spawnpoint @s 7 3 7 180
#NEUN_SCRIPT end
#NEUN_SCRIPT since 87.1
execute \
	in fetchr:lobby \
	run spawnpoint @s 7 3 7 180 0
#NEUN_SCRIPT end
scoreboard players reset @s fetchr.menu
scoreboard players reset @s fetchr.lobby
scoreboard players reset @s fetchr.spectator
scoreboard players reset @s fetchr.resource_pack_check

tag @s remove fetchr.spectator
tag @s remove fetchr.in_skybox
scoreboard players set @s fetchr.update_hud 1

#NEUN_SCRIPT until 49
#attribute @s minecraft:player.entity_interaction_range \
	modifier add fetchr:card_item_frame_range 20 add_value
#NEUN_SCRIPT end
#NEUN_SCRIPT since 49
attribute @s minecraft:entity_interaction_range \
	modifier add fetchr:card_item_frame_range 20 add_value
#NEUN_SCRIPT end

gamemode creative
gamemode survival

scoreboard players reset @s fetchr.teleport_all
execute \
	if score $game_state fetchr.state matches 3.. \
	if score $is_multiplayer fetchr.state matches 1 \
	unless entity @a[scores={fetchr.teleport_all=1}] \
	if score @s fetchr.operator matches 1 \
	run scoreboard players enable @s fetchr.teleport_all
execute \
	if score $game_state fetchr.state matches 3.. \
	if score $is_multiplayer fetchr.state matches 1 \
	unless entity @a[scores={fetchr.teleport_all=1}] \
	unless score $operator_only fetchr.setting_values matches 1 \
	run scoreboard players enable @s fetchr.teleport_all

execute \
	if score $game_state fetchr.state matches 3.. \
	if score $concealed_card fetchr.state matches 1 \
	run tellraw @s [\
		"===",\
		{ "translate": "fetchr.game.menu.heading.lobby", "bold": true, "color": "green" },\
		"===\n[",\
		{\
			"translate": "fetchr.game.menu.options.reveal_card",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.reveal_card" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.reveal_card" }\
		},\
		"]"\
	]
execute \
	if score $game_state fetchr.state matches 3.. \
	unless score $concealed_card fetchr.state matches 1 \
	if score $is_multiplayer fetchr.state matches 1 \
	unless entity @a[scores={fetchr.teleport_all=1}] \
	run tellraw @s [\
		"===",\
		{ "translate": "fetchr.game.menu.heading.lobby", "bold": true, "color": "green" },\
		"==="\
	]
execute \
	if score @s fetchr.teleport_all matches 0 \
	run tellraw @s [\
		"[",\
		{\
			"translate": "fetchr.game.menu.options.teleport_all",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.teleport_all" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.teleport_all" }\
		},\
		"]"\
	]

execute \
	if score $lobby_generated fetchr.state matches 3..4 \
	run schedule function fetchr:lobby/place_indestructible_blocks 1t replace

execute \
	unless entity @a[predicate=fetchr:is_in_game,limit=1] \
	in fetchr:lobby \
	run setworldspawn 7 3 7

function #fetchr:lobby/player_returned