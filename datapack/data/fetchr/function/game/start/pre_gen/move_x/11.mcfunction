#> fetchr:game/start/pre_gen/move_x/11
#
# @within function fetchr:game/start/pre_gen/move_x/10

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 2048.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 2048

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..1023 run function fetchr:game/start/pre_gen/move_x/12
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 1024.. positioned ~16384 0 0 run function fetchr:game/start/pre_gen/move_x/12