#> fetchr:settings/prepare_and_show_custom_options
#
# Function that sets all the macro arguments for the custom options dialog and
# then shows the dialog
#
# @within function fetchr:settings/handle_settings

data modify storage tmp.fetchr:settings/dialog custom_options set value {\
	concealed_card: "off",\
	points_goal: { translate: "options.off" },\
	lockout_mode: "off",\
}

execute \
	if score $concealed_card fetchr.setting_values matches 1 \
	run data modify storage tmp.fetchr:settings/dialog custom_options.concealed_card set value "on"

data modify block 7 0 7 front_text.messages[0] set value {\
	translate: "fetchr.settings.points_goal.value.minutes",\
	with: [\
		{ score: { name: "$points_goal_announcement_minutes", objective: "fetchr.setting_values" }}\
	]\
}

execute \
	if score $points_goal_announcement_minutes fetchr.setting_values matches 1.. \
	run data \
		modify storage tmp.fetchr:settings/dialog custom_options.points_goal \
		set from block 7 0 7 front_text.messages[0]

execute \
	if score $lockout_mode fetchr.setting_values matches 1 \
	run data modify storage tmp.fetchr:settings/dialog custom_options.lockout_mode set value "on"

function fetchr:settings/show_custom_options_dialog with storage tmp.fetchr:settings/dialog custom_options