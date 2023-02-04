#> fetchr:game/start/create_skybox/find_ground_level/move_4
#
# @within function fetchr:game/start/create_skybox/find_ground_level/move_3
# @context
# 	entity Spawn marker
# 	position current y coordinate at spawn

execute if score $game/start/find_ground.offset fetchr.tmp matches 32.. run scoreboard players remove $game/start/find_ground.offset fetchr.tmp 32

execute if score $game/start/find_ground.offset fetchr.tmp matches ..15 run function fetchr:game/start/create_skybox/find_ground_level/move_5
execute if score $game/start/find_ground.offset fetchr.tmp matches 16.. positioned ~ ~16 ~ run function fetchr:game/start/create_skybox/find_ground_level/move_5