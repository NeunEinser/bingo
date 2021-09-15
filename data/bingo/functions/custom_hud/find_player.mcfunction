#> bingo:custom_hud/find_player
#
# This function finds the custom hud data of the currently selected player.
#
# While this may seem like a O(n) (with n being the amount of players), it
# should generally be closer to O(1).
#
# The players list is handled in such a way that it will remember the order it
# handled players the previous tick, so unless the arbitary order changed for
# some reason, the players array should be sorted optimally in most cases.
#
# @context entity Selected player
# @within
# 	function bingo:custom_hud/tick
# 	function bingo:custom_hud/find_player

data modify storage tmp.bingo:custom_hud skipped prepend from storage bingo:custom_hud currentPlayer
data modify storage bingo:custom_hud currentPlayer set from storage bingo:custom_hud players[-1]
data remove storage bingo:custom_hud players[-1]

#>
# @private
#declare score_holder $custom_hud/player.id
execute store result score $custom_hud/player.id bingo.tmp run data get storage bingo:custom_hud currentPlayer.id

execute unless score $custom_hud/player.id bingo.tmp = @s bingo.id run function bingo:custom_hud/find_player