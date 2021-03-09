#> bingo:game/start/move_z/a
#
# @within function bingo:game/start/move_z/9

execute if score $game/start.spawnz bingo.tmp matches 64 run scoreboard players remove $game/start.spawnz bingo.tmp 64

execute if score $game/start.spawnz bingo.tmp matches 32.. positioned ~ ~ ~29296 run function bingo:game/start/move_z/b
execute if score $game/start.spawnz bingo.tmp matches ..31 run function bingo:game/start/move_z/b