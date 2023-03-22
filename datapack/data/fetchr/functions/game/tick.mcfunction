#> fetchr:game/tick
#
# This function is called every tick when a game is running
#
# @within function fetchr:tick/tick

#execute in fetchr:lobby run function neun_einser.timer:detect_pause
teleport @a[predicate=fetchr:is_in_overworld, tag=!fetchr.resourcepack_check] @e[type=minecraft:marker, tag=fetchr.spawn, limit=1]
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

scoreboard players operation $raw 91.timer.time /= 100 fetchr.const
execute in fetchr:lobby unless score $raw 91.timer.time = $last_tick_second fetchr.state run function fetchr:custom_hud/components/timer/update