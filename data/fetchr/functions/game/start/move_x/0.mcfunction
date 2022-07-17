#> fetchr:game/start/move_x/0
#
# @within function fetchr:game/start/locate_spawnpoint

execute if score $game/start.spawnx fetchr.tmp matches 0.. positioned 457.5 ~ ~ run function fetchr:game/start/move_x/1
execute if score $game/start.spawnx fetchr.tmp matches ..-1 positioned -29998646.5 ~ ~ run function fetchr:game/start/move_x/1