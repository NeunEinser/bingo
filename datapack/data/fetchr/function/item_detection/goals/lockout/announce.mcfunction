#> fetchr:item_detection/goals/lockout/announce
#
# This function checks if the lockout goal has been reached.
#
# @within function fetchr:item_detection/goals/lockout/detect

data modify storage tmp.fetchr:item_detection teams set from storage fetchr:card teams
scoreboard players set $item_detect/goal.winning_teams fetchr.tmp 0
function fetchr:item_detection/goals/lockout/find_winners

tellraw @a [\
	"[",\
	{\
		"text": "≡",\
		"color": "#00c3ff",\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.menu" },\
		"hoverEvent": { "action": "show_text", "contents": { "translate": "fetchr.game.menu.hover_text" }},\
		"click_event": { "action": "run_command", "command": "trigger fetchr.menu" },\
		"hover_event": { "action": "show_text", "value": { "translate": "fetchr.game.menu.hover_text" }}\
	},\
	"] ",\
	{\
		"translate": "fetchr.goal.lockout.chat",\
		"with": [\
			{ "storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true },\
			{ "selector": "@a[tag=fetchr.in_winning_team]" }\
		]\
	}\
]

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.fetchr:item_detection team set from storage fetchr:card teams[-1]

execute \
	store result score $item_detect/goal.winner_count fetchr.tmp \
	if entity @a[tag=fetchr.in_winning_team]

title @a[tag=fetchr.in_winning_team] subtitle { "translate": "fetchr.goal.lockout.subtitle.your_team" }
execute \
	if score $item_detect/goal.winner_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.you" }
execute \
	if score $item_detect/goal.winning_teams fetchr.tmp matches 2.. \
	run function fetchr:item_detection/goals/lockout/announce_tie

execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:black" } \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.black" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:blue" } \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.blue" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:cyan" } \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.cyan" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:dark_blue" } \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.dark_blue" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:dark_gray" } \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.dark_gray" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:dark_red" } \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.dark_red" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:gray" } \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.gray" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:green" } \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.green" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:light_blue" } \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.light_blue" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:lime" } \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.lime" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:magenta" } \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.magenta" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:orange" } \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.orange" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:purple" } \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.purple" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:red" } \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.red" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:white" } \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.white" }
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:yellow" } \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.yellow" }
execute \
	if score $item_detect/goal.winning_teams fetchr.tmp matches 2.. \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.tie_lost" }
execute \
	if score $item_detect/goal.winner_count fetchr.tmp matches 1 \
	run title @a[tag=!fetchr.in_winning_team] \
		subtitle { "translate": "fetchr.goal.lockout.subtitle.player", "with": [{"selector": "@s"}] }

execute \
	if score $item_detect/goal.winning_teams fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team] title { "translate": "fetchr.goal.lockout.title", "color": "green" }
execute \
	if score $item_detect/goal.winning_teams fetchr.tmp matches 2.. \
	run title @a[tag=fetchr.in_winning_team] title { "translate": "fetchr.goal.lockout.title", "color": "yellow" }
title @a[tag=!fetchr.in_winning_team] title { "translate": "fetchr.goal.lockout.title", "color": "red" }

execute \
	if score $concealed_card fetchr.state matches 1 run \
	function fetchr:game/reveal_card

execute \
	as @a[tag=fetchr.in_winning_team] \
	run function fetchr:item_detection/goals/completed_goal_effects/init
execute \
	as @a[tag=!fetchr.in_winning_team, predicate=fetchr:is_in_game] \
	at @s \
	run playsound minecraft:entity.wither.spawn voice @a ~ ~ ~ 1 1.5
execute \
	as @a[predicate=fetchr:is_in_game] \
	run function fetchr:game/menu/print_without_hint

tag @a[predicate=fetchr:is_in_game] add fetchr.spectator
tag @a remove fetchr.in_winning_team

scoreboard players set $lockout_race_ended fetchr.state 1

function #fetchr:goal_and_item_detection/achieved_lockout