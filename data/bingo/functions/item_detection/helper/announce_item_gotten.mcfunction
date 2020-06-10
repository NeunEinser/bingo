execute in minecraft:overworld run function timer:store_current_time

tellraw @a {"translate": "bingo.got_item", "with": [{"storage": "timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@s"}, {"storage": "bingo:tmp", "nbt": "slot.item.textComponent", "interpret": true}]}

data modify storage bingo:tmp slots append from storage bingo:tmp team.slots[]

execute if entity @s[team=bingo_aqua] run data modify storage bingo:card teams[{id:"bingo:aqua"}].slots set from storage bingo:tmp slots
execute if entity @s[team=bingo_black] run data modify storage bingo:card teams[{id:"bingo:black"}].slots set from storage bingo:tmp slots
execute if entity @s[team=bingo_blue] run data modify storage bingo:card teams[{id:"bingo:blue"}].slots set from storage bingo:tmp slots
execute if entity @s[team=bingo_dark_aqua] run data modify storage bingo:card teams[{id:"bingo:dark_aqua"}].slots set from storage bingo:tmp slots
execute if entity @s[team=bingo_dark_blue] run data modify storage bingo:card teams[{id:"bingo:dark_blue"}].slots set from storage bingo:tmp slots
execute if entity @s[team=bingo_dark_gray] run data modify storage bingo:card teams[{id:"bingo:dark_gray"}].slots set from storage bingo:tmp slots
execute if entity @s[team=bingo_dark_green] run data modify storage bingo:card teams[{id:"bingo:dark_green"}].slots set from storage bingo:tmp slots
execute if entity @s[team=bingo_dark_purpl] run data modify storage bingo:card teams[{id:"bingo:dark_purple"}].slots set from storage bingo:tmp slots
execute if entity @s[team=bingo_dark_red] run data modify storage bingo:card teams[{id:"bingo:dark_red"}].slots set from storage bingo:tmp slots
execute if entity @s[team=bingo_gold] run data modify storage bingo:card teams[{id:"bingo:gold"}].slots set from storage bingo:tmp slots
execute if entity @s[team=bingo_gray] run data modify storage bingo:card teams[{id:"bingo:gray"}].slots set from storage bingo:tmp slots
execute if entity @s[team=bingo_green] run data modify storage bingo:card teams[{id:"bingo:green"}].slots set from storage bingo:tmp slots
execute if entity @s[team=bingo_light_purp] run data modify storage bingo:card teams[{id:"bingo:light_purple"}].slots set from storage bingo:tmp slots
execute if entity @s[team=bingo_red] run data modify storage bingo:card teams[{id:"bingo:red"}].slots set from storage bingo:tmp slots
execute if entity @s[team=bingo_white] run data modify storage bingo:card teams[{id:"bingo:white"}].slots set from storage bingo:tmp slots
execute if entity @s[team=bingo_yellow] run data modify storage bingo:card teams[{id:"bingo:yellow"}].slots set from storage bingo:tmp slots