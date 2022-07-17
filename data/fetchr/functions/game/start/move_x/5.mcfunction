#> fetchr:game/start/move_x/5
#
# @within function fetchr:game/start/move_x/4

execute if score $game/start.spawnx fetchr.tmp matches 2048.. run scoreboard players remove $game/start.spawnx fetchr.tmp 2048

execute if score $game/start.spawnx fetchr.tmp matches ..1023 run function fetchr:game/start/move_x/6
execute if score $game/start.spawnx fetchr.tmp matches 1024.. positioned ~937472 ~ ~ run function fetchr:game/start/move_x/6