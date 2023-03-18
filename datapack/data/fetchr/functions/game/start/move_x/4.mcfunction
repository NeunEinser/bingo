#> fetchr:game/start/move_x/4
#
# @within function fetchr:game/start/move_x/3

execute if score $game/start.spawnx fetchr.tmp matches 4096.. run scoreboard players remove $game/start.spawnx fetchr.tmp 4096

execute if score $game/start.spawnx fetchr.tmp matches ..2047 run function fetchr:game/start/move_x/5
execute if score $game/start.spawnx fetchr.tmp matches 2048.. positioned ~1560576 ~ ~ run function fetchr:game/start/move_x/5