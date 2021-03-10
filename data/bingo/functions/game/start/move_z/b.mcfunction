#> bingo:game/start/move_z/b
#
# @within function bingo:game/start/move_z/a

execute if score $game/start.spawnz bingo.tmp matches 32.. run scoreboard players remove $game/start.spawnz bingo.tmp 32

execute if score $game/start.spawnz bingo.tmp matches ..15 run function bingo:game/start/move_z/c
execute if score $game/start.spawnz bingo.tmp matches 16.. positioned ~ ~ ~14648 run function bingo:game/start/move_z/c