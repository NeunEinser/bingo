#> bingo:game/start/move_x/d
#
# @within function bingo:game/start/move_x/c

execute if score $game/start.spawnx bingo.tmp matches 8 run scoreboard players remove $game/start.spawnx bingo.tmp 8

execute if score $game/start.spawnx bingo.tmp matches 4.. positioned ~3662 ~ ~ run function bingo:game/start/move_x/e
execute if score $game/start.spawnx bingo.tmp matches ..3 run function bingo:game/start/move_x/e