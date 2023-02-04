#> fetchr:game/start/create_skybox/find_ground_level/move_6
#
# @within function fetchr:game/start/create_skybox/find_ground_level/move_5
# @context
# 	entity Spawn marker
# 	position current y coordinate at spawn

execute if score $game/start/find_ground.offset fetchr.tmp matches 8.. run scoreboard players remove $game/start/find_ground.offset fetchr.tmp 8

execute if score $game/start/find_ground.offset fetchr.tmp matches ..3 run function fetchr:game/start/create_skybox/find_ground_level/move_7
execute if score $game/start/find_ground.offset fetchr.tmp matches 4.. positioned ~ ~4 ~ run function fetchr:game/start/create_skybox/find_ground_level/move_7