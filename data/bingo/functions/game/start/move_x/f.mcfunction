#> bingo:game/start/move_x/f
#
# @within function bingo:game/start/move_x/e

execute if score $game/start.spawnx bingo.tmp matches 2.. run scoreboard players remove $game/start.spawnx bingo.tmp 2

execute if score $game/start.spawnx bingo.tmp matches ..0 run function bingo:game/start/move_z/0
execute if score $game/start.spawnx bingo.tmp matches 1.. positioned ~915.5 ~ ~ run function bingo:game/start/move_z/0