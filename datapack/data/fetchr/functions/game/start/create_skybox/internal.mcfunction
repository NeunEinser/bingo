#> fetchr:game/start/create_skybox/internal
#
# This function spawns the skybox after all chunks are generated
#
# @within function fetchr:game/start/create_skybox/exec
# @context
# 	entity Spawn marker
# 	position Spawn location

tag @s add fetchr.spawn
#>
# @within
# 	fetchr:game/start/create_skybox/*
#declare score_holder $game/start/find_ground.y
scoreboard players set $game/start/find_ground.y fetchr.tmp 0

function fetchr:game/start/create_skybox/find_ground_level_in_row
execute positioned ~ ~ ~1 run function fetchr:game/start/create_skybox/find_ground_level_in_row
execute positioned ~ ~ ~2 run function fetchr:game/start/create_skybox/find_ground_level_in_row
execute positioned ~ ~ ~3 run function fetchr:game/start/create_skybox/find_ground_level_in_row
execute positioned ~ ~ ~4 run function fetchr:game/start/create_skybox/find_ground_level_in_row
execute positioned ~ ~ ~5 run function fetchr:game/start/create_skybox/find_ground_level_in_row
execute positioned ~ ~ ~6 run function fetchr:game/start/create_skybox/find_ground_level_in_row
execute positioned ~ ~ ~7 run function fetchr:game/start/create_skybox/find_ground_level_in_row
execute positioned ~ ~ ~8 run function fetchr:game/start/create_skybox/find_ground_level_in_row
execute positioned ~ ~ ~9 run function fetchr:game/start/create_skybox/find_ground_level_in_row
execute positioned ~ ~ ~10 run function fetchr:game/start/create_skybox/find_ground_level_in_row
execute positioned ~ ~ ~11 run function fetchr:game/start/create_skybox/find_ground_level_in_row
execute positioned ~ ~ ~12 run function fetchr:game/start/create_skybox/find_ground_level_in_row
execute positioned ~ ~ ~13 run function fetchr:game/start/create_skybox/find_ground_level_in_row
execute positioned ~ ~ ~14 run function fetchr:game/start/create_skybox/find_ground_level_in_row
execute positioned ~ ~ ~15 run function fetchr:game/start/create_skybox/find_ground_level_in_row

execute positioned ~7 ~ ~7 positioned over motion_blocking run function fetchr:game/start/create_skybox/place_dirt

teleport @s ~ ~ ~
execute store result entity @s Pos[1] double 1 run scoreboard players get $game/start/find_ground.y fetchr.tmp

execute if score $game/start/find_ground.y fetchr.tmp matches ..112 positioned ~ 127 ~ run function fetchr:game/start/create_skybox/create_player_area
execute if score $game/start/find_ground.y fetchr.tmp matches 113..299 at @s positioned ~ ~15 ~ run function fetchr:game/start/create_skybox/create_player_area
execute if score $game/start/find_ground.y fetchr.tmp matches 300.. positioned ~ 314 ~ run function fetchr:game/start/create_skybox/create_player_area