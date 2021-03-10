#> bingo:game/go_to_lobby
#
# Moves @s to the lobby
#
# @within function bingo:game/tick
# @context
# 	entity The player who wants to go back to the lobby

effect clear @s
execute in bingo:lobby run tp 0 64 0
execute at @s run spawnpoint
scoreboard players reset @s bingo.lobby