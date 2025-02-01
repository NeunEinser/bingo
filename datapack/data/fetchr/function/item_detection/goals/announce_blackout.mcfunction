#> fetchr:item_detection/goals/announce_blackout
#
# Announces a blackout and plays the goal completed effect for the entire team
#
# @within function fetchr:item_detection/announce

tellraw @a [\
	"[ ",\
	{\
		"text": "≡",\
		"color": "#00c3ff",\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.menu" },\
		"hoverEvent": { "action": "show_text", "contents": { "translate": "fetchr.game.menu.hover_text" }},\
		"click_event": { "action": "run_command", "command": "trigger fetchr.menu" },\
		"hover_event": { "action": "show_text", "value": { "translate": "fetchr.game.menu.hover_text" }}\
	},\
	" ] ",\
	{\
		"translate": "fetchr.goal.blackout.chat",\
		"with": [\
			{ "storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true },\
			{ "selector": "@a[tag=fetchr.in_current_team]" }\
		]\
	}\
]


# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.fetchr:item_detection team set from storage fetchr:card teams[-1]

title @a[tag=fetchr.in_current_team] subtitle { "translate": "fetchr.goal.blackout.subtitle.you" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:black" } \
	run title @a[tag=!fetchr.in_current_team] \
		subtitle { "translate": "fetchr.goal.blackout.subtitle.black" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:blue" } \
	run title @a[tag=!fetchr.in_current_team] \
		subtitle { "translate": "fetchr.goal.blackout.subtitle.blue" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:cyan" } \
	run title @a[tag=!fetchr.in_current_team] \
		subtitle { "translate": "fetchr.goal.blackout.subtitle.cyan" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:dark_blue" } \
	run title @a[tag=!fetchr.in_current_team] \
		subtitle { "translate": "fetchr.goal.blackout.subtitle.dark_blue" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:dark_gray" } \
	run title @a[tag=!fetchr.in_current_team] \
		subtitle { "translate": "fetchr.goal.blackout.subtitle.dark_gray" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:dark_red" } \
	run title @a[tag=!fetchr.in_current_team] \
		subtitle { "translate": "fetchr.goal.blackout.subtitle.dark_red" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:gray" } \
	run title @a[tag=!fetchr.in_current_team] \
		subtitle { "translate": "fetchr.goal.blackout.subtitle.gray" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:green" } \
	run title @a[tag=!fetchr.in_current_team] \
		subtitle { "translate": "fetchr.goal.blackout.subtitle.green" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:light_blue" } \
	run title @a[tag=!fetchr.in_current_team] \
		subtitle { "translate": "fetchr.goal.blackout.subtitle.light_blue" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:lime" } \
	run title @a[tag=!fetchr.in_current_team] \
		subtitle { "translate": "fetchr.goal.blackout.subtitle.lime" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:magenta" } \
	run title @a[tag=!fetchr.in_current_team] \
		subtitle { "translate": "fetchr.goal.blackout.subtitle.magenta" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:orange" } \
	run title @a[tag=!fetchr.in_current_team] \
		subtitle { "translate": "fetchr.goal.blackout.subtitle.orange" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:purple" } \
	run title @a[tag=!fetchr.in_current_team] \
		subtitle { "translate": "fetchr.goal.blackout.subtitle.purple" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:red" } \
	run title @a[tag=!fetchr.in_current_team] \
		subtitle { "translate": "fetchr.goal.blackout.subtitle.red" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:white" } \
	run title @a[tag=!fetchr.in_current_team] \
		subtitle { "translate": "fetchr.goal.blackout.subtitle.white" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:yellow" } \
	run title @a[tag=!fetchr.in_current_team] \
		subtitle { "translate": "fetchr.goal.blackout.subtitle.yellow" }

title @a[tag=fetchr.in_current_team] title { "translate": "fetchr.goal.blackout.title", "color": "green" }
title @a[tag=!fetchr.in_current_team] title { "translate": "fetchr.goal.blackout.title", "color": "red" }

execute \
	as @a[tag=fetchr.in_current_team] \
	run function fetchr:item_detection/goals/completed_goal_effects/init
scoreboard players set $blind_mode fetchr.state 0
execute \
	as @a[predicate=fetchr:is_in_game] \
	run function fetchr:game/menu/print_without_hint
execute \
	as @a[tag=!fetchr.in_current_team, predicate=fetchr:is_in_game] \
	at @s run playsound minecraft:entity.wither.spawn voice @a ~ ~ ~ 1 1.5

tag @a[tag=fetchr.in_current_team] add fetchr.spectator
scoreboard players set $points_goal_announced fetchr.state 1
