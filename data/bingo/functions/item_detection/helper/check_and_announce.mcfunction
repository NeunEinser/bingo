#> bingo:item_detection/helper/check_and_announce
#
# This function checks whether @s' team already has obtained the currently
# selcted item. If they didn't it announces the item receivement and also
# checks if a goal was reached.
#
# @within bingo:item_detection/items/*
# @context entity Player who just obtained the item
# @input storage temp:bingo.input/item_detection slot

#>
# Storage that holds information about the currently selected slot
#
# @within bingo:item_detection/**
#declare storage temp:bingo.input/item_detection

function bingo:util/find_player_team

function bingo:item_detection/helper/set_border
execute if score $item_detect/set_border.success bingo.tmp matches 1 run function bingo:item_detection/helper/announce