execute in minecraft:overworld run function timer:store_current_time

tellraw @a {"translate": "bingo.got_item", "with": [{"storage": "timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@s"}, {"storage": "bingo:card", "nbt": "slots[{selected: true}].item.textComponent", "interpret": true}]}

data modify storage bingo:tmp slots append from storage bingo:tmp previousSlots[]
data modify storage bingo:card teams[{selected: true}].slots set from storage bingo:tmp slots