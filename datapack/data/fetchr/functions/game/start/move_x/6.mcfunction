#> fetchr:game/start/move_x/6
#
# @within function fetchr:game/start/move_x/5

execute if score $game/start.spawnx fetchr.tmp matches 1024.. run scoreboard players remove $game/start.spawnx fetchr.tmp 1024

execute if score $game/start.spawnx fetchr.tmp matches ..511 run function fetchr:game/start/move_x/7
execute if score $game/start.spawnx fetchr.tmp matches 512.. positioned ~390144 ~ ~ run function fetchr:game/start/move_x/7