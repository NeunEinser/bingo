#> fetchr:game/start/move_z/2
#
# @within function fetchr:game/start/move_z/1

execute if score $game/start.spawnz fetchr.tmp matches 16384.. run scoreboard players remove $game/start.spawnz fetchr.tmp 16384

execute if score $game/start.spawnz fetchr.tmp matches ..8191 run function fetchr:game/start/move_z/3
execute if score $game/start.spawnz fetchr.tmp matches 8192.. positioned ~ ~ ~7499776 run function fetchr:game/start/move_z/3