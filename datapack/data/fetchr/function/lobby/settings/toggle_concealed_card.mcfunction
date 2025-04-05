#> fetchr:lobby/settings/toggle_concealed_card
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the concealed card setting.
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

scoreboard players add $concealed_card fetchr.settings 1
execute \
	if score $concealed_card fetchr.settings matches 2 \
	run scoreboard players set $concealed_card fetchr.settings 0

execute \
	if score $concealed_card fetchr.settings matches 0 \
	run tellraw @s [\
		"",\
		{ "translate": "fetchr.lobby.settings.concealed_card.toggle.off", "color": "red" },\
		"\n",\
		{ "translate": "fetchr.lobby.settings.concealed_card.toggle.info", "color": "gray", "italic": true }\
	]
execute \
	if score $concealed_card fetchr.settings matches 1 \
	run tellraw @s [\
		"",\
		{ "translate": "fetchr.lobby.settings.concealed_card.toggle.on", "color": "green" },\
		"\n",\
		{ "translate": "fetchr.lobby.settings.concealed_card.toggle.info", "color": "gray", "italic": true }\
	]

execute \
	if score $concealed_card fetchr.settings matches 0 \
	run data \
		modify \
			entity @e[type=minecraft:marker, tag=fetchr.concealed_card_sign, distance=..1, limit=1] \
			data.front_text.messages[3] \
		set value { "translate": "fetchr.lobby.settings.concealed_card.sign.off", "color": "gray" }
execute \
	if score $concealed_card fetchr.settings matches 1 \
	run data \
		modify \
			entity @e[type=minecraft:marker, tag=fetchr.concealed_card_sign, distance=..1, limit=1] \
			data.front_text.messages[3] \
		set value { "translate": "fetchr.lobby.settings.concealed_card.sign.on", "color": "green" }

function fetchr:lobby/place_indestructible_blocks