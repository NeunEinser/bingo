#> bingo:game/tick
#
# This function is called every tick when a game is running
#
# @within function bingo:tick/tick

#execute in bingo:lobby run function neun_einser.timer:detect_pause
teleport @a[predicate=bingo:is_in_overworld, tag=!bingo.resourcepack_check] @e[type=minecraft:area_effect_cloud, tag=bingo.spawn, limit=1]
execute as @a[predicate=bingo:is_in_game] run function bingo:game/player_tick

#>
# Count of players in the game
#
# @private
#declare score_holder $game/tick.player_count
execute store result score $game/tick.player_count bingo.tmp if entity @a[gamemode=survival, predicate=bingo:is_in_game]
#>
# Count of players sleeping
#
# @private
#declare score_holder $game/tick.sleeping_players
execute store result score $game/tick.sleeping_players bingo.tmp if entity @a[gamemode=survival, scores={bingo.bed=99..}, predicate=bingo:is_in_game]

execute if score $game/tick.player_count bingo.tmp matches 1.. if score $game/tick.player_count bingo.tmp = $game/tick.sleeping_players bingo.tmp if entity @a[scores={bingo.bed=99}, limit=1] run function bingo:game/skip_night

scoreboard players operation $raw 91.timer.time /= 100 bingo.const
execute in bingo:lobby unless score $raw 91.timer.time = $last_tick_second bingo.state run function bingo:custom_hud/components/timer/update