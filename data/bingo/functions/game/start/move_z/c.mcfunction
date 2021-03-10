#> bingo:game/start/move_z/c
#
# @within function bingo:game/start/move_z/b

execute if score $game/start.spawnz bingo.tmp matches 16.. run scoreboard players remove $game/start.spawnz bingo.tmp 16

execute if score $game/start.spawnz bingo.tmp matches ..7 run function bingo:game/start/move_z/d
execute if score $game/start.spawnz bingo.tmp matches 8.. positioned ~ ~ ~7324 run function bingo:game/start/move_z/d