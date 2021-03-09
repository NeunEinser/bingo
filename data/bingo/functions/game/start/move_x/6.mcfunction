#> bingo:game/start/move_x/6
#
# @within function bingo:game/start/move_x/5

execute if score $game/start.spawnx bingo.tmp matches 1024 run scoreboard players remove $game/start.spawnx bingo.tmp 1024

execute if score $game/start.spawnx bingo.tmp matches 512.. positioned ~468736 ~ ~ run function bingo:game/start/move_x/7
execute if score $game/start.spawnx bingo.tmp matches ..511 run function bingo:game/start/move_x/7