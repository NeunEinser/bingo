#> fetchr:game/start/pre_gen/goto_current_chunk/18
#
# @within function fetchr:game/start/pre_gen/goto_current_chunk/17

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 16.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 16

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..7 run function fetchr:game/start/pre_gen/goto_current_chunk/19
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 8.. positioned ~ ~ ~128 run function fetchr:game/start/pre_gen/goto_current_chunk/19