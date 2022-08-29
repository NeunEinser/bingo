#> fetchr:game/start/move_z/e
#
# @within function fetchr:game/start/move_z/d

execute if score $game/start.spawnz fetchr.tmp matches 4.. run scoreboard players remove $game/start.spawnz fetchr.tmp 4

execute if score $game/start.spawnz fetchr.tmp matches ..1 run function fetchr:game/start/move_z/f
execute if score $game/start.spawnz fetchr.tmp matches 2.. positioned ~ ~ ~1524 run function fetchr:game/start/move_z/f