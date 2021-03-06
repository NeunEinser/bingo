execute in minecraft:overworld run function neun_einser.timer:store_current_time

tellraw @a {"translate": "bingo.got_item", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@s"}, {"storage": "bingo:card", "nbt": "slots[{selected: true}].item.textComponent", "interpret": true}]}

data modify storage bingo:tmp slots append from storage bingo:tmp previousSlots[]
data modify storage bingo:card teams[{selected: true}].slots set from storage bingo:tmp slots

execute store result score $has_bingo bingo.tmp run data get storage bingo:card teams[{selected: true}].hasBingo
execute store result score $items bingo.tmp run data get storage bingo:card teams[{selected: true}].itemCount
scoreboard players add $items bingo.tmp 1
execute store result storage bingo:card teams[{selected: true}].itemCount int 1 run scoreboard players get $items bingo.tmp

execute if score $has_bingo bingo.tmp matches 0 run function bingo:item_detection/helper/goals/detect_bingo
execute if score $items bingo.tmp matches 25 run tellraw @a {"translate": "bingo.got_blackout", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=bingo.in_current_team]"}]}

# clear item
#You srsly can't append from a score directly?!
execute store result storage bingo:tmp player int 1 run scoreboard players get @s bingo.id
data modify storage bingo:card slots[{selected: true}].players append from storage bingo:tmp player

data modify storage temp:bingo.input/command_queue queue append from storage bingo:card slots[{selected: true}].item.clearCommand[0]
data modify storage temp:bingo.input/command_queue queue append value "function bingo:item_detection/helper/tag_players_for_item_clear"
data modify storage temp:bingo.input/command_queue queue append from storage bingo:card slots[{selected: true}].item.clearCommand[1]
data modify storage temp:bingo.input/command_queue queue append value "tag @a remove bingo.clear"
data modify storage temp:bingo.input/command_queue queue append value "data modify storage bingo:card slots[{selected: true}].selected set value false"

function bingo:command_queue/run