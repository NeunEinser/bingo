#> bingo:game/start/move_z/9
#
# @within function bingo:game/start/move_z/8

execute if score $game/start.spawnz bingo.tmp matches 128.. run scoreboard players remove $game/start.spawnz bingo.tmp 128

execute if score $game/start.spawnz bingo.tmp matches ..63 run function bingo:game/start/move_z/a
execute if score $game/start.spawnz bingo.tmp matches 64.. positioned ~ ~ ~58592 run function bingo:game/start/move_z/a