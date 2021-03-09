#> bingo:game/start/move_x/0
#
# @within function bingo:game/start/generate_spawnpoint

execute if score $game/start.spawnx bingo.tmp matches ..-1 positioned -29998646.25 ~ ~ run function bingo:game/start/move_x/1
execute if score $game/start.spawnx bingo.tmp matches 0.. positioned 457.75 ~ ~ run function bingo:game/start/move_x/1