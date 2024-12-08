#> fetchr:game/tick
#
# This function is called every tick when a game is running
#
# @within function fetchr:tick/tick
execute if score $points_goal_announcement_minutes fetchr.settings matches 1.. if score $points_goal_announced fetchr.state matches 0 if score $minutes 91.timer.io >= $points_goal_announcement_minutes fetchr.settings run function fetchr:item_detection/goals/points/announce

execute \
	at @e[type=minecraft:marker, tag=fetchr.spawn, limit=1] \
	positioned over motion_blocking_no_leaves \
	unless block ~ ~ ~ #minecraft:leaves \
	unless block ~ ~1 ~ #minecraft:leaves \
	run teleport @a[predicate=fetchr:is_in_overworld, tag=!fetchr.resourcepack_check] ~ ~ ~
execute \
	at @e[type=minecraft:marker, tag=fetchr.spawn, limit=1] \
	positioned over motion_blocking_no_leaves \
	if block ~ ~ ~ #minecraft:leaves \
	positioned over motion_blocking \
	run teleport @a[predicate=fetchr:is_in_overworld, tag=!fetchr.resourcepack_check] ~ ~ ~
execute \
	at @e[type=minecraft:marker, tag=fetchr.spawn, limit=1] \
	positioned over motion_blocking_no_leaves \
	unless block ~ ~ ~ #minecraft:leaves \
	if block ~ ~1 ~ #minecraft:leaves \
	positioned over motion_blocking \
	run teleport @a[predicate=fetchr:is_in_overworld, tag=!fetchr.resourcepack_check] ~ ~ ~
execute as @a[predicate=fetchr:is_in_game] at @s run function fetchr:game/player_tick

#>
# Count of players in the game
#
# @private
#declare score_holder $game/tick.player_count
execute store result score $game/tick.player_count fetchr.tmp if entity @a[gamemode=survival, predicate=fetchr:is_in_game]
#>
# Count of players sleeping
#
# @private
#declare score_holder $game/tick.sleeping_players
execute store result score $game/tick.sleeping_players fetchr.tmp if entity @a[gamemode=survival, scores={fetchr.bed=99..}, predicate=fetchr:is_in_game]

execute if score $game/tick.player_count fetchr.tmp matches 1.. if score $game/tick.player_count fetchr.tmp = $game/tick.sleeping_players fetchr.tmp if entity @a[scores={fetchr.bed=99}, limit=1] run function fetchr:game/skip_night

scoreboard players operation $raw 91.timer.io /= $current_percision 91.timer.io
execute in fetchr:lobby unless score $raw 91.timer.io = $last_tick_second fetchr.state run function fetchr:custom_hud/components/timer/update
