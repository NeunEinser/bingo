#> fetchr:game/start/move_x/b
#
# @within function fetchr:game/start/move_x/a

execute if score $game/start.spawnx fetchr.tmp matches 32.. run scoreboard players remove $game/start.spawnx fetchr.tmp 32

execute if score $game/start.spawnx fetchr.tmp matches ..15 run function fetchr:game/start/move_x/c
execute if score $game/start.spawnx fetchr.tmp matches 16.. positioned ~12192 ~ ~ run function fetchr:game/start/move_x/c