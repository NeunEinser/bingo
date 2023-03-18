#> fetchr:game/start/end_of_skybox
#
# Starts the spawn sequence
#
# @within function fetchr:game/start/create_skybox/spawn_players

execute in fetchr:default run forceload remove all

execute in fetchr:default at @a[predicate=fetchr:is_in_game, limit=1] run setblock ~ ~-1 ~ minecraft:air
effect give @a[predicate=fetchr:is_in_game] minecraft:resistance 1000000 255 true

schedule function fetchr:game/start/until_player_on_ground 20t