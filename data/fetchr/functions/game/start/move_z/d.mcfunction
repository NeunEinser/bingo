#> fetchr:game/start/move_z/d
#
# @within function fetchr:game/start/move_z/c

execute if score $game/start.spawnz fetchr.tmp matches 8.. run scoreboard players remove $game/start.spawnz fetchr.tmp 8

execute if score $game/start.spawnz fetchr.tmp matches ..3 run function fetchr:game/start/move_z/e
execute if score $game/start.spawnz fetchr.tmp matches 4.. positioned ~ ~ ~3048 run function fetchr:game/start/move_z/e