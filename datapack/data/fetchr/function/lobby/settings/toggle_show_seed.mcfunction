#> fetchr:lobby/settings/toggle_show_seed
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the show seed setting.
#
# @user
# @context entity Player changing the setting

scoreboard players set @s fetchr.operator_check_callback_action 9
execute \
	unless score @s fetchr.operator matches 1 \
	run function fetchr:util/show_confirm_operator_status_prompt
execute \
	unless score @s fetchr.operator matches 1 \
	run return 0

scoreboard players add $show_seed fetchr.setting_values 1
execute \
	if score $show_seed fetchr.setting_values matches 2 \
	run scoreboard players set $show_seed fetchr.setting_values 0

execute \
	if score $show_seed fetchr.setting_values matches 0 \
	run tellraw @s { "translate": "fetchr.settings.show_seed.confirmation.toggle_off", "color": "red" }
execute \
	if score $show_seed fetchr.setting_values matches 1 \
	run tellraw @s { "translate": "fetchr.settings.show_seed.confirmation.toggle_on", "color": "green" }

#NEUN_SCRIPT until 69
#execute \
	if score $show_seed fetchr.setting_values matches 0 \
	run data \
		modify \
			entity @e[type=minecraft:marker, tag=fetchr.show_seed_sign, x=0, limit=1] \
			data.front_text.messages[3] \
		set value '{ "translate": "options.off", "color": "gray" }'
#execute \
	if score $show_seed fetchr.setting_values matches 1 \
	run data \
		modify \
			entity @e[type=minecraft:marker, tag=fetchr.show_seed_sign, x=0, limit=1] \
			data.front_text.messages[3] \
		set value '{ "translate": "options.on", "color": "green" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score $show_seed fetchr.setting_values matches 0 \
	run data \
		modify \
			entity @e[type=minecraft:marker, tag=fetchr.show_seed_sign, x=0, limit=1] \
			data.front_text.messages[3] \
		set value { translate: "options.off", color: "gray" }
execute \
	if score $show_seed fetchr.setting_values matches 1 \
	run data \
		modify \
			entity @e[type=minecraft:marker, tag=fetchr.show_seed_sign, x=0, limit=1] \
			data.front_text.messages[3] \
		set value { translate: "options.on", color: "green" }
#NEUN_SCRIPT end

function fetchr:lobby/place_indestructible_blocks