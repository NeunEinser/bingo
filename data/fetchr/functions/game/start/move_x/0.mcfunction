#> fetchr:game/start/move_x/0
#
# @within function fetchr:game/start/locate_spawnpoint

execute if score $game/start.spawnx fetchr.tmp matches 0.. positioned 381 0 0 run function fetchr:game/start/move_x/1
execute if score $game/start.spawnx fetchr.tmp matches ..-1 positioned -24968835 0 0 run function fetchr:game/start/move_x/1