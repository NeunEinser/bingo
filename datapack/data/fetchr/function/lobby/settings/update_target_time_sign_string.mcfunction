#> fetchr:lobby/settings/update_target_time_sign_string
#
# Updates the target time sign 
#
# @internal

#NEUN_SCRIPT until 69
#data modify block 7 0 7 front_text.messages[0] set value '{\
	"translate": "fetchr.settings.target_time.value.minutes",\
	"color": "green",\
	"with": [\
		{ "score": { "name": "$target_time_announcement_minutes", "objective": "fetchr.setting_values" }}\
	]\
}'
#execute \
	if score $target_time_announcement_minutes fetchr.setting_values matches ..0 \
	run data \
		modify storage fetchr:settings target_time \
		set value '{ "translate": "options.off", "color": "gray" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
data modify block 7 0 7 front_text.messages[0] set value {\
	translate: "fetchr.settings.target_time.value.minutes",\
	color: "green",\
	with: [\
		{ score: { name: "$target_time_announcement_minutes", objective: "fetchr.setting_values" }}\
	]\
}
execute \
	if score $target_time_announcement_minutes fetchr.setting_values matches ..0 \
	run data \
		modify storage fetchr:settings target_time \
		set value { translate: "options.off", color: "gray" }
#NEUN_SCRIPT end
execute \
	if score $target_time_announcement_minutes fetchr.setting_values matches 1.. \
	run data \
		modify storage fetchr:settings target_time \
		set from block 7 0 7 front_text.messages[0]