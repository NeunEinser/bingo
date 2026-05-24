#> fetchr:lobby/settings/update_lockout_sign_string
#
# Updates the lockout sign 
#
# @internal

#NEUN_SCRIPT until 69
#execute \
	if score $lockout_mode fetchr.setting_values matches 0 \
	run data \
		modify storage fetchr:settings lockout \
		set value '{ "translate": "options.off", "color": "gray" }'
#execute \
	if score $lockout_mode fetchr.setting_values matches 1 \
	run data \
		modify storage fetchr:settings lockout \
		set value '{ "translate": "options.on", "color": "green" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score $lockout_mode fetchr.setting_values matches 0 \
	run data \
		modify storage fetchr:settings lockout \
		set value { translate: "options.off", color: "gray" }
execute \
	if score $lockout_mode fetchr.setting_values matches 1 \
	run data \
		modify storage fetchr:settings lockout \
		set value { translate: "options.on", color: "green" }
#NEUN_SCRIPT end