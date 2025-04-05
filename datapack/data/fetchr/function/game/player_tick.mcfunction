#> fetchr:game/player_tick
#
# This function is called for every player while the game is running
#
# @within function fetchr:game/tick
# @context entity Player

execute \
	if entity @s[tag=fetchr.enable_manual_gamemode_switch, gamemode=!survival] \
	run tag @s add fetchr.spectator

tellraw @s[tag=!fetchr.spectator, gamemode=!survival] [\
	{\
		"translate": "fetchr.game.switch_gamemode.prevented",\
		"with": [{\
			"translate": "fetchr.game.switch_gamemode.prevented.click",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.spectator" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.spectator" }\
		}]\
	},\
	"\n\n",\
	{\
		"translate": "fetchr.game.switch_gamemode.hint",\
		"color": "gray",\
		"italic": true,\
		"with": [{\
			"text": "/trigger fetchr.spectator",\
			"color": "white",\
			"italic": false,\
			"clickEvent": { "action": "suggest_command", "value": "/trigger fetchr.spectator" },\
			"click_event": { "action": "suggest_command", "command": "/trigger fetchr.spectator" }\
		}]\
	}\
]

scoreboard players add @s[scores={fetchr.bed=1..}] fetchr.bed 1
execute \
	if score @s fetchr.bed matches 99.. \
	store result score @s fetchr.bed \
	run data get entity @s SleepTimer
