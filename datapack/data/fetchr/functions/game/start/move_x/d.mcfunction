#> fetchr:game/start/move_x/d
#
# @within function fetchr:game/start/move_x/c

execute if score $game/start.spawnx fetchr.tmp matches 8.. run scoreboard players remove $game/start.spawnx fetchr.tmp 8

execute if score $game/start.spawnx fetchr.tmp matches ..3 run function fetchr:game/start/move_x/e
execute if score $game/start.spawnx fetchr.tmp matches 4.. positioned ~3048 ~ ~ run function fetchr:game/start/move_x/e