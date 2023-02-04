#> fetchr:game/start/pre_gen/goto_current_chunk
#
# @within
# 	function fetchr:game/start/pre_gen/initialize
# 	function fetchr:game/start/pre_gen/schedule

#>
# @within
# 	function fetchr:game/start/pre_gen/goto_current_chunk
# 	function fetchr:game/start/pre_gen/goto_current_chunk/*
#declare score_holder $game_start/pre_gen/goto.x
scoreboard players operation $game_start/pre_gen/goto.x fetchr.tmp = $game_start/pre_gen.x fetchr.tmp
#>
# @within
# 	function fetchr:game/start/pre_gen/goto_current_chunk
# 	function fetchr:game/start/pre_gen/goto_current_chunk/*
#declare score_holder $game_start/pre_gen/goto.z
scoreboard players operation $game_start/pre_gen/goto.z fetchr.tmp = $game_start/pre_gen.z fetchr.tmp

#>
# @private
#declare score_holder $game_start/pre_gen.chunks_left
#TODO configurable max
scoreboard players set $game_start/pre_gen.chunks_left fetchr.tmp 1681
scoreboard players operation $game_start/pre_gen.chunks_left fetchr.tmp -= $game_start/pre_gen.i fetchr.tmp

#>
# Remaining chunks in current direction
#
# @within
# 	function fetchr:game/start/pre_gen/*
#declare score_holder $game_start/pre_gen.chunks_left_in_tick
scoreboard players operation $game_start/pre_gen.chunks_left_in_tick fetchr.tmp = $game_start/pre_gen.chunks_per_tick fetchr.tmp
scoreboard players operation $game_start/pre_gen.chunks_left_in_tick fetchr.tmp < $game_start/pre_gen.chunks_left fetchr.tmp

execute if score $game_start/pre_gen.chunks_left fetchr.tmp matches 1.. if score $game_start/pre_gen/goto.x fetchr.tmp matches 0.. run function fetchr:game/start/pre_gen/goto_current_chunk/1
execute if score $game_start/pre_gen.chunks_left fetchr.tmp matches 1.. if score $game_start/pre_gen/goto.x fetchr.tmp matches ..-1 positioned ~-16384 ~ ~ run function fetchr:game/start/pre_gen/goto_current_chunk/1

execute if score $game_start/pre_gen.chunks_left fetchr.tmp matches 0 run scoreboard players set $pregen_status fetchr.state 2
execute if score $game_start/pre_gen.chunks_left fetchr.tmp matches 0 if score $game_state fetchr.state matches 1 run function fetchr:game/start/create_skybox/find_ground_level/exec