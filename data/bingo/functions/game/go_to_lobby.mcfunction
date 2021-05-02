#> bingo:game/go_to_lobby
#
# Moves @s to the lobby
#
# @within function bingo:game/tick
# @context
# 	entity The player who wants to go back to the lobby

effect clear @s
execute in bingo:lobby run teleport @s -8.5 1.0625 7.5 180 0
execute in bingo:lobby run spawnpoint @s -9 1 7
execute at @s run spawnpoint
scoreboard players reset @s bingo.lobby