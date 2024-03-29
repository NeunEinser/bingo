#> fetchr:item_detection/goals/points/find_winners
#
# This function tags all points winners.
#
# @within
# 	function fetchr:item_detection/goals/lockout/announce
# 	function fetchr:item_detection/goals/lockout/find_winners

#>
# @private
#declare score_holder $item_detect/announce/points.current_item_count
execute store result score $item_detect/announce/points.current_item_count fetchr.tmp run data get storage tmp.fetchr:item_detection teams[-1].itemCount
execute if score $item_detect/announce/points.current_item_count fetchr.tmp > $item_detect/announce/points.winnig_score fetchr.tmp run tag @a remove fetchr.in_team
scoreboard players operation $item_detect/announce/points.winning_score fetchr.tmp > $item_detect/announce/points.current_item_count fetchr.tmp

execute if score $item_detect/announce/points.current_item_count fetchr.tmp = $item_detect/announce/points.winning_score fetchr.tmp run function fetchr:item_detection/goals/tag_team_members

data remove storage tmp.fetchr:item_detection teams[-1]

execute if data storage tmp.fetchr:item_detection teams[0] run function fetchr:item_detection/goals/lockout/find_winners
