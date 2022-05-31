#> bingo:item_detection/announce
#
# This function is called to announce the item get of the current item.
#
# It also announces reaching a goal, when applicable
#
# @within function bingo:item_detection/check_and_announce

#>
# Storage that holds information about the currently selected slot
#
# @internal
#declare storage tmp.bingo:item_detection

#>
# @private
#declare score_holder $item_detect/announce.has_bingo
#>
# @within
# 	function bingo:item_detection/**
#declare score_holder $item_detect/announce.items

execute in bingo:lobby run function neun_einser.timer:store_current_time
scoreboard players reset @s bingo.has_item
tag @s add bingo.clear

# Update item count
execute store result score $item_detect/announce.items bingo.tmp run data get storage bingo:card teams[-1].itemCount
scoreboard players add $item_detect/announce.items bingo.tmp 1
execute store result storage bingo:card teams[-1].itemCount int 1 run scoreboard players get $item_detect/announce.items bingo.tmp

execute as @a[tag=bingo.in_current_team] at @s run playsound minecraft:block.end_portal_frame.fill master @s ~ ~ ~ 1 2
tellraw @a ["[", {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger bingo.menu"}, "hoverEvent":{"action":"show_text", "contents":{"translate":"bingo.game.menu.hover_text"}}}, "] ", {"translate": "bingo.got_item", "with": [{"score": {"name": "$item_detect/announce.items", "objective": "bingo.tmp"}}, {"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@s"}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.item.textComponent", "interpret": true}]}]

execute store result score $item_detect/announce.has_bingo bingo.tmp run data get storage bingo:card teams[-1].hasBingo

# Update completed indicator
execute store result score $item_detect/announce.background_index bingo.tmp run data get storage bingo:card teams[-1].backgroundIndex
data modify storage tmp.bingo:item_detection skippedBackgrounds set value []
function bingo:item_detection/find_background
data modify storage tmp.bingo:item_detection slot.background prepend from storage bingo:card teams[-1].background
data modify storage tmp.bingo:item_detection slot.background prepend from storage tmp.bingo:item_detection skippedBackgrounds[]

execute in bingo:lobby run setblock 0 0 0 minecraft:oak_sign{Text1:'["", {"storage": "tmp.bingo:item_detection", "nbt": "slot.background[0]", "interpret": true}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.background[1]", "interpret": true}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.background[2]", "interpret": true}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.background[3]", "interpret": true}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.background[4]", "interpret": true}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.background[5]", "interpret": true}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.background[6]", "interpret": true}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.background[7]", "interpret": true}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.background[8]", "interpret": true}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.background[9]", "interpret": true}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.background[10]", "interpret": true}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.background[11]", "interpret": true}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.background[12]", "interpret": true}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.background[13]", "interpret": true}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.background[14]", "interpret": true}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.background[15]", "interpret": true}, {"translate": "space.2", "font": "space:default"}, {"storage": "tmp.bingo:item_detection", "nbt": "slot.item.icon", "interpret": true}, {"translate": "space.2", "font": "space:default"}]'}
execute in bingo:lobby run data modify storage tmp.bingo:item_detection slot.display set from block 0 0 0 Text1
execute in bingo:lobby run setblock 0 0 0 minecraft:barrier

# detect goals
execute if score $item_detect/announce.has_bingo bingo.tmp matches 0 run function bingo:item_detection/goals/bingo/detect_bingo_and_20_no_bingo
execute if score $item_detect/announce.items bingo.tmp matches 25 run function bingo:item_detection/goals/announce_blackout

scoreboard players set $update_card bingo.state 1