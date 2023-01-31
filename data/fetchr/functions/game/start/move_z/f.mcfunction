#> fetchr:game/start/move_z/f
#
# @within function fetchr:game/start/move_z/e

execute if score $game/start.spawnz fetchr.tmp matches 2.. run scoreboard players remove $game/start.spawnz fetchr.tmp 2

execute if score $game/start.spawnz fetchr.tmp matches ..0 run function fetchr:game/start/pre_gen/start
execute if score $game/start.spawnz fetchr.tmp matches 1.. positioned ~762 ~ ~ run function fetchr:game/start/pre_gen/start