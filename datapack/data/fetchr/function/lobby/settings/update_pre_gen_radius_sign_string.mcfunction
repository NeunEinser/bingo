#> fetchr:lobby/settings/update_pre_gen_radius_sign_string
#
# Updates the pre-gen radius sign 
#
# @internal

#NEUN_SCRIPT until 69
#data modify block 7 0 7 front_text.messages[0] set value '{\
	"translate": "fetchr.settings.pre_gen.value.radius",\
	"color": "green",\
	"with": [{ "score": { "name": "$pregeneration_radius", "objective": "fetchr.setting_values" }}]\
}'
#execute \
	if score $pregeneration_radius fetchr.setting_values matches 144 \
	run data \
		modify storage fetchr:settings pre_gen_radius \
		set value '{ "translate": "fetchr.settings.pre_gen.value.minimal", "color": "gray" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
data modify block 7 0 7 front_text.messages[0] set value {\
	translate: "fetchr.settings.pre_gen.value.radius",\
	color: "green",\
	with: [{ score: { name: "$pregeneration_radius", objective: "fetchr.setting_values" }}]\
}
execute \
	if score $pregeneration_radius fetchr.setting_values matches 144 \
	run data \
		modify storage fetchr:settings pre_gen_radius \
		set value { translate: "fetchr.settings.pre_gen.value.minimal", color: "gray" }
#NEUN_SCRIPT end
execute \
	if score $pregeneration_radius fetchr.setting_values matches 145.. \
	run data \
		modify storage fetchr:settings pre_gen_radius \
		set from block 7 0 7 front_text.messages[0]