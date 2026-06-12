#> fetchr:lobby/settings/set_target_time_internal
#
# Sets the target time minutes to the score of the current player
#
# @context
# 	entity The player who is changing the setting
# @input
# 	score @s fetchr.target_time_minutes The minutes when the target time triggers

scoreboard players operation $target_time_announcement_minutes fetchr.setting_values = @s fetchr.target_time_minutes

execute \
	if score @s fetchr.target_time_minutes matches ..0 \
	run tellraw @s { "translate": "fetchr.settings.target_time.confirmation.toggle_off", "color": "green" }
execute \
	if score @s fetchr.target_time_minutes matches 1.. \
	run tellraw @s {\
		"translate": "fetchr.settings.target_time.confirmation.set_value",\
		"color": "green",\
		"with": [{ "score": { "name": "@s", "objective": "fetchr.target_time_minutes" }}]\
	}

scoreboard players reset @s fetchr.target_time_minutes

scoreboard players operation @s fetchr.settings = @s fetchr.setting_callback
scoreboard players reset @s fetchr.setting_callback

function fetchr:lobby/settings/update_target_time_sign_string
function fetchr:lobby/place_indestructible_blocks