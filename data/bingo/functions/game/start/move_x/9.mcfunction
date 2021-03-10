#> bingo:game/start/move_x/9
#
# @within function bingo:game/start/move_x/8

execute if score $game/start.spawnx bingo.tmp matches 128.. run scoreboard players remove $game/start.spawnx bingo.tmp 128

execute if score $game/start.spawnx bingo.tmp matches ..63 run function bingo:game/start/move_x/a
execute if score $game/start.spawnx bingo.tmp matches 64.. positioned ~58592 ~ ~ run function bingo:game/start/move_x/a