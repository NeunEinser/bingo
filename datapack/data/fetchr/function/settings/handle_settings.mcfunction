#> fetchr:settings/handle_settings
#
# Function that is run when the settings trigger is changed
#
# @within function fetchr:tick/player_tick

execute \
	if score @s fetchr.settings matches 1 \
	run dialog clear @s

execute \
	if score @s fetchr.settings matches 2 \
	if score @s fetchr.last_tick_pause_time matches ..1 \
	run dialog show @s fetchr:custom_options

execute \
	if score @s fetchr.settings matches 3 \
	run function fetchr:settings/prepare_and_show_custom_options

execute \
	if score @s fetchr.settings matches 6 \
	in fetchr:lobby \
	run function fetchr:lobby/settings/toggle_concealed_card

execute \
	if score @s fetchr.settings matches 7 \
	in fetchr:lobby \
	run function fetchr:lobby/settings/set_points_goal

execute \
	if score @s fetchr.settings matches 8 \
	in fetchr:lobby \
	run function fetchr:lobby/settings/toggle_lockout_mode

execute \
	if score @s fetchr.settings matches 6.. \
	run function fetchr:settings/prepare_and_show_custom_options

scoreboard players reset @s fetchr.settings