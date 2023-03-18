#> fetchr:game/start/create_skybox/find_ground_level/move_8
#
# @within function fetchr:game/start/create_skybox/find_ground_level/move_7
# @context
# 	entity Spawn marker
# 	position current y coordinate at spawn

execute if score $game/start/find_ground.offset fetchr.tmp matches 2.. run scoreboard players remove $game/start/find_ground.offset fetchr.tmp 2

execute if score $game/start/find_ground.offset fetchr.tmp matches 0 run function fetchr:game/start/create_skybox/find_ground_level/iter
execute if score $game/start/find_ground.offset fetchr.tmp matches 1 positioned ~ ~1 ~ run function fetchr:game/start/create_skybox/find_ground_level/iter