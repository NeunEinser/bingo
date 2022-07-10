#> bingo:util/go_to_lobby
#
# Moves @s to the lobby
#
# @internal
# @context
# 	entity The player who wants to go back to the lobby

effect clear @s
execute in bingo:lobby run teleport @s -8.5 3 7.5 180 0
execute at @s run spawnpoint
scoreboard players reset @s bingo.lobby
scoreboard players reset @s bingo.spectator
scoreboard players reset @s bingo.resources

tag @s remove bingo.spectator
scoreboard players set @s bingo.update_hud 1

gamemode survival

schedule function bingo:lobby/place_indestructible_blocks 1t replace