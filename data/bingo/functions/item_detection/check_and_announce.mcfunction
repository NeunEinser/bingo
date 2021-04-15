#> bingo:item_detection/check_and_announce
#
# Checks if another teammate got the item in the same tick, and announces the
# item get otherwise
#
# @internal

#>
# This tag is added to players when the announce function is executed to
# prevent the game doing expensive nbt checks when a player has items that are
# on the card but already received in their inventory
# 
# @internal
#declare tag bingo.got_item

function bingo:util/find_player_team
function bingo:item_detection/set_border
tag @a[tag=bingo.in_current_team] add bingo.got_item

execute if score $item_detect/set_border.success bingo.tmp matches 1 run function bingo:item_detection/announce