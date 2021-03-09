#> bingo:game/start/move_z/4
#
# @within function bingo:game/start/move_z/3

execute if score $game/start.spawnz bingo.tmp matches 4096 run scoreboard players remove $game/start.spawnz bingo.tmp 4096

execute if score $game/start.spawnz bingo.tmp matches 2048.. positioned ~ ~ ~1874944 run function bingo:game/start/move_z/5
execute if score $game/start.spawnz bingo.tmp matches ..2047 run function bingo:game/start/move_z/5