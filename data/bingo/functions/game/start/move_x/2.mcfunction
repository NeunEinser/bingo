#> bingo:game/start/move_x/2
#
# @within function bingo:game/start/move_x/1

execute if score $game/start.spawnx bingo.tmp matches 16384.. run scoreboard players remove $game/start.spawnx bingo.tmp 16384

execute if score $game/start.spawnx bingo.tmp matches 8192.. positioned ~7499776 ~ ~ run function bingo:game/start/move_x/3
execute if score $game/start.spawnx bingo.tmp matches ..8191 run function bingo:game/start/move_x/3