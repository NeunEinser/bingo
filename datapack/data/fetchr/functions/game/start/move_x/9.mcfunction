#> fetchr:game/start/move_x/9
#
# @within function fetchr:game/start/move_x/8

execute if score $game/start.spawnx fetchr.tmp matches 128.. run scoreboard players remove $game/start.spawnx fetchr.tmp 128

execute if score $game/start.spawnx fetchr.tmp matches ..63 run function fetchr:game/start/move_x/a
execute if score $game/start.spawnx fetchr.tmp matches 64.. positioned ~48768 ~ ~ run function fetchr:game/start/move_x/a