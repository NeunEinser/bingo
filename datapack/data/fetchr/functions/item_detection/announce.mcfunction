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

function neun_einser.timer:store_current_time
scoreboard players reset @s fetchr.has_item
tag @s add fetchr.clear

# Update item count
execute store result score $item_detect/announce.items fetchr.tmp run data get storage fetchr:card teams[-1].itemCount
scoreboard players add $item_detect/announce.items fetchr.tmp 1
execute store result storage fetchr:card teams[-1].itemCount int 1 run scoreboard players get $item_detect/announce.items fetchr.tmp

#NEUN_SCRIPT since 25
$scoreboard players operation $$(team_color) fetchr.neutral_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(team_color) fetchr.black_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(team_color) fetchr.blue_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(team_color) fetchr.cyan_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(team_color) fetchr.dark_blue_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(team_color) fetchr.dark_gray_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(team_color) fetchr.dark_red_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(team_color) fetchr.gray_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(team_color) fetchr.green_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(team_color) fetchr.light_blue_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(team_color) fetchr.lime_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(team_color) fetchr.magenta_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(team_color) fetchr.orange_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(team_color) fetchr.purple_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(team_color) fetchr.red_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(team_color) fetchr.white_display = $item_detect/announce.items fetchr.tmp
$scoreboard players operation $$(team_color) fetchr.yellow_display = $item_detect/announce.items fetchr.tmp
#NEUN_SCRIPT end

execute as @a[tag=fetchr.in_current_team] at @s run playsound minecraft:block.end_portal_frame.fill voice @s ~ ~ ~ 1 2
tellraw @a ["[", {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger fetchr.menu"}, "hoverEvent":{"action":"show_text", "contents":{"translate": "fetchr.game.menu.hover_text"}}}, "] ", {"translate": "fetchr.got_item", "with": [{"score": {"name": "$item_detect/announce.items", "objective": "fetchr.tmp"}}, {"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@s"}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.item.textComponent", "interpret": true}]}]

execute store result score $item_detect/announce.has_bingo fetchr.tmp run data get storage fetchr:card teams[-1].hasBingo

# Update completed indicator
execute store result score $item_detect/announce.background_index fetchr.tmp run data get storage fetchr:card teams[-1].backgroundIndex
data modify storage tmp.fetchr:item_detection skippedBackgrounds set value []
execute unless score $lockout_mode fetchr.state matches 1 run function fetchr:item_detection/find_background
data modify storage tmp.fetchr:item_detection slot.background prepend from storage fetchr:card teams[-1].background
data modify storage tmp.fetchr:item_detection slot.background prepend from storage tmp.fetchr:item_detection skippedBackgrounds[]

data modify block 7 0 7 front_text.messages[0] set value '["", {"storage": "tmp.fetchr:item_detection", "nbt": "slot.background[]", "interpret": true, "separator":""}, {"text": "\\u0002", "font": "fetchr:space"}, {"storage": "tmp.fetchr:item_detection", "nbt": "slot.item.icon", "interpret": true}]'
data modify storage tmp.fetchr:item_detection slot.display set from block 7 0 7 front_text.messages[0]
data modify storage tmp.fetchr:item_detection slot.itemCollected set value true

# detect goals
execute if score $item_detect/announce.has_bingo fetchr.tmp matches 0 run function fetchr:item_detection/goals/bingo/detect_bingo_and_20_no_bingo
execute if score $item_detect/announce.items fetchr.tmp matches 25 run function fetchr:item_detection/goals/announce_blackout
execute if score $lockout_mode fetchr.state matches 1 unless score $lockout_race_ended fetchr.state matches 1 run function fetchr:item_detection/goals/lockout/detect

scoreboard players set $update_card fetchr.state 1
