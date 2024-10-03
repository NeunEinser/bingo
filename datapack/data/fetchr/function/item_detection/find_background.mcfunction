#> fetchr:item_detection/find_background
#
# @within
# 	function fetchr:item_detection/announce
# 	function fetchr:item_detection/find_background
#
# @input score $item_detect/announce.background_index fetchr.tmp The index to
# 		retrieve
# @writes
# 	tmp.fetchr:item_detection slot.background
# 	tmp.fetchr:item_detection skippedBackgrounds

#>
# @within
# 	function fetchr:item_detection/announce
# 	function fetchr:item_detection/find_background
#declare score_holder $item_detect/announce.background_index

execute if score $item_detect/announce.background_index fetchr.tmp matches 1.. run data modify storage tmp.fetchr:item_detection skippedBackgrounds append from storage tmp.fetchr:item_detection slot.background[0]
data remove storage tmp.fetchr:item_detection slot.background[0]

scoreboard players remove $item_detect/announce.background_index fetchr.tmp 1
execute if score $item_detect/announce.background_index fetchr.tmp matches 0.. run function fetchr:item_detection/find_background