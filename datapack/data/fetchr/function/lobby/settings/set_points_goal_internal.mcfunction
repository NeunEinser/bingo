#> fetchr:lobby/settings/set_points_goal_internal
#
# Sets the points race minutes to the score of the current player
#
# @context
# 	entity The player who is changing the setting
# @input
# 	score @s fetchr.points_race_minutes The minutes when the points goal triggers

scoreboard players operation $points_goal_announcement_minutes fetchr.setting_values = @s fetchr.points_race_minutes
#NEUN_SCRIPT until 69
#data modify block 7 0 7 front_text.messages[0] set value '{\
	"translate": "fetchr.settings.points_goal.sign.minutes",\
	"color": "green",\
	"with": [\
		{ "score": { "name": "$points_goal_announcement_minutes", "objective": "fetchr.setting_values" }}\
	]\
}'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
data modify block 7 0 7 front_text.messages[0] set value {\
	translate: "fetchr.settings.points_goal.value.minutes",\
	color: "green",\
	with: [\
		{ score: { name: "$points_goal_announcement_minutes", objective: "fetchr.setting_values" }}\
	]\
}
#NEUN_SCRIPT end

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

#NEUN_SCRIPT until 69
#execute \
	if score @s fetchr.points_race_minutes matches ..0 \
	as @e[type=minecraft:marker, tag=fetchr.points_goal_sign, distance=0.., limit=2] \
	run data \
		modify entity @s data.front_text.messages[3] \
		set value '{ "translate": "options.off", "color": "gray" }'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 69
execute \
	if score @s fetchr.points_race_minutes matches ..0 \
	as @e[type=minecraft:marker, tag=fetchr.points_goal_sign, distance=0.., limit=2] \
	run data \
		modify entity @s data.front_text.messages[3] \
		set value { translate: "options.off", color: "gray" }
#NEUN_SCRIPT end
execute \
	if score @s fetchr.points_race_minutes matches 1.. \
	as @e[type=minecraft:marker, tag=fetchr.points_goal_sign, distance=0.., limit=2] \
	run data \
		modify entity @s data.front_text.messages[3] \
		set from block 7 0 7 front_text.messages[0]

scoreboard players reset @s fetchr.points_race_minutes

scoreboard players operation @s fetchr.settings = @s fetchr.setting_callback
scoreboard players reset @s fetchr.setting_callback