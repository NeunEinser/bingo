#> fetchr:item_detection/announce
#
# This function is called to announce the item get of the current item.
#
# It also announces reaching a goal, when applicable
#
# @within function fetchr:item_detection/check_and_announce

#>
# Storage that holds information about the currently selected slot
#
# @internal
#declare storage tmp.fetchr:item_detection

#>
# @private
#declare score_holder $item_detect/announce.has_bingo
#>
# @within
# 	function fetchr:item_detection/**
#declare score_holder $item_detect/announce.items

execute as @a[tag=fetchr.in_current_team] at @s run playsound minecraft:block.end_portal_frame.fill voice @s ~ ~ ~ 1 2
scoreboard players reset @s fetchr.has_item
tag @s add fetchr.clear

# Update item count
execute store result score $item_detect/announce.items fetchr.tmp run data get storage fetchr:card teams[-1].item_count
scoreboard players add $item_detect/announce.items fetchr.tmp 1
execute store result storage fetchr:card teams[-1].item_count int 1 run scoreboard players get $item_detect/announce.items fetchr.tmp

$scoreboard players operation $$(color) fetchr.neutral_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(color) fetchr.black_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(color) fetchr.blue_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(color) fetchr.cyan_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(color) fetchr.dark_blue_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(color) fetchr.dark_gray_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(color) fetchr.dark_red_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(color) fetchr.gray_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(color) fetchr.green_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(color) fetchr.light_blue_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(color) fetchr.lime_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(color) fetchr.magenta_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(color) fetchr.orange_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(color) fetchr.purple_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(color) fetchr.red_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(color) fetchr.white_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(color) fetchr.yellow_display = $item_detect/announce.items fetchr.tmp

execute store result score $item_detect/announce.has_bingo fetchr.tmp run data get storage fetchr:card teams[-1].has_bingo

# Update completed indicator
execute \
	store result storage io.fetchr:find_team current_team.slot_id byte 1 \
	run scoreboard players get $item_detect.slot fetchr.tmp

execute \
	unless score $lockout_mode fetchr.state matches 1 \
	run function fetchr:item_detection/set_background with storage io.fetchr:find_team current_team

# detect goals
execute \
	unless score $item_detect/announce.has_bingo fetchr.tmp matches 1 \
	run function fetchr:item_detection/goals/bingo/detect_bingo_and_20_no_bingo
execute \
	if score $item_detect/announce.items fetchr.tmp matches 25 \
	run function fetchr:item_detection/goals/announce_blackout
execute \
	if score $lockout_mode fetchr.state matches 1 \
	unless score $lockout_race_ended fetchr.state matches 1 \
	run function fetchr:item_detection/goals/lockout/detect

scoreboard players set $update_card fetchr.state 1
