#> fetchr:lobby/settings/toggle_allow_spectating
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the allow spectating mode setting.
#
# @user
# @context entity Player changing the setting

scoreboard players set @s fetchr.operator_check_callback_action 10
execute \
	unless score @s fetchr.operator matches 1 \
	run function fetchr:util/show_confirm_operator_status_prompt
execute \
	unless score @s fetchr.operator matches 1 \
	run return 0

scoreboard players add $allow_spectating fetchr.setting_values 1
execute \
	if score $allow_spectating fetchr.setting_values matches 2 \
	run scoreboard players set $allow_spectating fetchr.setting_values 0

execute \
	if score $allow_spectating fetchr.setting_values matches 0 \
	run tellraw @s { "translate": "fetchr.settings.allow_spectating.confirmation.toggle_off", "color": "red" }
execute \
	if score $allow_spectating fetchr.setting_values matches 1 \
	run tellraw @s { "translate": "fetchr.settings.allow_spectating.confirmation.toggle_on", "color": "green" }

#NEUN_SCRIPT until 69
#execute \
	if score $allow_spectating fetchr.setting_values matches 0 \
	run data \
		modify \
			entity @e[type=minecraft:marker, tag=fetchr.allow_spectating_sign, x=0, limit=1] \
			data.front_text.messages[3] \
		set value '{ "translate": "options.off", "color": "gray" }'
#execute \
	if score $allow_spectating fetchr.setting_values matches 1 \
	run data \
		modify \
			entity @e[type=minecraft:marker, tag=fetchr.allow_spectating_sign, x=0, limit=1] \
			data.front_text.messages[3] \
		set value '{ "translate": "options.on", "color": "green" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score $allow_spectating fetchr.setting_values matches 0 \
	run data \
		modify \
			entity @e[type=minecraft:marker, tag=fetchr.allow_spectating_sign, x=0, limit=1] \
			data.front_text.messages[3] \
		set value { translate: "options.off", color: "gray" }
execute \
	if score $allow_spectating fetchr.setting_values matches 1 \
	run data \
		modify \
			entity @e[type=minecraft:marker, tag=fetchr.allow_spectating_sign, x=0, limit=1] \
			data.front_text.messages[3] \
		set value { translate: "options.on", color: "green" }
#NEUN_SCRIPT end

function fetchr:lobby/place_indestructible_blocks