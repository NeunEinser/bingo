#> fetchr:game/start/move_x/1
#
# @within function fetchr:game/start/move_x/0

execute if score $game/start.spawnx fetchr.tmp matches ..-1 run scoreboard players add $game/start.spawnx fetchr.tmp 32768

execute if score $game/start.spawnx fetchr.tmp matches ..16383 run function fetchr:game/start/move_x/2
execute if score $game/start.spawnx fetchr.tmp matches 16384.. positioned ~14999552 ~ ~ run function fetchr:game/start/move_x/2