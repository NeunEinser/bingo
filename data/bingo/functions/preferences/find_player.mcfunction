#> bingo:preferences/find_player
#
# @within
# 	function bingo:preferences/custom_hud
# 	function bingo:preferences/find_player
# @context entity Player who triggered bingo.pref

#>
# @private
#declare score_holder $preferences/hud.player_id
execute store result score $preferences/hud.player_id bingo.tmp run data get storage tmp.bingo:preferences playerHuds[-1].id

data modify storage tmp.bingo:preferences skippedHuds prepend from storage tmp.bingo:preferences playerHuds[-1]
data remove storage tmp.bingo:preferences playerHuds[-1]

execute unless score @s bingo.id = $preferences/hud.player_id bingo.tmp run function bingo:preferences/find_player