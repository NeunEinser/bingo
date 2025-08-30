#> fetchr:lobby/settings/toggle_paused_time
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the paused time setting
#
# @user
# @context entity Player changing the setting

scoreboard players set @s fetchr.operator_check_callback_action 7
execute \
	if score $operator_only fetchr.setting_values matches 1 \
	unless score @s fetchr.operator matches 1 \
	run function fetchr:util/show_confirm_operator_status_prompt
execute \
	if score $operator_only fetchr.setting_values matches 1 \
	unless score @s fetchr.operator matches 1 \
	run return 0

scoreboard players add $count_pauses 91.timer.io 1
execute \
	if score $count_pauses 91.timer.io matches 2 \
	run scoreboard players set $count_pauses 91.timer.io 0

execute \
	if score $count_pauses 91.timer.io matches 0 \
	run tellraw @s { "translate": "fetchr.settings.paused_time.confirmation.toggle_on", "color": "green" }
execute \
	if score $count_pauses 91.timer.io matches 1 \
	run tellraw @s { "translate": "fetchr.settings.paused_time.confirmation.toggle_off", "color": "green" }

#NEUN_SCRIPT until 69
#execute \
	if score $count_pauses 91.timer.io matches 0 \
	as @e[type=minecraft:marker, tag=fetchr.paused_time_sign, distance=0.., limit=2] \
	run data \
		modify entity @s data.front_text.messages[3] \
		set value '{ "translate": "options.off", "color": "gray" }'
#execute \
	if score $count_pauses 91.timer.io matches 1 \
	as @e[type=minecraft:marker, tag=fetchr.paused_time_sign, distance=0.., limit=2] \
	run data \
		modify entity @s data.front_text.messages[3] \
		set value '{ "translate": "options.on", "color": "green" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score $count_pauses 91.timer.io matches 0 \
	as @e[type=minecraft:marker, tag=fetchr.paused_time_sign, distance=0.., limit=2] \
	run data \
		modify entity @s data.front_text.messages[3] \
		set value { translate: "options.off", color: "gray" }
execute \
	if score $count_pauses 91.timer.io matches 1 \
	as @e[type=minecraft:marker, tag=fetchr.paused_time_sign, distance=0.., limit=2] \
	run data \
		modify entity @s data.front_text.messages[3] \
		set value { translate: "options.on", color: "green" }
#NEUN_SCRIPT end

function fetchr:lobby/place_indestructible_blocks