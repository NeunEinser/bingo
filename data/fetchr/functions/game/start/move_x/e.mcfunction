#> fetchr:game/start/move_x/e
#
# @within function fetchr:game/start/move_x/d

execute if score $game/start.spawnx fetchr.tmp matches 4.. run scoreboard players remove $game/start.spawnx fetchr.tmp 4

execute if score $game/start.spawnx fetchr.tmp matches ..1 run function fetchr:game/start/move_x/f
execute if score $game/start.spawnx fetchr.tmp matches 2.. positioned ~1831 ~ ~ run function fetchr:game/start/move_x/f