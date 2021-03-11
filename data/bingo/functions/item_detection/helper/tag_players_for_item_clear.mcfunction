#> bingo:item_detection/helper/tag_players_for_item_clear
#
# This function adds a tag to all players who previously obtained the currently
# selected item
#
# @within
# 	function bingo:item_detection/helper/announce
# 	function bingo:item_detection/helper/tag_players_for_item_clear

#>
# The player id of the current player
#
# @private
#declare score_holder $item_detect/tag_players.player

execute store result score $item_detect/tag_players.player bingo.tmp run data get storage bingo:card playersToBeCleared[0][-1]
execute as @a if score @s bingo.id = $item_detect/tag_players.player bingo.tmp run tag @s add bingo.clear
data remove storage bingo:card playersToBeCleared[0][-1]

execute if data storage bingo:card playersToBeCleared[0][0] run function bingo:item_detection/helper/tag_players_for_item_clear
execute unless data storage bingo:card playersToBeCleared[0][0] run data remove storage bingo:card playersToBeCleared[0]
execute unless data storage bingo:card playersToBeCleared[0] run data remove storage bingo:card playersToBeCleared