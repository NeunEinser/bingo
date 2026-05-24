#> fetchr:lobby/settings/set_points_goal_internal
#
# Sets the points race minutes to the score of the current player
#
# @context
# 	entity The player who is changing the setting
# @input
# 	score @s fetchr.points_race_minutes The minutes when the points goal triggers

scoreboard players operation $points_goal_announcement_minutes fetchr.setting_values = @s fetchr.points_race_minutes

execute \
	if score @s fetchr.points_race_minutes matches ..0 \
	run tellraw @s { "translate": "fetchr.settings.points_goal.confirmation.toggle_off", "color": "green" }
execute \
	if score @s fetchr.points_race_minutes matches 1.. \
	run tellraw @s {\
		"translate": "fetchr.settings.points_goal.confirmation.set_value",\
		"color": "green",\
		"with": [{ "score": { "name": "@s", "objective": "fetchr.points_race_minutes" }}]\
	}

scoreboard players reset @s fetchr.points_race_minutes

scoreboard players operation @s fetchr.settings = @s fetchr.setting_callback
scoreboard players reset @s fetchr.setting_callback

function fetchr:lobby/settings/update_points_goal_sign_string
function fetchr:lobby/place_indestructible_blocks