#> bingo:game/player_tick
#
# This function is called for every player while the game is running
#
# @within function bingo:game/tick
# @context entity Player

scoreboard players enable @s bingo.lobby
execute if entity @s[scores={bingo.lobby=1}] run function bingo:util/go_to_lobby