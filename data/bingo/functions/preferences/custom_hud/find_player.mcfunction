#> bingo:preferences/custom_hud/find_player
#
# Finds the hud configuration of the current player and stores it to
# bingo:custom_hud currentPlayer
#
# @within
# 	function bingo:preferences/custom_hud/show
# 	function bingo:preferences/custom_hud/find_player
# @context entity Player who triggered bingo.pref
# @writes
# 	storage bingo:custom_hud currentPlayer
# 	storage bingo:custom_hud players
# 	storage tmp.bingo:preferences/hud skippedHuds
#>
# @private
#declare score_holder $preferences/hud.player_id
execute store result score $preferences/hud.player_id bingo.tmp run data get storage bingo:custom_hud players[-1].id

data modify storage tmp.bingo:preferences/hud skippedHuds prepend from storage bingo:custom_hud players[-1]
data remove storage bingo:custom_hud players[-1]

execute unless score @s bingo.id = $preferences/hud.player_id bingo.tmp run function bingo:preferences/custom_hud/find_player