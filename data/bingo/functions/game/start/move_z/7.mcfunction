#> bingo:game/start/move_z/7
#
# @within function bingo:game/start/move_z/6

execute if score $game/start.spawnz bingo.tmp matches 512.. run scoreboard players remove $game/start.spawnz bingo.tmp 512

execute if score $game/start.spawnz bingo.tmp matches ..255 run function bingo:game/start/move_z/8
execute if score $game/start.spawnz bingo.tmp matches 256.. positioned ~ ~ ~234368 run function bingo:game/start/move_z/8