#> fetchr:lobby/settings/update_points_goal_sign_string
#
# Updates the points goal sign 
#
# @internal

#NEUN_SCRIPT until 69
#data modify block 7 0 7 front_text.messages[0] set value '{\
	"translate": "fetchr.settings.points_goal.value.minutes",\
	"color": "green",\
	"with": [\
		{ "score": { "name": "$points_goal_announcement_minutes", "objective": "fetchr.setting_values" }}\
	]\
}'
#execute \
	if score $points_goal_announcement_minutes fetchr.setting_values matches ..0 \
	run data \
		modify storage fetchr:settings points_goal \
		set value '{ "translate": "options.off", "color": "gray" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
data modify block 7 0 7 front_text.messages[0] set value {\
	translate: "fetchr.settings.points_goal.value.minutes",\
	color: "green",\
	with: [\
		{ score: { name: "$points_goal_announcement_minutes", objective: "fetchr.setting_values" }}\
	]\
}
execute \
	if score $points_goal_announcement_minutes fetchr.setting_values matches ..0 \
	run data \
		modify storage fetchr:settings points_goal \
		set value { translate: "options.off", color: "gray" }
#NEUN_SCRIPT end
execute \
	if score $points_goal_announcement_minutes fetchr.setting_values matches 1.. \
	run data \
		modify storage fetchr:settings points_goal \
		set from block 7 0 7 front_text.messages[0]