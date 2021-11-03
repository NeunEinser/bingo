#> bingo:item_detection/find_background
#
# @within
# 	function bingo:item_detection/announce
# 	function bingo:item_detection/find_background
#
# @input score $item_detect/announce.background_index bingo.tmp The index to
# 		retrieve
# @writes
# 	tmp.bingo:item_detection slot.background
# 	tmp.bingo:item_detection skippedBackgrounds

#>
# @within
# 	function bingo:item_detection/announce
# 	function bingo:item_detection/find_background
#declare score_holder $item_detect/announce.background_index

execute if score $item_detect/announce.background_index bingo.tmp matches 1.. run data modify storage tmp.bingo:item_detection skippedBackgrounds append from storage tmp.bingo:item_detection slot.background[0]
data remove storage tmp.bingo:item_detection slot.background[0]

scoreboard players remove $item_detect/announce.background_index bingo.tmp 1
execute if score $item_detect/announce.background_index bingo.tmp matches 0.. run function bingo:item_detection/find_background