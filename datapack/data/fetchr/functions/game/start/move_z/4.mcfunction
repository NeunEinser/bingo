#> fetchr:game/start/move_z/4
#
# @within function fetchr:game/start/move_z/3

execute if score $game/start.spawnz fetchr.tmp matches 4096.. run scoreboard players remove $game/start.spawnz fetchr.tmp 4096

execute if score $game/start.spawnz fetchr.tmp matches ..2047 run function fetchr:game/start/move_z/5
execute if score $game/start.spawnz fetchr.tmp matches 2048.. positioned ~ ~ ~1560576 run function fetchr:game/start/move_z/5