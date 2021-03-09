#> bingo:game/start/move_x/5
#
# @within function bingo:game/start/move_x/4

execute if score $game/start.spawnx bingo.tmp matches 2048 run scoreboard players remove $game/start.spawnx bingo.tmp 2048

execute if score $game/start.spawnx bingo.tmp matches 1024.. positioned ~937472 ~ ~ run function bingo:game/start/move_x/6
execute if score $game/start.spawnx bingo.tmp matches ..1023 run function bingo:game/start/move_x/6