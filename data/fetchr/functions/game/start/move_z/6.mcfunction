#> fetchr:game/start/move_z/6
#
# @within function fetchr:game/start/move_z/5

execute if score $game/start.spawnz fetchr.tmp matches 1024.. run scoreboard players remove $game/start.spawnz fetchr.tmp 1024

execute if score $game/start.spawnz fetchr.tmp matches ..511 run function fetchr:game/start/move_z/7
execute if score $game/start.spawnz fetchr.tmp matches 512.. positioned ~ ~ ~468736 run function fetchr:game/start/move_z/7