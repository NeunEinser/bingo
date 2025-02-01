#> fetchr:game/menu/print_without_hint
#
# Display the menu options to @s
#
# @internal
# @context
# 	entity The player to whom to display the menu options

tellraw @s [\
	"===",\
	{ "translate": "fetchr.game.menu.heading", "bold": true, "color": "green", "fallback": "Fetchr Menu" },\
	"==="\
]
tellraw @s [\
	"[ ",\
	{\
		"translate": "fetchr.game.menu.options.goto_lobby",\
		"fallback": "Go to Lobby",\
		"color": "#00c3ff",\
		"clickEvent": { "action": "run_command", "value": "/trigger fetchr.lobby" },\
		"click_event": { "action": "run_command", "command": "trigger fetchr.lobby" }\
	},\
	" ]"\
]
execute \
	if score $allow_spectating fetchr.settings matches 1 \
	run tellraw @s [\
		"[ ",\
		{\
			"translate": "fetchr.game.menu.options.enter_spectator_mode",\
			"fallback": "Enter Spectator Mode",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.spectator" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.spectator" }\
		},\
		" ]"\
	]
execute \
	if score $blind_mode fetchr.state matches 1 \
	run tellraw @s [\
		"[ ",\
		{\
			"translate": "fetchr.game.menu.options.reveal_card",\
			"fallback": "Reveal the Bingo Card",\
			"color": "#00c3ff",\
			"clickEvent": { "action": "run_command", "value": "/trigger fetchr.reveal_card" },\
			"click_event": { "action": "run_command", "command": "trigger fetchr.reveal_card" }\
		},\
		" ]"\
	]