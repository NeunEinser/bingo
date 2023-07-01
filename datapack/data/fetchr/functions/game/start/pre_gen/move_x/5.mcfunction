#> fetchr:game/start/pre_gen/move_x/5
#
# @within function fetchr:game/start/pre_gen/move_x/4

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 131072.. run scoreboard players remove $game_start/pre_gen/goto.x fetchr.tmp 131072

execute if score $game_start/pre_gen/goto.x fetchr.tmp matches ..65535 run function fetchr:game/start/pre_gen/move_x/6
execute if score $game_start/pre_gen/goto.x fetchr.tmp matches 65536.. positioned ~1048576 0 0 run function fetchr:game/start/pre_gen/move_x/6