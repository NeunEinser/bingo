#> fetchr:game/start/move_x/c
#
# @within function fetchr:game/start/move_x/b

execute if score $game/start.spawnx fetchr.tmp matches 16.. run scoreboard players remove $game/start.spawnx fetchr.tmp 16

execute if score $game/start.spawnx fetchr.tmp matches ..7 run function fetchr:game/start/move_x/d
execute if score $game/start.spawnx fetchr.tmp matches 8.. positioned ~7324 ~ ~ run function fetchr:game/start/move_x/d