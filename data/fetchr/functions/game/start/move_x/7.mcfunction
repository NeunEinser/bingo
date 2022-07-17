#> fetchr:game/start/move_x/7
#
# @within function fetchr:game/start/move_x/6

execute if score $game/start.spawnx fetchr.tmp matches 512.. run scoreboard players remove $game/start.spawnx fetchr.tmp 512

execute if score $game/start.spawnx fetchr.tmp matches ..255 run function fetchr:game/start/move_x/8
execute if score $game/start.spawnx fetchr.tmp matches 256.. positioned ~234368 ~ ~ run function fetchr:game/start/move_x/8