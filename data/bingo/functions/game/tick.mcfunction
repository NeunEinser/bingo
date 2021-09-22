#> bingo:game/tick
#
# This function is called every tick when a game is running
#
# This contains some base logic, but most of the stuff happens in
# bingo:custom_hud/display_card or GAMELOOP_TO_BE_IMPLEMENTED
#
# @within function bingo:tick/tick

#execute in bingo:lobby run function neun_einser.timer:detect_pause
tp @a[predicate=bingo:is_in_overworld] @e[type=minecraft:area_effect_cloud, tag=bingo.spawn, limit=1]

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
execute store result score $game/tick.sleeping_players bingo.tmp if entity @a[gamemode=survival, predicate=bingo:is_in_game, nbt={SleepTimer: 99s}]

execute if score $game/tick.player_count bingo.tmp matches 1.. if score $game/tick.player_count bingo.tmp = $game/tick.sleeping_players bingo.tmp run function bingo:game/skip_night

scoreboard players enable @a bingo.lobby
execute as @a[scores={bingo.lobby=1}] run function bingo:util/go_to_lobby
execute as @a[predicate=bingo:is_in_game] unless score @s bingo.game_id = $current_game_id bingo.game_id run function bingo:util/go_to_lobby