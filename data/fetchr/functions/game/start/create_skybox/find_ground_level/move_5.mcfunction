#> fetchr:game/start/create_skybox/find_ground_level/move_5
#
# @within function fetchr:game/start/create_skybox/find_ground_level/move_4
# @context
# 	entity Spawn marker
# 	position current y coordinate at spawn

execute if score $game/start/find_ground.offset fetchr.tmp matches 16.. run scoreboard players remove $game/start/find_ground.offset fetchr.tmp 16

execute if score $game/start/find_ground.offset fetchr.tmp matches ..7 run function fetchr:game/start/create_skybox/find_ground_level/move_6
execute if score $game/start/find_ground.offset fetchr.tmp matches 8.. positioned ~ ~8 ~ run function fetchr:game/start/create_skybox/find_ground_level/move_6