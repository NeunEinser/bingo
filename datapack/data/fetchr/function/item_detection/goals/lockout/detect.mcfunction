#> fetchr:item_detection/goals/lockout/detect
#
# This function checks if the lockout goal has been reached.
#
# @within function fetchr:item_detection/announce

data modify storage tmp.fetchr:item_detection teams set from storage fetchr:card teams

#>
# @within function fetchr:item_detection/goals/lockout/*
#declare score_holder $item_detect/announce/lockout.first_place
scoreboard players set $item_detect/announce/lockout.first_place fetchr.tmp 0
#>
# @within function fetchr:item_detection/goals/lockout/*
#declare score_holder $item_detect/announce/lockout.second_place
scoreboard players set $item_detect/announce/lockout.second_place fetchr.tmp 0

function fetchr:item_detection/goals/lockout/team_item_count_iter

data modify storage tmp.fetchr:item_detection openItems set from storage fetchr:card slots
data remove storage tmp.fetchr:item_detection openItems[{ itemCollected: true }]
#>
# @private
#declare score_holder $item_detect/announce/lockout.open_items
execute \
	store result score $item_detect/announce/lockout.open_items fetchr.tmp \
	run data get storage tmp.fetchr:item_detection openItems
# subtract item that is collected right now
scoreboard players remove $item_detect/announce/lockout.open_items fetchr.tmp 1

scoreboard players operation $item_detect/announce/lockout.second_place fetchr.tmp \
	+= $item_detect/announce/lockout.open_items fetchr.tmp

execute \
	if score $item_detect/announce/lockout.first_place fetchr.tmp > $item_detect/announce/lockout.second_place fetchr.tmp \
	run function fetchr:item_detection/goals/lockout/announce

execute \
	if score $item_detect/announce/lockout.first_place fetchr.tmp = $item_detect/announce/lockout.second_place fetchr.tmp \
	if score $item_detect/announce/lockout.open_items fetchr.tmp matches 0 \
	run function fetchr:item_detection/goals/lockout/announce