#> bingo:game/start/move_z/d
#
# @within function bingo:game/start/move_z/c

execute if score $game/start.spawnz bingo.tmp matches 8.. run scoreboard players remove $game/start.spawnz bingo.tmp 8

execute if score $game/start.spawnz bingo.tmp matches ..3 run function bingo:game/start/move_z/e
execute if score $game/start.spawnz bingo.tmp matches 4.. positioned ~ ~ ~3662 run function bingo:game/start/move_z/e