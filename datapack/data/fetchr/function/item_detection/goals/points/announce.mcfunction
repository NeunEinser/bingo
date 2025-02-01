#> fetchr:item_detection/goals/points/announce
#
# Announces the current points of each team, and the winning team(s)
#
# @within function fetchr:game/tick

data modify storage tmp.fetchr:item_detection teams set from storage fetchr:card teams
#>
# @within function fetchr:item_detection/goals/points/*
#delcare score_holder $item_detect/announce/points.winning_score
scoreboard players set $item_detect/announce/points.winning_score fetchr.tmp 0
data modify storage tmp.fetchr:item_detection teams set from storage fetchr:card teams
function fetchr:item_detection/goals/points/find_winners

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
		"translate": "fetchr.goal.points.chat",\
		"with": [\
			{ "storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true },\
			{ "selector": "@a[tag=fetchr.in_team]" },\
			{ "score": { "name": "$item_detect/announce/points.winning_score", "objective": "fetchr.tmp" }}\
		]\
	}\
]

title @a[tag=fetchr.in_team] \
	subtitle [{ "translate": "fetchr.goal.points.subtitle.won" }]
title @a[predicate=fetchr:is_in_game, tag=!fetchr.in_team] \
	subtitle [{ "translate": "fetchr.goal.points.subtitle.lost" }]
title @a[tag=fetchr.in_team] \
	title [{ "translate": "fetchr.goal.points.title.won", "color": "green" }]
title @a[predicate=fetchr:is_in_game, tag=!fetchr.in_team] \
	title [{ "translate": "fetchr.goal.points.title.lost", "color": "red" }]

execute \
	as @a[tag=fetchr.in_team] \
	run function fetchr:item_detection/goals/completed_goal_effects/init
execute \
	as @a[tag=!fetchr.in_team, predicate=fetchr:is_in_game] \
	at @s \
	run playsound minecraft:entity.wither.spawn voice @a ~ ~ ~ 1 1.5
execute \
	as @a[predicate=fetchr:is_in_game] \
	run function fetchr:game/menu/print_without_hint

tag @a[predicate=fetchr:is_in_game] add fetchr.spectator
tag @a remove fetchr.in_team

scoreboard players set $points_goal_announced fetchr.state 1
