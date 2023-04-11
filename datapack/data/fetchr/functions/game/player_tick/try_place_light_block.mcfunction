#> fetchr:game/player_tick/try_place_light_block
#
# Tries to place a light block at the current position and saves the result to
# $game/player/light.placed
#
# @within function fetchr:game/player_tick/place_light_at_valid_pos
# @context
# 	entity The player
# 	location The position for the light

#execute if block ~ ~ ~ #fetchr:air unless block ~ ~1 ~ #fetchr:do_not_update_from_air unless block ~ ~-1 ~ #fetchr:do_not_update_from_air unless block ~1 ~ ~ #fetchr:do_not_update_from_air unless block ~-1 ~ ~ #fetchr:do_not_update_from_air unless block ~ ~ ~1 #fetchr:do_not_update_from_air unless block ~ ~ ~-1 #fetchr:do_not_update_from_air align xyz positioned ~.5 ~ ~.5 run particle minecraft:block_marker minecraft:light

execute store success score $game/player/light.placed fetchr.tmp if block ~ ~ ~ #fetchr:air unless block ~ ~1 ~ #fetchr:do_not_update_from_air unless block ~ ~-1 ~ #fetchr:do_not_update_from_air unless block ~1 ~ ~ #fetchr:do_not_update_from_air unless block ~-1 ~ ~ #fetchr:do_not_update_from_air unless block ~ ~ ~1 #fetchr:do_not_update_from_air unless block ~ ~ ~-1 #fetchr:do_not_update_from_air run setblock ~ ~ ~ minecraft:light[level=15]
execute if score $game/player/light.placed fetchr.tmp matches 0 store success score $game/player/light.placed fetchr.tmp if block ~ ~ ~ minecraft:water unless block ~ ~1 ~ #fetchr:do_not_update_from_water unless block ~ ~-1 ~ #fetchr:do_not_update_from_water unless block ~1 ~ ~ #fetchr:do_not_update_from_water unless block ~-1 ~ ~ #fetchr:do_not_update_from_water unless block ~ ~ ~1 #fetchr:do_not_update_from_water unless block ~ ~ ~-1 #fetchr:do_not_update_from_water run setblock ~ ~ ~ minecraft:light[level=10, waterlogged=true]