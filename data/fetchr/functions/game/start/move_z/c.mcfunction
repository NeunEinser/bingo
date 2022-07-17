#> fetchr:game/start/move_z/c
#
# @within function fetchr:game/start/move_z/b

execute if score $game/start.spawnz fetchr.tmp matches 16.. run scoreboard players remove $game/start.spawnz fetchr.tmp 16

execute if score $game/start.spawnz fetchr.tmp matches ..7 run function fetchr:game/start/move_z/d
execute if score $game/start.spawnz fetchr.tmp matches 8.. positioned ~ ~ ~7324 run function fetchr:game/start/move_z/d