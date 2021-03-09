#> bingo:game/start/move_z/5
#
# @within function bingo:game/start/move_z/4

execute if score $game/start.spawnz bingo.tmp matches 2048 run scoreboard players remove $game/start.spawnz bingo.tmp 2048

execute if score $game/start.spawnz bingo.tmp matches 1024.. positioned ~ ~ ~937472 run function bingo:game/start/move_z/6
execute if score $game/start.spawnz bingo.tmp matches ..1023 run function bingo:game/start/move_z/6