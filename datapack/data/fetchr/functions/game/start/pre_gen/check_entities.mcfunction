#> fetchr:game/start/pre_gen/check_entities
#
# This removes all non-generated entities from the game.
#
# @within function fetchr:game/start/pre_gen/schedule_entity_check

execute positioned ~-151 -64 ~-151 as @e[type=!#fetchr:keep_on_game_start, type=!minecraft:marker, type=!minecraft:item_display, type=!minecraft:item_frame, tag=!fetchr.generated_entity, dx=304, dy=384, dz=304] run function fetchr:game/start/pre_gen/kill_non_generated_entity
execute positioned ~-7 -192 ~-7 run kill @e[dx=16, dy=65, dz=16]
execute as @e[type=minecraft:item, distance=..10000] run data merge entity @s {Age: 0s}

execute as @e[distance=128..10000, tag=!fetchr.generated_entity] run function fetchr:game/start/pre_gen/freeze_entity