#> fetchr:game/start/pre_gen/move_x/4
#
# @within function fetchr:game/start/pre_gen/move_x/3

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 262144.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 262144

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..131071 run function fetchr:game/start/pre_gen/move_x/5
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 131072.. positioned ~2097152 0 0 run function fetchr:game/start/pre_gen/move_x/5