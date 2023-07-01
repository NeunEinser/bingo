#> fetchr:game/start/pre_gen/move_x/10
#
# @within function fetchr:game/start/pre_gen/move_x/9

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 4096.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 4096

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..2047 run function fetchr:game/start/pre_gen/move_x/11
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 2048.. positioned ~32768 0 0 run function fetchr:game/start/pre_gen/move_x/11