#> fetchr:game/start/move_x/8
#
# @within function fetchr:game/start/move_x/7

execute if score $game/start.spawnx fetchr.tmp matches 256.. run scoreboard players remove $game/start.spawnx fetchr.tmp 256

execute if score $game/start.spawnx fetchr.tmp matches ..127 run function fetchr:game/start/move_x/9
execute if score $game/start.spawnx fetchr.tmp matches 128.. positioned ~117184 ~ ~ run function fetchr:game/start/move_x/9