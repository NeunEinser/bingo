#> fetchr:game/start/create_skybox/find_ground_level/move_3
#
# @within function fetchr:game/start/create_skybox/find_ground_level/move_2
# @context
# 	entity Spawn marker
# 	position current y coordinate at spawn

execute if score $game/start/find_ground.offset fetchr.tmp matches 64.. run scoreboard players remove $game/start/find_ground.offset fetchr.tmp 64

execute if score $game/start/find_ground.offset fetchr.tmp matches ..31 run function fetchr:game/start/create_skybox/find_ground_level/move_4
execute if score $game/start/find_ground.offset fetchr.tmp matches 32.. positioned ~ ~32 ~ run function fetchr:game/start/create_skybox/find_ground_level/move_4