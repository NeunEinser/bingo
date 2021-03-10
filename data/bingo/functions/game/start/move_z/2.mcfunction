#> bingo:game/start/move_z/2
#
# @within function bingo:game/start/move_z/1

execute if score $game/start.spawnz bingo.tmp matches 16384.. run scoreboard players remove $game/start.spawnz bingo.tmp 16384

execute if score $game/start.spawnz bingo.tmp matches ..8191 run function bingo:game/start/move_z/3
execute if score $game/start.spawnz bingo.tmp matches 8192.. positioned ~ ~ ~7499776 run function bingo:game/start/move_z/3