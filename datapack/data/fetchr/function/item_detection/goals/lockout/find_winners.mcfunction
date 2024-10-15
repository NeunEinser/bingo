#> fetchr:item_detection/goals/lockout/find_winners
#
# This function tags all lockout winners.
#
# @within
# 	function fetchr:item_detection/goals/lockout/announce
# 	function fetchr:item_detection/goals/lockout/find_winners

#>
# @private
#declare score_holder $item_detect/announce/lockout.current_item_count
execute store result score $item_detect/announce/lockout.current_item_count fetchr.tmp run data get storage tmp.fetchr:item_detection teams[-1].item_count

execute if score $item_detect/announce/lockout.current_item_count fetchr.tmp = $item_detect/announce/lockout.first_place fetchr.tmp run function fetchr:item_detection/goals/tag_team_members

data remove storage tmp.fetchr:item_detection teams[-1]

execute if data storage tmp.fetchr:item_detection teams[0] run function fetchr:item_detection/goals/lockout/find_winners
