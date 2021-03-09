#> bingo:game/start/move_z/e
#
# @within function bingo:game/start/move_z/d

execute if score $game/start.spawnz bingo.tmp matches 4 run scoreboard players remove $game/start.spawnz bingo.tmp 4

execute if score $game/start.spawnz bingo.tmp matches 2.. positioned ~ ~ ~1831 run function bingo:game/start/move_z/f
execute if score $game/start.spawnz bingo.tmp matches ..1 run function bingo:game/start/move_z/f