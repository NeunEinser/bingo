#> bingo:init/setup_lobby_end
#
# This function spawns lobby chests and minimizes forceloading.
#
# @within function bingo:init/setup_lobby

execute in bingo:lobby run forceload remove all
execute in bingo:lobby run forceload add 0 0