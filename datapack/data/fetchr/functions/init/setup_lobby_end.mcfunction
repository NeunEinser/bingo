#> fetchr:init/setup_lobby_end
#
# This function spawns lobby chests and minimizes forceloading.
#
# @within function fetchr:init/setup_lobby

execute in fetchr:lobby run forceload remove all
execute in fetchr:lobby run forceload add 0 0