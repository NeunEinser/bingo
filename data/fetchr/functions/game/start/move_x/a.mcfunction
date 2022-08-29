#> fetchr:game/start/move_x/a
#
# @within function fetchr:game/start/move_x/9

execute if score $game/start.spawnx fetchr.tmp matches 64.. run scoreboard players remove $game/start.spawnx fetchr.tmp 64

execute if score $game/start.spawnx fetchr.tmp matches ..31 run function fetchr:game/start/move_x/b
execute if score $game/start.spawnx fetchr.tmp matches 32.. positioned ~24384 ~ ~ run function fetchr:game/start/move_x/b