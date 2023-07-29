#> fetchr:util/go_to_lobby
#
# Moves @s to the lobby
#
# @internal
# @context
# 	entity The player who wants to go back to the lobby

effect clear @s
execute in fetchr:lobby run teleport @s -8.5 3 7.5 180 0
execute at @s run spawnpoint
scoreboard players reset @s fetchr.lobby
scoreboard players reset @s fetchr.spectator
scoreboard players reset @s fetchr.resource_pack_check

tag @s remove fetchr.spectator
tag @s remove fetchr.in_skybox
scoreboard players set @s fetchr.update_hud 1

gamemode survival

schedule function fetchr:lobby/place_indestructible_blocks 1t replace