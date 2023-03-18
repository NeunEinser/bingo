#> fetchr:game/start/move_x/2
#
# @within function fetchr:game/start/move_x/1

execute if score $game/start.spawnx fetchr.tmp matches 16384.. run scoreboard players remove $game/start.spawnx fetchr.tmp 16384

execute if score $game/start.spawnx fetchr.tmp matches ..8191 run function fetchr:game/start/move_x/3
execute if score $game/start.spawnx fetchr.tmp matches 8192.. positioned ~6242304 ~ ~ run function fetchr:game/start/move_x/3