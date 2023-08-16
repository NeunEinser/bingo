#> fetchr:game/start/start_falling
#
# Starts the spawn sequence
#
# @within function fetchr:game/start/start_spawn_sequence

execute at @e[type=minecraft:marker, tag=fetchr.spawn, limit=1] run fill ~ ~-1 ~ ~ ~3 ~ minecraft:air
effect give @a[predicate=fetchr:is_in_game] minecraft:resistance infinite 255 true

teleport @e[type=!#fetchr:keep_on_game_start, tag=!fetchr.generated_entity, distance=..10000] ~ -128 ~
kill @e[y=-128, distance=..1]

schedule function fetchr:game/start/until_player_on_ground 20t