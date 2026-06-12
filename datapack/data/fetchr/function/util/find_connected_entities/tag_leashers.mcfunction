#> fetchr:util/find_connected_entities/tag_leashers
#
# Tags the entity chain who is leashing each other with fetchr.connected
#
# @within function fetchr:util/find_connected_entities
# @context
# 	entity The entity to check

execute if entity @s[tag=fetchr.visited_leasher] run return 0

tag @s add fetchr.visited_leasher

function fetchr:util/find_root_vehicle
execute at @s run tag @e[distance=..20,tag=fetchr.root_vehicle,limit=1] add fetchr.connected
execute at @s run tag @e[distance=..20,tag=fetchr.root_vehicle,limit=1] remove fetchr.root_vehicle

execute on leasher run function fetchr:util/find_connected_entities/tag_leashers