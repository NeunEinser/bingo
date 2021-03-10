#> bingo:game/tick
#
# This function is called every tick when a game is running
#
# This contains some base logic, but most of the stuff happens in
# bingo:card_display/display_card or GAMELOOP_TO_BE_IMPLEMENTED
#
# @within function bingo:tick/tick

execute in bingo:lobby run function neun_einser.timer:detect_pause
execute as @a at @s run function bingo:game/emerald_detection/detect_emerald_chunk

scoreboard players enable @a bingo.lobby
execute as @a[scores={bingo.lobby=1}] run function bingo:game/go_to_lobby