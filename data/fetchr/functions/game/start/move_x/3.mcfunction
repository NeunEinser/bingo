#> fetchr:game/start/move_x/3
#
# @within function fetchr:game/start/move_x/2

execute if score $game/start.spawnx fetchr.tmp matches 8192.. run scoreboard players remove $game/start.spawnx fetchr.tmp 8192

execute if score $game/start.spawnx fetchr.tmp matches ..4095 run function fetchr:game/start/move_x/4
execute if score $game/start.spawnx fetchr.tmp matches 4096.. positioned ~3121152 ~ ~ run function fetchr:game/start/move_x/4