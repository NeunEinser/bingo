#> fetchr:lobby/settings/update_show_seed_sign_string
#
# Updates the show seed sign 
#
# @internal

#NEUN_SCRIPT until 69
#execute \
	if score $show_seed fetchr.setting_values matches 0 \
	run data \
		modify storage fetchr:settings show_seed \
		set value '{ "translate": "options.off", "color": "gray" }'
#execute \
	if score $show_seed fetchr.setting_values matches 1 \
	run data \
		modify storage fetchr:settings show_seed \
		set value '{ "translate": "options.on", "color": "green" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score $show_seed fetchr.setting_values matches 0 \
	run data \
		modify storage fetchr:settings show_seed \
		set value { translate: "options.off", color: "gray" }
execute \
	if score $show_seed fetchr.setting_values matches 1 \
	run data \
		modify storage fetchr:settings show_seed \
		set value { translate: "options.on", color: "green" }
#NEUN_SCRIPT end