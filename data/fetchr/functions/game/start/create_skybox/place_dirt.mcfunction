#> fetchr:game/start/create_skybox/place_dirt
#
# Places dirt if spawn is above water, or if spawn is below sea level
#
# @within function fetchr:game/start/create_skybox/find_ground_level/end
# @context
# 	entity Spawn marker
# 	position the lowest non-air block with sky access at spawn

execute if block ~ ~ ~ #fetchr:liquids run setblock ~ ~ ~ minecraft:dirt
execute if score $game/start/find_ground.y fetchr.tmp matches ..62 run fill ~ ~ ~ ~ 62 ~ minecraft:dirt

execute if score $game/start/find_ground.y fetchr.tmp matches 63.. run function fetchr:game/start/create_skybox/create_drop_chute
execute if score $game/start/find_ground.y fetchr.tmp matches ..62 positioned ~ 63 ~ run function fetchr:game/start/create_skybox/create_drop_chute