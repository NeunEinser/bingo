#> fetchr:game/start/pre_gen/schedule_entity_check
#
# Kills entities that were not present during generation periodically, to let
# players know which entities are going to be there when the game starts.
#
# @within function fetchr:game/**


execute in fetchr:default at @e[type=minecraft:marker, tag=fetchr.spawn, distance=0.., limit=1] run function fetchr:game/start/pre_gen/check_entities

schedule function fetchr:game/start/pre_gen/schedule_entity_check 3s