#> bingo:game/start/move_z/3
#
# @within function bingo:game/start/move_z/2

execute if score $game/start.spawnz bingo.tmp matches 8192.. run scoreboard players remove $game/start.spawnz bingo.tmp 8192

execute if score $game/start.spawnz bingo.tmp matches ..4095 run function bingo:game/start/move_z/4
execute if score $game/start.spawnz bingo.tmp matches 4096.. positioned ~ ~ ~3749888 run function bingo:game/start/move_z/4