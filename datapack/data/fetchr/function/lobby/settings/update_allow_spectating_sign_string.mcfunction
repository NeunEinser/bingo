#> fetchr:lobby/settings/update_allow_spectating_sign_string
#
# Updates the allow spectating sign 
#
# @internal

#NEUN_SCRIPT until 69
#execute \
	if score $allow_spectating fetchr.setting_values matches 0 \
	run data \
		modify storage fetchr:settings allow_spectating \
		set value '{ "translate": "options.off", "color": "gray" }'
#execute \
	if score $allow_spectating fetchr.setting_values matches 1 \
	run data \
		modify storage fetchr:settings allow_spectating \
		set value '{ "translate": "options.on", "color": "green" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score $allow_spectating fetchr.setting_values matches 0 \
	run data \
		modify storage fetchr:settings allow_spectating \
		set value { translate: "options.off", color: "gray" }
execute \
	if score $allow_spectating fetchr.setting_values matches 1 \
	run data \
		modify storage fetchr:settings allow_spectating \
		set value { translate: "options.on", color: "green" }
#NEUN_SCRIPT end