#> bingo:game/start/move_x/b
#
# @within function bingo:game/start/move_x/a

execute if score $game/start.spawnx bingo.tmp matches 32 run scoreboard players remove $game/start.spawnx bingo.tmp 32

execute if score $game/start.spawnx bingo.tmp matches 16.. positioned ~14648 ~ ~ run function bingo:game/start/move_x/c
execute if score $game/start.spawnx bingo.tmp matches ..15 run function bingo:game/start/move_x/c