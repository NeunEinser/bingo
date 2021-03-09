#> bingo:game/start/move_z/0
#
# @within function bingo:game/start/move_x/f

execute if score $game/start.spawnz bingo.tmp matches 0.. positioned ~ ~ 457.75 run function bingo:game/start/move_z/1
execute if score $game/start.spawnz bingo.tmp matches ..-1 positioned ~ ~ -29998646.25 run function bingo:game/start/move_z/1