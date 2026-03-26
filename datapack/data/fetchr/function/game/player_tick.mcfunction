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
			"click_event": { "action": "suggest_command", "command": "/trigger fetchr.spectator" }\
		}]\
	}\
]

execute \
	at @e[type=minecraft:marker, tag=fetchr.mine_exit, tag=!fetchr.unlocked_exit, distance=..20] \
	run function fetchr:game/tick_exit

execute \
	at @e[type=minecraft:marker, tag=fetchr.mine_exit, distance=20..30] \
	unless entity @a[limit=1, distance=..20] \
	run function fetchr:game/open_exit