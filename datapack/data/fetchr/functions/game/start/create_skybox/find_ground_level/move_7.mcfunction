#> fetchr:game/start/create_skybox/find_ground_level/move_7
#
# @within function fetchr:game/start/create_skybox/find_ground_level/move_6
# @context
# 	entity Spawn marker
# 	position current y coordinate at spawn

execute if score $game/start/find_ground.offset fetchr.tmp matches 4.. run scoreboard players remove $game/start/find_ground.offset fetchr.tmp 4

execute if score $game/start/find_ground.offset fetchr.tmp matches ..1 run function fetchr:game/start/create_skybox/find_ground_level/move_8
execute if score $game/start/find_ground.offset fetchr.tmp matches 2.. positioned ~ ~2 ~ run function fetchr:game/start/create_skybox/find_ground_level/move_8