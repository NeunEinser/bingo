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
scoreboard players set $item_detect/goal.winning_teams fetchr.tmp 0
function fetchr:item_detection/goals/points/find_winners

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
		"translate": "fetchr.goal.points.chat",\
		"with": [\
			{ "storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.ff\"", "interpret": true },\
			{ "selector": "@a[tag=fetchr.in_winning_team]" },\
			{ "score": { "name": "$item_detect/announce/points.winning_score", "objective": "fetchr.tmp" }},\
			{ "score": { "name": "$target_time_announcement_minutes", "objective": "fetchr.setting_values" }}\
		]\
	}\
]

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.fetchr:item_detection team set from storage fetchr:card teams[-1]

execute \
	store result score $item_detect/goal.winner_count fetchr.tmp \
	if entity @a[tag=fetchr.in_winning_team]

title @a[tag=fetchr.in_winning_team] subtitle {\
	"translate": "fetchr.goal.points.subtitle.your_team",\
	"with": [\
		{\
			"score": {\
				"name": "$item_detect/announce/points.winning_score",\
				"objective": "fetchr.tmp"\
			}\
		}\
	]\
}
execute \
	if score $item_detect/goal.winner_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.you",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if score $item_detect/goal.winning_teams fetchr.tmp matches 2.. \
	run function fetchr:item_detection/goals/points/announce_tie

execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:black" } \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.black",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:blue" } \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.blue",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:cyan" } \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.cyan",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:dark_blue" } \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.dark_blue",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:dark_gray" } \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.dark_gray",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:dark_red" } \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.dark_red",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:gray" } \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.gray",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:green" } \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.green",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:light_blue" } \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.light_blue",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:lime" } \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.lime",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:magenta" } \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.magenta",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:orange" } \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.orange",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:purple" } \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.purple",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:red" } \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.red",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:white" } \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.white",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if data storage tmp.fetchr:item_detection team{ id: "fetchr:yellow" } \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.yellow",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}
execute \
	if score $item_detect/goal.winner_count fetchr.tmp matches 1 \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.player",\
		"with": [\
			{ "selector": "@s" },\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	if score $item_detect/goal.winning_teams fetchr.tmp matches 2.. \
	run title @a[tag=!fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.tie_lost",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	store result score $item_detect/goal.player_count fetchr.tmp \
	if entity @a[predicate=fetchr:is_in_game]
execute \
	if score $item_detect/goal.player_count fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team] subtitle {\
		"translate": "fetchr.goal.points.subtitle.single_player",\
		"with": [\
			{\
				"score": {\
					"name": "$item_detect/announce/points.winning_score",\
					"objective": "fetchr.tmp"\
				}\
			}\
		]\
	}

execute \
	if score $item_detect/goal.winning_teams fetchr.tmp matches 1 \
	run title @a[tag=fetchr.in_winning_team] title { "translate": "fetchr.goal.points.title", "color": "green" }
execute \
	if score $item_detect/goal.winning_teams fetchr.tmp matches 2.. \
	run title @a[tag=fetchr.in_winning_team] title { "translate": "fetchr.goal.points.title", "color": "yellow" }
title @a[tag=!fetchr.in_winning_team] title { "translate": "fetchr.goal.points.title", "color": "red" }

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

scoreboard players set $target_time_announced fetchr.state 1

function #fetchr:goal_and_item_detection/finished_target_time