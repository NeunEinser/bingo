#> fetchr:lobby/settings/update_operator_only_sign_string
#
# Updates the operator-only sign 
#
# @internal

#NEUN_SCRIPT until 69
#execute \
	if score $operator_only fetchr.setting_values matches 0 \
	run data \
		modify storage fetchr:settings operator_only \
		set value '{ "translate": "options.off", "color": "gray" }'
#execute \
	if score $operator_only fetchr.setting_values matches 1 \
	run data \
		modify storage fetchr:settings operator_only \
		set value '{ "translate": "options.on", "color": "green" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score $operator_only fetchr.setting_values matches 0 \
	run data \
		modify storage fetchr:settings operator_only \
		set value { translate: "options.off", color: "gray" }
execute \
	if score $operator_only fetchr.setting_values matches 1 \
	run data \
		modify storage fetchr:settings operator_only \
		set value { translate: "options.on", color: "green" }
#NEUN_SCRIPT end