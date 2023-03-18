#> fetchr:game/start/create_skybox/spawn_players
#
# Moves the spawn marker to the current position
#
# @within function fetchr:game/start/create_skybox/create_drop_chute
# @context
# 	entity Spawn marker
# 	position The skybox above spawn

scoreboard players add $current_game_id fetchr.game_id 1

setblock ~ ~-1 ~ minecraft:barrier

execute as @a[tag=!fetchr.resourcepack_check] run function fetchr:game/start/create_skybox/spawn_player
execute in fetchr:lobby run function fetchr:game/start/init_teams

schedule function fetchr:game/start/end_of_skybox 30s