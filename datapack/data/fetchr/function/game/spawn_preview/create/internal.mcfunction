#> fetchr:game/spawn_preview/create/internal
#
# This function creates the spawn preview after all chunks are generated
#
# @within function fetchr:game/spawn_preview/create/exec
# @context
# 	entity Spawn marker
# 	position Spawn location

tag @s add fetchr.spawn
#>
# @within
# 	fetchr:game/spawn_preview/create/*
#declare score_holder $game/start/find_ground.y
scoreboard players set $game/start/find_ground.y fetchr.tmp 0

function fetchr:game/spawn_preview/create/find_ground_level_in_row
execute positioned ~ ~ ~1 run function fetchr:game/spawn_preview/create/find_ground_level_in_row
execute positioned ~ ~ ~2 run function fetchr:game/spawn_preview/create/find_ground_level_in_row
execute positioned ~ ~ ~3 run function fetchr:game/spawn_preview/create/find_ground_level_in_row
execute positioned ~ ~ ~4 run function fetchr:game/spawn_preview/create/find_ground_level_in_row
execute positioned ~ ~ ~5 run function fetchr:game/spawn_preview/create/find_ground_level_in_row
execute positioned ~ ~ ~6 run function fetchr:game/spawn_preview/create/find_ground_level_in_row
execute positioned ~ ~ ~7 run function fetchr:game/spawn_preview/create/find_ground_level_in_row
execute positioned ~ ~ ~8 run function fetchr:game/spawn_preview/create/find_ground_level_in_row
execute positioned ~ ~ ~9 run function fetchr:game/spawn_preview/create/find_ground_level_in_row
execute positioned ~ ~ ~10 run function fetchr:game/spawn_preview/create/find_ground_level_in_row
execute positioned ~ ~ ~11 run function fetchr:game/spawn_preview/create/find_ground_level_in_row
execute positioned ~ ~ ~12 run function fetchr:game/spawn_preview/create/find_ground_level_in_row
execute positioned ~ ~ ~13 run function fetchr:game/spawn_preview/create/find_ground_level_in_row
execute positioned ~ ~ ~14 run function fetchr:game/spawn_preview/create/find_ground_level_in_row
execute positioned ~ ~ ~15 run function fetchr:game/spawn_preview/create/find_ground_level_in_row

execute positioned ~7 ~ ~7 positioned over motion_blocking run function fetchr:game/spawn_preview/create/place_dirt

teleport @s ~ ~ ~
execute store result entity @s Pos[1] double 1 run scoreboard players get $game/start/find_ground.y fetchr.tmp

execute if score $game/start/find_ground.y fetchr.tmp matches ..112 positioned ~ 127 ~ run function fetchr:game/spawn_preview/create/create_player_area
execute if score $game/start/find_ground.y fetchr.tmp matches 113..298 at @s positioned ~ ~15 ~ run function fetchr:game/spawn_preview/create/create_player_area
execute if score $game/start/find_ground.y fetchr.tmp matches 299.. positioned ~ 313 ~ run function fetchr:game/spawn_preview/create/create_player_area