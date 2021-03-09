#> bingo:game/start/move_x/3
#
# @within function bingo:game/start/move_x/2

execute if score $game/start.spawnx bingo.tmp matches 8192 run scoreboard players remove $game/start.spawnx bingo.tmp 8192

execute if score $game/start.spawnx bingo.tmp matches 4096.. positioned ~3749888 ~ ~ run function bingo:game/start/move_x/4
execute if score $game/start.spawnx bingo.tmp matches ..4095 run function bingo:game/start/move_x/4