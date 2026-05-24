#> fetchr:lobby/settings/toggle_timer_method
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the timer method setting
#
# @user
# @context entity Player changing the setting

scoreboard players set @s fetchr.operator_check_callback_action 6
execute \
	if score $operator_only fetchr.setting_values matches 1 \
	unless score @s fetchr.operator matches 1 \
	run function fetchr:util/show_confirm_operator_status_prompt
execute \
	if score $operator_only fetchr.setting_values matches 1 \
	unless score @s fetchr.operator matches 1 \
	run return 0

scoreboard players add $use_in_game_time fetchr.setting_values 1
execute \
	if score $use_in_game_time fetchr.setting_values matches 2 \
	run scoreboard players set $use_in_game_time fetchr.setting_values 0

execute \
	if score $use_in_game_time fetchr.setting_values matches 0 \
	run tellraw @s { "translate": "fetchr.settings.timer_method.confirmation.toggle_real_time", "color": "green" }
execute \
	if score $use_in_game_time fetchr.setting_values matches 1 \
	run tellraw @s { "translate": "fetchr.settings.timer_method.confirmation.toggle_in_game_time", "color": "green" }

#NEUN_SCRIPT until 69
#execute \
	if score $use_in_game_time fetchr.setting_values matches 0 \
	run data \
		modify storage fetchr:settings timer_method \
		set value '{ "translate": "fetchr.settings.timer_method.value.real_time", "color": "green" }'
#execute \
	if score $use_in_game_time fetchr.setting_values matches 1 \
	run data \
		modify storage fetchr:settings timer_method \
		set value '{ "translate": "fetchr.settings.timer_method.value.in_game_time", "color": "green" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score $use_in_game_time fetchr.setting_values matches 0 \
	run data \
		modify storage fetchr:settings timer_method \
		set value { translate: "fetchr.settings.timer_method.value.real_time", color: "green" }
execute \
	if score $use_in_game_time fetchr.setting_values matches 1 \
	run data \
		modify storage fetchr:settings timer_method \
		set value { translate: "fetchr.settings.timer_method.value.in_game_time", color: "green" }
#NEUN_SCRIPT end

function fetchr:lobby/place_indestructible_blocks