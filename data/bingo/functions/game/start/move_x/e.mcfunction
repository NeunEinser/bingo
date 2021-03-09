#> bingo:game/start/move_x/e
#
# @within function bingo:game/start/move_x/d

execute if score $game/start.spawnx bingo.tmp matches 4 run scoreboard players remove $game/start.spawnx bingo.tmp 4

execute if score $game/start.spawnx bingo.tmp matches 2.. positioned ~1831 ~ ~ run function bingo:game/start/move_x/f
execute if score $game/start.spawnx bingo.tmp matches ..1 run function bingo:game/start/move_x/f