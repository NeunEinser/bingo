#> bingo:game/start/move_x/7
#
# @within function bingo:game/start/move_x/6

execute if score $game/start.spawnx bingo.tmp matches 512.. run scoreboard players remove $game/start.spawnx bingo.tmp 512

execute if score $game/start.spawnx bingo.tmp matches ..255 run function bingo:game/start/move_x/8
execute if score $game/start.spawnx bingo.tmp matches 256.. positioned ~234368 ~ ~ run function bingo:game/start/move_x/8