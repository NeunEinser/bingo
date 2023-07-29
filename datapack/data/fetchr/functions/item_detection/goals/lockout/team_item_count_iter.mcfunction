#> fetchr:item_detection/goals/lockout/team_item_count_iter
#
# This function checks if the lockout goal has been reached.
#
# @within
# 	function fetchr:item_detection/goals/lockout/detect
# 	function fetchr:item_detection/goals/lockout/team_item_count_iter

#>
# @private
#declare score_holder $item_detect/announce/lockout.current_item_count
execute store result score $item_detect/announce/lockout.current_item_count fetchr.tmp run data get storage tmp.fetchr:item_detection teams[-1].itemCount

execute if score $item_detect/announce/lockout.current_item_count fetchr.tmp > $item_detect/announce/lockout.first_place fetchr.tmp run scoreboard players operation $item_detect/announce/lockout.second_place fetchr.tmp = $item_detect/announce/lockout.first_place fetchr.tmp
execute if score $item_detect/announce/lockout.current_item_count fetchr.tmp < $item_detect/announce/lockout.first_place fetchr.tmp run scoreboard players operation $item_detect/announce/lockout.second_place fetchr.tmp > $item_detect/announce/lockout.current_item_count fetchr.tmp
scoreboard players operation $item_detect/announce/lockout.first_place fetchr.tmp > $item_detect/announce/lockout.current_item_count fetchr.tmp

data remove storage tmp.fetchr:item_detection teams[-1]

execute if data storage tmp.fetchr:item_detection teams[-1] run function fetchr:item_detection/goals/lockout/team_item_count_iter