#> fetchr:lobby/settings/set_points_goal_internal
#
# Sets the points race minutes to the score of the current player
#
# @context
# 	entity The player who is changing the setting
# @input
# 	score @s fetchr.points_race_minutes The minutes when the points goal triggers

scoreboard players operation $points_goal_announcement_minutes fetchr.settings = @s fetchr.points_race_minutes
data modify block 7 0 7 front_text.messages[0] set value '{"translate": "fetchr.lobby.settings.points_goal.sign.minutes", "color": "green", "with": [{"score": {"name": "$points_goal_announcement_minutes", "objective": "fetchr.settings"}}]}'

execute if score @s fetchr.points_race_minutes matches ..0 run tellraw @s {"translate": "fetchr.lobby.settings.points_goal.menu.set.off", "color": "green"}
execute if score @s fetchr.points_race_minutes matches 1.. run tellraw @s {"translate": "fetchr.lobby.settings.points_goal.menu.set.minutes", "color": "green", "with": [{"score": {"name": "@s", "objective": "fetchr.points_race_minutes"}}]}

execute if score @s fetchr.points_race_minutes matches ..0 as @e[type=minecraft:marker, tag=fetchr.points_goal_sign, distance=0.., limit=2] run data modify entity @s data.front_text.messages[3] set value '{"translate": "fetchr.lobby.settings.points_goal.sign.off", "color": "gray"}'
execute if score @s fetchr.points_race_minutes matches 1.. as @e[type=minecraft:marker, tag=fetchr.points_goal_sign, distance=0.., limit=2] run data modify entity @s data.front_text.messages[3] set from block 7 0 7 front_text.messages[0]

scoreboard players reset @s fetchr.points_race_minutes
scoreboard players enable @s fetchr.points_race_minutes
