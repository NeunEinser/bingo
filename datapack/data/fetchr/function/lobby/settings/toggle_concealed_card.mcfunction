#> fetchr:lobby/settings/toggle_concealed_card
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the concealed card setting.
#
# @user
# @context entity Player changing the setting

scoreboard players set @s fetchr.operator_check_callback_action 3
execute \
	if score $operator_only fetchr.setting_values matches 1 \
	unless score @s fetchr.operator matches 1 \
	run function fetchr:util/show_confirm_operator_status_prompt
execute \
	if score $operator_only fetchr.setting_values matches 1 \
	unless score @s fetchr.operator matches 1 \
	run return 0

scoreboard players add $concealed_card fetchr.setting_values 1
execute \
	if score $concealed_card fetchr.setting_values matches 2 \
	run scoreboard players set $concealed_card fetchr.setting_values 0

execute \
	if score $concealed_card fetchr.setting_values matches 0 \
	run tellraw @s [\
		"",\
		{ "translate": "fetchr.settings.concealed_card.confirmation.toggle_off", "color": "red" },\
		"\n",\
		{ "translate": "fetchr.settings.info.takes_effect_after_generating_new", "color": "gray", "italic": true }\
	]
execute \
	if score $concealed_card fetchr.setting_values matches 1 \
	run tellraw @s [\
		"",\
		{ "translate": "fetchr.settings.concealed_card.confirmation.toggle_on", "color": "green" },\
		"\n",\
		{ "translate": "fetchr.settings.info.takes_effect_after_generating_new", "color": "gray", "italic": true }\
	]

#NEUN_SCRIPT until 69
#execute \
	if score $concealed_card fetchr.setting_values matches 0 \
	run data \
		modify storage fetchr:settings concealed_card \
		set value '{ "translate": "options.off", "color": "gray" }'
#execute \
	if score $concealed_card fetchr.setting_values matches 1 \
	run data \
		modify storage fetchr:settings concealed_card \
		set value '{ "translate": "options.on", "color": "green" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score $concealed_card fetchr.setting_values matches 0 \
	run data \
		modify storage fetchr:settings concealed_card \
		set value { "translate": "options.off", "color": "gray" }
execute \
	if score $concealed_card fetchr.setting_values matches 1 \
	run data \
		modify storage fetchr:settings concealed_card \
		set value { "translate": "options.on", "color": "green" }
#NEUN_SCRIPT end

function fetchr:lobby/place_indestructible_blocks