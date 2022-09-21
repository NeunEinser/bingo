#> bingo:tick/tp_pos_marker
#
# This function is called for every player
#
# @within function bingo:tick/player_tick
# @context
# 	entity Position marker
# 	location Position of the current player

teleport @s ~ ~ ~ ~ ~
data modify storage tmp.bingo:tick posReader set from entity @s {}
teleport @s 0 0 0