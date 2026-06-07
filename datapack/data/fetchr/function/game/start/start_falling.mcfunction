#> fetchr:game/start/start_falling
#
# Starts the spawn sequence
#
# @within function fetchr:game/start/start_spawn_sequence

execute at @e[type=minecraft:marker, tag=fetchr.spawn, limit=1] run fill ~ ~-1 ~ ~ ~3 ~ minecraft:air
effect give @a[predicate=fetchr:is_in_game] minecraft:resistance infinite 255 true

schedule function fetchr:game/start/until_player_on_ground 20t