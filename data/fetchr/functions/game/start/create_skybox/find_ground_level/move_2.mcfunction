#> fetchr:game/start/create_skybox/find_ground_level/move_2
#
# @within function fetchr:game/start/create_skybox/find_ground_level/move_1
# @context
# 	entity Spawn marker
# 	position current y coordinate at spawn

execute if score $game/start/find_ground.offset fetchr.tmp matches 128.. run scoreboard players remove $game/start/find_ground.offset fetchr.tmp 128

execute if score $game/start/find_ground.offset fetchr.tmp matches ..63 run function fetchr:game/start/create_skybox/find_ground_level/move_3
execute if score $game/start/find_ground.offset fetchr.tmp matches 64.. positioned ~ ~64 ~ run function fetchr:game/start/create_skybox/find_ground_level/move_3