#> bingo:game/start/move_x/a
#
# @within function bingo:game/start/move_x/9

execute if score $game/start.spawnx bingo.tmp matches 64 run scoreboard players remove $game/start.spawnx bingo.tmp 64

execute if score $game/start.spawnx bingo.tmp matches 32.. positioned ~29296 ~ ~ run function bingo:game/start/move_x/b
execute if score $game/start.spawnx bingo.tmp matches ..31 run function bingo:game/start/move_x/b