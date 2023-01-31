#> fetchr:game/start/pre_gen/goto_current_chunk/16
#
# @within function fetchr:game/start/pre_gen/goto_current_chunk/15

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 64.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 64

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..31 run function fetchr:game/start/pre_gen/goto_current_chunk/17
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 32.. positioned ~ ~ ~512 run function fetchr:game/start/pre_gen/goto_current_chunk/17