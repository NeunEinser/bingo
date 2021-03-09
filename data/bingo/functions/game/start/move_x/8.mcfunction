#> bingo:game/start/move_x/8
#
# @within function bingo:game/start/move_x/7

execute if score $game/start.spawnx bingo.tmp matches 256 run scoreboard players remove $game/start.spawnx bingo.tmp 256

execute if score $game/start.spawnx bingo.tmp matches 128.. positioned ~117184 ~ ~ run function bingo:game/start/move_x/9
execute if score $game/start.spawnx bingo.tmp matches ..127 run function bingo:game/start/move_x/9