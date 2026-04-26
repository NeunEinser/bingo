#> fetchr:preferences/custom_hud/find_player
#
# Finds the hud configuration of the current player and stores it to
# fetchr:custom_hud current_player
#
# @within
# 	function fetchr:preferences/custom_hud/show
# 	function fetchr:preferences/custom_hud/find_player
# @context entity Player who triggered fetchr.pref
# @writes
# 	storage fetchr:custom_hud current_player
# 	storage fetchr:custom_hud players
# 	storage tmp.fetchr:preferences/hud skipped_huds
#>
# @private
#declare score_holder $preferences/hud.player_id
execute store result score $preferences/hud.player_id fetchr.tmp run data get storage fetchr:custom_hud players[-1].id

data modify storage tmp.fetchr:preferences/hud skipped_huds prepend from storage fetchr:custom_hud players[-1]
data remove storage fetchr:custom_hud players[-1]

execute unless score @s fetchr.player_id = $preferences/hud.player_id fetchr.tmp run function fetchr:preferences/custom_hud/find_player