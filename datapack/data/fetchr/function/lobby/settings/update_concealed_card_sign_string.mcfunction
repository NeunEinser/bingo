#> fetchr:lobby/settings/update_concealed_card_sign_string
#
# Updates the concealed card sign 
#
# @internal

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