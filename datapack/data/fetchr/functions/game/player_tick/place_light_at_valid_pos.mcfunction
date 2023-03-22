#> fetchr:game/player_tick/place_light_at_valid_pos
#
# Tries to place a light block at the current position and saves the result to
# $game/player/light.placed
#
# @within function fetchr:game/player_tick/on_position_changed
# @context
# 	entity The player
# 	location The position for the light


#>
# @within
# 	function fetchr:game/player_tick/place_light_at_valid_pos
# 	function fetchr:game/player_tick/try_place_light_block
#declare score_holder $game/player/light.placed
scoreboard players set $game/player/light.placed fetchr.tmp 0

execute positioned ~ ~1 ~ run function fetchr:game/player_tick/try_place_light_block
execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~ ~ ~ run function fetchr:game/player_tick/try_place_light_block
execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~ ~-1 ~ run function fetchr:game/player_tick/try_place_light_block

execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~1 ~1 ~ run function fetchr:game/player_tick/try_place_light_block
execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~ ~1 ~1 run function fetchr:game/player_tick/try_place_light_block
execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~-1 ~1 ~ run function fetchr:game/player_tick/try_place_light_block
execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~ ~1 ~-1 run function fetchr:game/player_tick/try_place_light_block

execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~ ~2 ~ run function fetchr:game/player_tick/try_place_light_block

execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~1 ~ ~ run function fetchr:game/player_tick/try_place_light_block
execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~ ~ ~1 run function fetchr:game/player_tick/try_place_light_block
execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~-1 ~ ~ run function fetchr:game/player_tick/try_place_light_block
execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~ ~ ~-1 run function fetchr:game/player_tick/try_place_light_block

execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~ ~-2 ~ run function fetchr:game/player_tick/try_place_light_block

execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~3 ~1 ~ run function fetchr:game/player_tick/try_place_light_block
execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~ ~1 ~3 run function fetchr:game/player_tick/try_place_light_block
execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~-3 ~1 ~ run function fetchr:game/player_tick/try_place_light_block
execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~ ~1 ~-3 run function fetchr:game/player_tick/try_place_light_block

execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~3 ~ ~ run function fetchr:game/player_tick/try_place_light_block
execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~ ~ ~3 run function fetchr:game/player_tick/try_place_light_block
execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~-3 ~ ~ run function fetchr:game/player_tick/try_place_light_block
execute if score $game/player/light.placed fetchr.tmp matches 0 positioned ~ ~ ~-3 run function fetchr:game/player_tick/try_place_light_block