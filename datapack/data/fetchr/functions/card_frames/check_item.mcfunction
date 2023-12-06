#> fetchr:card_frames/check_item
# 
# Checks if the item in the item frame is present
#
# @internal

#>
# Used for counting the item frames
#
# @internal
#declare score_holder $card_frames.count
execute unless data entity @s Item run function fetchr:card_frames/on_item_removed

scoreboard players add $card_frames.count fetchr.io 1