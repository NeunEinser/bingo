#> fetchr:game/start/move_z/b
#
# @within function fetchr:game/start/move_z/a

execute if score $game/start.spawnz fetchr.tmp matches 32.. run scoreboard players remove $game/start.spawnz fetchr.tmp 32

execute if score $game/start.spawnz fetchr.tmp matches ..15 run function fetchr:game/start/move_z/c
execute if score $game/start.spawnz fetchr.tmp matches 16.. positioned ~ ~ ~12192 run function fetchr:game/start/move_z/c