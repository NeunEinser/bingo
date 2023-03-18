#> fetchr:game/start/create_skybox/find_ground_level/end
#
# Places dirt if spawn is above water, or if spawn is below sea level
#
# @within function fetchr:game/start/create_skybox/find_ground_level/iter
# @context
# 	entity Spawn marker
# 	position the lowest non-air block with sky access at spawn

scoreboard players remove $game/start/find_ground.y fetchr.tmp 1
execute unless block ~ ~-1 ~ #fetchr:tall_plants positioned ~.5 ~-1 ~.5 run function fetchr:game/start/create_skybox/place_dirt

execute if block ~ ~-1 ~ #fetchr:tall_plants run scoreboard players remove $game/start/find_ground.y fetchr.tmp 2
execute if block ~ ~-1 ~ #fetchr:tall_plants positioned ~.5 ~-3 ~.5 run function fetchr:game/start/create_skybox/place_dirt