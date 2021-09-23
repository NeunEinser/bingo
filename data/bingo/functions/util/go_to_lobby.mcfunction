#> bingo:util/go_to_lobby
#
# Moves @s to the lobby
#
# @internal
# @context
# 	entity The player who wants to go back to the lobby

effect clear @s
execute in bingo:lobby run teleport @s -8.5 3 7.5 180 0
execute in bingo:lobby run spawnpoint @s -9 3 7
execute at @s run spawnpoint
scoreboard players reset @s bingo.lobby
scoreboard players reset @s bingo.resources

gamemode survival