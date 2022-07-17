#> fetchr:game/start/move_z/0
#
# @within function fetchr:game/start/move_x/f

execute if score $game/start.spawnz fetchr.tmp matches 0.. positioned ~ ~ 457.5 run function fetchr:game/start/move_z/1
execute if score $game/start.spawnz fetchr.tmp matches ..-1 positioned ~ ~ -29998646.5 run function fetchr:game/start/move_z/1