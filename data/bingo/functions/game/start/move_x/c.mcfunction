#> bingo:game/start/move_x/c
#
# @within function bingo:game/start/move_x/b

execute if score $game/start.spawnx bingo.tmp matches 16 run scoreboard players remove $game/start.spawnx bingo.tmp 16

execute if score $game/start.spawnx bingo.tmp matches 8.. positioned ~7324 ~ ~ run function bingo:game/start/move_x/d
execute if score $game/start.spawnx bingo.tmp matches ..7 run function bingo:game/start/move_x/d