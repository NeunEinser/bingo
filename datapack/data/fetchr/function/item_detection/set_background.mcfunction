#> fetchr:item_detection/set_background
#
# @within
# 	function fetchr:item_detection/announce
# 	function fetchr:item_detection/set_background
#
# @input score $item_detect/announce.background_index fetchr.tmp The index to
# 		retrieve
# @writes
# 	tmp.fetchr:item_detection slot.background
# 	tmp.fetchr:item_detection skippedBackgrounds

#>
# @within
# 	function fetchr:item_detection/announce
# 	function fetchr:item_detection/set_background
#declare score_holder $item_detect/announce.background_index

$data \
	modify storage fetchr:card slots[$(slot_id)].background[$(background_index)] \
	set from storage fetchr:card teams[-1].background