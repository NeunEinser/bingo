#> fetchr:game/start/pre_gen/goto_current_chunk/14
#
# @within function fetchr:game/start/pre_gen/goto_current_chunk/13

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 256.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 256

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..127 run function fetchr:game/start/pre_gen/goto_current_chunk/15
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 128.. positioned ~ ~ ~2048 run function fetchr:game/start/pre_gen/goto_current_chunk/15