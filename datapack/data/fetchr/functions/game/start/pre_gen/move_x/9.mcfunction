#> fetchr:game/start/pre_gen/move_x/9
#
# @within function fetchr:game/start/pre_gen/move_x/8

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 8192.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 8192

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..4095 run function fetchr:game/start/pre_gen/move_x/10
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 4096.. positioned ~65536 0 0 run function fetchr:game/start/pre_gen/move_x/10