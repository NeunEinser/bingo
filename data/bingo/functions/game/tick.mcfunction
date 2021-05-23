#> bingo:game/tick
#
# This function is called every tick when a game is running
#
# This contains some base logic, but most of the stuff happens in
# bingo:actionbar_display/display_card or GAMELOOP_TO_BE_IMPLEMENTED
#
# @within function bingo:tick/tick

#execute in bingo:lobby run function neun_einser.timer:detect_pause
execute as @a at @s run function bingo:game/emerald_detection/chunk/detect

tp @a[predicate=bingo:is_in_overworld] @e[type=minecraft:area_effect_cloud, tag=bingo.spawn, limit=1]

#>
# Count of players in the game
#
# @private
#declare score_holder $game/tick.player_count
execute store result score $game/tick.player_count bingo.tmp if entity @a[predicate=!bingo:is_in_lobby]

#>
# Count of players sleeping
#
# @private
#declare score_holder $game/tick.sleeping_players
execute store result score $game/tick.sleeping_players bingo.tmp if entity @a[predicate=!bingo:is_in_lobby, nbt={SleepTimer: 100s}]

execute if score $game/tick.player_count bingo.tmp matches 1.. if score $game/tick.player_count bingo.tmp = $game/tick.sleeping_players bingo.tmp run function bingo:game/skip_night

scoreboard players enable @a bingo.lobby
execute as @a[scores={bingo.lobby=1}] run function bingo:game/go_to_lobby