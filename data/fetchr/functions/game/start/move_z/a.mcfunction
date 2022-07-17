#> fetchr:game/start/move_z/a
#
# @within function fetchr:game/start/move_z/9

execute if score $game/start.spawnz fetchr.tmp matches 64.. run scoreboard players remove $game/start.spawnz fetchr.tmp 64

execute if score $game/start.spawnz fetchr.tmp matches ..31 run function fetchr:game/start/move_z/b
execute if score $game/start.spawnz fetchr.tmp matches 32.. positioned ~ ~ ~29296 run function fetchr:game/start/move_z/b