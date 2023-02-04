#> fetchr:game/start/create_skybox/create_drop_chute
#
# Moves the spawn marker to the current position
#
# @within function fetchr:game/start/create_skybox/place_dirt
# @context
# 	entity Spawn marker
# 	position The exact spawn point (x, y, z)

teleport @s ~ ~ ~
execute store result score $spawn_x fetchr.state run data get entity @s Pos[0]
execute store result score $spawn_z fetchr.state run data get entity @s Pos[2]

fill ~ 317 ~ ~ 318 ~ minecraft:air

execute if score $game/start/find_ground.y fetchr.tmp matches ..253 run fill ~-1 ~ ~-1 ~1 ~66 ~1 minecraft:barrier replace #fetchr:sky_box_chute_replaceables
execute if score $game/start/find_ground.y fetchr.tmp matches ..253 run fill ~ 0 ~ ~ ~65 ~ minecraft:air replace minecraft:barrier
execute if score $game/start/find_ground.y fetchr.tmp matches ..253 positioned ~ ~64 ~ run function fetchr:game/start/create_skybox/spawn_players

execute if score $game/start/find_ground.y fetchr.tmp matches 254.. run fill ~-1 ~ ~-1 ~1 319 ~1 minecraft:barrier replace #fetchr:sky_box_chute_replaceables
execute if score $game/start/find_ground.y fetchr.tmp matches 254.. run fill ~ 0 ~ ~ 318 ~ minecraft:air replace minecraft:barrier
execute if score $game/start/find_ground.y fetchr.tmp matches 254.. positioned ~ 317 ~ run function fetchr:game/start/create_skybox/spawn_players