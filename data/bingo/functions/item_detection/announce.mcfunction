#> bingo:item_detection/announce
#
# This function is called to announce the item get of the current item.
#
# It also announces reaching a goal, when applicable
#
# @internal

#>
# Storage that holds information about the currently selected slot
#
# @internal
#declare storage temp:bingo.input/item_detection

#>
# @private
#declare score_holder $item_detect/announce.has_bingo
#>
# @within
# 	function bingo:item_detection/**
#declare score_holder $item_detect/announce.items

function bingo:util/find_player_team
function bingo:item_detection/set_border
execute in bingo:lobby run function neun_einser.timer:store_current_time
scoreboard players reset @s bingo.has_item
tag @s add bingo.clear

# Update item count
execute store result score $item_detect/announce.items bingo.tmp run data get storage bingo:card teams[-1].itemCount
scoreboard players add $item_detect/announce.items bingo.tmp 1
execute store result storage bingo:card teams[-1].itemCount int 1 run scoreboard players get $item_detect/announce.items bingo.tmp

execute as @a[tag=bingo.in_current_team] at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 1 2
tellraw @a {"translate": "bingo.got_item", "with": [{"score": {"name": "$item_detect/announce.items", "objective": "bingo.tmp"}}, {"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@s"}, {"storage": "temp:bingo.input/item_detection", "nbt": "slot.item.textComponent", "interpret": true}]}

execute store result score $item_detect/announce.has_bingo bingo.tmp run data get storage bingo:card teams[-1].hasBingo

# detect goals
execute if score $item_detect/announce.has_bingo bingo.tmp matches 0 run function bingo:item_detection/goals/bingo/detect_bingo_and_20_no_bingo
execute if score $item_detect/announce.items bingo.tmp matches 25 run function bingo:item_detection/goals/announce_blackout

# Update card immediately
function bingo:card_display/display_card_schedule