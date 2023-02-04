#> fetchr:game/start/create_skybox/find_ground_level/move_1
#
# @within function fetchr:game/start/create_skybox/find_ground_level/iter
# @context
# 	entity Spawn marker
# 	position current y coordinate at spawn

execute if score $game/start/find_ground.offset fetchr.tmp matches ..-1 run scoreboard players add $game/start/find_ground.offset fetchr.tmp 256

execute if score $game/start/find_ground.offset fetchr.tmp matches ..127 run function fetchr:game/start/create_skybox/find_ground_level/move_2
execute if score $game/start/find_ground.offset fetchr.tmp matches 128.. positioned ~ ~128 ~ run function fetchr:game/start/create_skybox/find_ground_level/move_2