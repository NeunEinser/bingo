#> fetchr:game/start/pre_gen/goto_current_chunk/15
#
# @within function fetchr:game/start/pre_gen/goto_current_chunk/14

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 128.. run scoreboard players remove $game_start/pre_gen/goto.z fetchr.tmp 128

execute if score $game_start/pre_gen/goto.z fetchr.tmp matches ..63 run function fetchr:game/start/pre_gen/goto_current_chunk/16
execute if score $game_start/pre_gen/goto.z fetchr.tmp matches 64.. positioned ~ ~ ~1024 run function fetchr:game/start/pre_gen/goto_current_chunk/16