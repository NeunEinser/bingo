#> fetchr:lobby/settings/update_timer_method_sign_string
#
# Updates the timer method sign 
#
# @internal

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