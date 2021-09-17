#> bingo:preferences/custom_hud/find_player
#
# Finds the hud configuration of the current player and stores it to
# bingo:custom_hud currentPlayer
#
# @within
# 	function bingo:preferences/custom_hud/show
# 	function bingo:preferences/custom_hud/find_player
# @context entity Player who triggered bingo.pref
# @input storage tmp.bingo:preferences/hud playerHuds
# @writes
# 	storage bingo:custom_hud currentPlayer
# 	storage tmp.bingo:preferences/hud skippedHuds
#>
# @private
#declare score_holder $preferences/hud.player_id
execute store result score $preferences/hud.player_id bingo.tmp run data get storage tmp.bingo:preferences/hud playerHuds[-1].id

data modify storage tmp.bingo:preferences/hud skippedHuds prepend from storage tmp.bingo:preferences/hud playerHuds[-1]
data remove storage tmp.bingo:preferences/hud playerHuds[-1]

execute unless score @s bingo.id = $preferences/hud.player_id bingo.tmp run function bingo:preferences/custom_hud/find_player