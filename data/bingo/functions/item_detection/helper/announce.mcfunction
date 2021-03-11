#> bingo:item_detection/helper/announce
#
# This function is called to announce the item get of the current item.
#
# It also announces reaching a goal, when applicable
#
# @within bingo:item_detection/helper/check_and_announce

#>
# @private
#declare score_holder $item_detect/announce.has_bingo
#>
# @within
# 	function bingo:item_detection/helper/announce
# 	function bingo:item_detection/helper/goals/bingo/detect_bingo_and_20_no_bingo
#declare score_holder $item_detect/announce.items

# announce
execute in bingo:lobby run function neun_einser.timer:store_current_time

execute at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 1 2
tellraw @a {"translate": "bingo.got_item", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@s"}, {"storage": "bingo:card", "nbt": "slots[{selected: true}].item.textComponent", "interpret": true}]}

execute store result score $item_detect/announce.has_bingo bingo.tmp run data get storage bingo:card teams[-1].hasBingo

# Update item count
execute store result score $item_detect/announce.items bingo.tmp run data get storage bingo:card teams[-1].itemCount
scoreboard players add $item_detect/announce.items bingo.tmp 1
execute store result storage bingo:card teams[-1].itemCount int 1 run scoreboard players get $item_detect/announce.items bingo.tmp

# detect goals
execute if score $item_detect/announce.has_bingo bingo.tmp matches 0 run function bingo:item_detection/helper/goals/bingo/detect_bingo_and_20_no_bingo
execute if score $item_detect/announce.items bingo.tmp matches 25 run function bingo:item_detection/helper/goals/announce_blackout

# clear item
execute store result storage bingo:tmp player int 1 run scoreboard players get @s bingo.id
data modify storage bingo:card slots[{selected: true}].players append from storage bingo:tmp player

data modify storage temp:bingo.input/command_queue queue append from storage bingo:card slots[{selected: true}].item.clearCommand[0]
data modify storage temp:bingo.input/command_queue queue append value "function bingo:item_detection/helper/tag_players_for_item_clear"
data modify storage temp:bingo.input/command_queue queue append from storage bingo:card slots[{selected: true}].item.clearCommand[1]
data modify storage temp:bingo.input/command_queue queue append value "tag @a remove bingo.clear"
data modify storage temp:bingo.input/command_queue queue append value "data modify storage bingo:card slots[{selected: true}].selected set value false"

function bingo:command_queue/run