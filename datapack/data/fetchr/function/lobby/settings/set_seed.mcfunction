#> fetchr:lobby/settings/set_seed
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or prints instructions for generting a card from a set seed
#
# @user
# @context entity Player changing the setting

execute \
	if score $operator_only fetchr.settings matches 1 \
	unless score @s fetchr.operator matches 1 \
	run function fetchr:util/show_confirm_operator_status_prompt
execute \
	if score $operator_only fetchr.settings matches 1 \
	unless score @s fetchr.operator matches 1 \
	run return 0
tellraw @s [\
	{\
		"translate": "fetchr.lobby.card_generation.from_seed.instructions",\
		"with": [\
			{\
				"translate": "fetchr.lobby.card_generation.from_seed.instructions.link",\
				"color": "#00c3ff",\
				"clickEvent": { "action": "suggest_command", "value": "/trigger fetchr.seed set "},\
				"click_event": { "action": "suggest_command", "command": "/trigger fetchr.seed set "}\
			}\
		]\
	},\
	"\n",\
	{ "translate": "fetchr.lobby.card_generation.from_seed.explanation", "italic": true, "color": "gray" }\
]