#> fetchr:settings/prepare_and_show_game_settings
#
# Function that sets all the macro arguments for the custom options dialog and
# then shows the dialog
#
# @within function fetchr:settings/handle_settings

#NEUN_SCRIPT since 79
scoreboard players set @s fetchr.operator_check_callback_action 16
execute \
	if score $operator_only fetchr.setting_values matches 1 \
	unless score @s fetchr.operator matches 1 \
	run return run function fetchr:util/show_confirm_operator_status_prompt

data modify storage tmp.fetchr:settings/dialog custom_options set value {\
	concealed_card: "off",\
	target_time: { translate: "options.off" },\
	lockout_mode: "off",\
	timer_method: "real_time",\
	paused_time: "off",\
	pre_gen: { translate: "fetchr.settings.pre_gen.value.minimal" },\
	show_seed: "off",\
	allow_spectating: "off",\
	operator_only: "off",\
	gamemode: "adventure",\
}

execute \
	if score $concealed_card fetchr.setting_values matches 1 \
	run data modify storage tmp.fetchr:settings/dialog custom_options.concealed_card set value "on"

data modify block 7 0 7 front_text.messages[0] set value {\
	translate: "fetchr.settings.target_time.value.minutes",\
	with: [\
		{ score: { name: "$target_time_announcement_minutes", objective: "fetchr.setting_values" }}\
	]\
}

execute \
	if score $target_time_announcement_minutes fetchr.setting_values matches 1.. \
	run data \
		modify storage tmp.fetchr:settings/dialog custom_options.target_time \
		set from block 7 0 7 front_text.messages[0]

execute \
	if score $lockout_mode fetchr.setting_values matches 1 \
	run data modify storage tmp.fetchr:settings/dialog custom_options.lockout_mode set value "on"

execute \
	if score $use_in_game_time fetchr.setting_values matches 1 \
	run data modify storage tmp.fetchr:settings/dialog custom_options.timer_method set value "in_game_time"

execute \
	if score $count_pauses 91.timer.io matches 1 \
	run data modify storage tmp.fetchr:settings/dialog custom_options.paused_time set value "on"

data modify block 7 0 7 front_text.messages[0] set value {\
	translate: "fetchr.settings.pre_gen.value.radius",\
	with: [{ score: { name: "$pregeneration_radius", objective: "fetchr.setting_values" }}]\
}

execute \
	if score $pregeneration_radius fetchr.setting_values matches 145.. \
	run data \
		modify storage tmp.fetchr:settings/dialog custom_options.pre_gen \
		set from block 7 0 7 front_text.messages[0]

execute \
	if score $show_seed fetchr.setting_values matches 1 \
	run data modify storage tmp.fetchr:settings/dialog custom_options.show_seed set value "on"

execute \
	if score $allow_spectating fetchr.setting_values matches 1 \
	run data modify storage tmp.fetchr:settings/dialog custom_options.allow_spectating set value "on"

execute \
	if score $operator_only fetchr.setting_values matches 1 \
	run data modify storage tmp.fetchr:settings/dialog custom_options.operator_only set value "on"

execute \
	if score $lobby_gamemode fetchr.setting_values matches 1 \
	run data modify storage tmp.fetchr:settings/dialog custom_options.gamemode set value "survival"

execute \
	if score $is_multiplayer fetchr.state matches 1 \
	run function fetchr:settings/show_game_settings_dialog with storage tmp.fetchr:settings/dialog custom_options

execute \
	if score $is_multiplayer fetchr.state matches 0 \
	run function fetchr:settings/show_game_settings_dialog_singleplayer with storage tmp.fetchr:settings/dialog custom_options
#NEUN_SCRIPT end