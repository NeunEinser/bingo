#> fetchr:game/start/move_x/f
#
# @within function fetchr:game/start/move_x/e

execute if score $game/start.spawnx fetchr.tmp matches 2.. run scoreboard players remove $game/start.spawnx fetchr.tmp 2

execute if score $game/start.spawnx fetchr.tmp matches ..0 run function fetchr:game/start/move_z/0
execute if score $game/start.spawnx fetchr.tmp matches 1.. positioned ~762 ~ ~ run function fetchr:game/start/move_z/0