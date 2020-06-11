# setup objectives
scoreboard objectives remove bingo_seed
scoreboard objectives remove bingo_id
scoreboard objectives remove bingo_tmp
scoreboard objectives remove bingo_const
scoreboard objectives remove bingo_commands
#DONT reset stats
#scoreboard objectives remove bingo_stats

scoreboard objectives add bingo_seed trigger "Trigger for setting the seed value"
scoreboard objectives add bingo_id dummy "Unique player IDs"
scoreboard objectives add bingo_tmp dummy "Temporary values"
scoreboard objectives add bingo_stats dummy "Minecraft Bingo"
scoreboard objectives add bingo_const dummy "Constant Table"
scoreboard objectives add bingo_commands dummy "Scoreboard for run_command_from_string"
#scoreboard objectives setdisplay sidebar bingo_stats
scoreboard players set 2 bingo_const 2
scoreboard players set 4 bingo_const 4
scoreboard players set 5 bingo_const 5
scoreboard players set 6 bingo_const 6

execute in bingo:lobby positioned 0 0 0 run function bingo:init/setup_lobby

# setup teams
## add
team add bingo_aqua
team add bingo_black
team add bingo_blue
team add bingo_dark_aqua
team add bingo_dark_blue
team add bingo_dark_gray
team add bingo_dark_green
team add bingo_dark_purpl
team add bingo_dark_red
team add bingo_gold
team add bingo_gray
team add bingo_green
team add bingo_light_purp
team add bingo_red
team add bingo_white
team add bingo_yellow

## set colors
team modify bingo_aqua color aqua
team modify bingo_black color black
team modify bingo_blue color blue
team modify bingo_dark_aqua color dark_aqua
team modify bingo_dark_blue color dark_blue
team modify bingo_dark_gray color dark_gray
team modify bingo_dark_green color dark_green
team modify bingo_dark_purpl color dark_purple
team modify bingo_dark_red color dark_red
team modify bingo_gold color gold
team modify bingo_gray color gray
team modify bingo_green color green
team modify bingo_light_purp color light_purple
team modify bingo_red color red
team modify bingo_white color white
team modify bingo_yellow color yellow

## setup storage
data remove storage bingo:card teams
data modify storage bingo:card teams append value {id: "bingo:aqua", completedBorder: '{"text": "\\uFFFE", "color": "aqua"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:black", completedBorder: '{"text": "\\uFFFE", "color": "black"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:blue", completedBorder: '{"text": "\\uFFFE", "color": "blue"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:dark_aqua", completedBorder: '{"text": "\\uFFFE", "color": "dark_aqua"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:dark_blue", completedBorder: '{"text": "\\uFFFE", "color": "dark_blue"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:dark_gray", completedBorder: '{"text": "\\uFFFE", "color": "dark_gray"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:dark_green", completedBorder: '{"text": "\\uFFFE", "color": "dark_green"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:dark_purple", completedBorder: '{"text": "\\uFFFE", "color": "dark_purple"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:dark_red", completedBorder: '{"text": "\\uFFFE", "color": "dark_red"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:gold", completedBorder: '{"text": "\\uFFFE", "color": "gold"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:gray", completedBorder: '{"text": "\\uFFFE", "color": "gray"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:green", completedBorder: '{"text": "\\uFFFE", "color": "green"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:light_purple", completedBorder: '{"text": "\\uFFFE", "color": "light_purple"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:red", completedBorder: '{"text": "\\uFFFE", "color": "red"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:white", completedBorder: '{"text": "\\uFFFE", "color": "white"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:yellow", completedBorder: '{"text": "\\uFFFE", "color": "yellow"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}

# categories
data remove storage bingo:main categories
data modify storage bingo:main categories append value {name: "apple", translateableName: '{"translate": "bingo.category.apple"}'}
data modify storage bingo:main categories append value {name: "bow", translateableName: '{"translate": "bingo.category.bow"}'}
data modify storage bingo:main categories append value {name: "brick", translateableName: '{"translate": "bingo.category.bricks"}'}
data modify storage bingo:main categories append value {name: "cactus", translateableName: '{"translate": "bingo.category.cactus"}'}
data modify storage bingo:main categories append value {name: "cactus_bone", translateableName: '{"translate": "bingo.category.cactus_bone"}'}
data modify storage bingo:main categories append value {name: "chest_iron", translateableName: '{"translate": "bingo.category.chest_iron"}'}
data modify storage bingo:main categories append value {name: "chest_loot", translateableName: '{"translate": "bingo.category.chest_loot"}'}
data modify storage bingo:main categories append value {name: "compass", translateableName: '{"translate": "bingo.category.compass"}'}
data modify storage bingo:main categories append value {name: "diamond", translateableName: '{"translate": "bingo.category.diamond"}'}
data modify storage bingo:main categories append value {name: "egg", translateableName: '{"translate": "bingo.category.egg"}'}
data modify storage bingo:main categories append value {name: "enderslime", translateableName: '{"translate": "bingo.category.enderslime"}'}
data modify storage bingo:main categories append value {name: "fish", translateableName: '{"translate": "bingo.category.fish"}'}
data modify storage bingo:main categories append value {name: "flint", translateableName: '{"translate": "bingo.category.flint"}'}
data modify storage bingo:main categories append value {name: "furnace_iron", translateableName: '{"translate": "bingo.category.furnace_iron"}'}
data modify storage bingo:main categories append value {name: "gold", translateableName: '{"translate": "bingo.category.gold"}'}
data modify storage bingo:main categories append value {name: "gunpowder", translateableName: '{"translate": "bingo.category.gunpowder"}'}
data modify storage bingo:main categories append value {name: "heart_of_the_sea", translateableName: '{"translate": "bingo.category.heart_of_the_sea"}'}
data modify storage bingo:main categories append value {name: "ink", translateableName: '{"translate": "bingo.category.ink"}'}
data modify storage bingo:main categories append value {name: "ink_bone", translateableName: '{"translate": "bingo.category.ink_bone"}'}
data modify storage bingo:main categories append value {name: "jungle", translateableName: '{"translate": "bingo.category.jungle"}'}
data modify storage bingo:main categories append value {name: "lapis", translateableName: '{"translate": "bingo.category.lapis"}'}
data modify storage bingo:main categories append value {name: "leather", translateableName: '{"translate": "bingo.category.leather"}'}
data modify storage bingo:main categories append value {name: "magma_block", translateableName: '{"translate": "bingo.category.magma_block"}'}
data modify storage bingo:main categories append value {name: "milk", translateableName: '{"translate": "bingo.category.milk"}'}
data modify storage bingo:main categories append value {name: "mushroom", translateableName: '{"translate": "bingo.category.mushroom"}'}
data modify storage bingo:main categories append value {name: "ominous_banner", translateableName: '{"translate": "bingo.category.ominous_banner"}'}
data modify storage bingo:main categories append value {name: "pumpkin", translateableName: '{"translate": "bingo.category.pumpkin"}'}
data modify storage bingo:main categories append value {name: "rail", translateableName: '{"translate": "bingo.category.rail"}'}
data modify storage bingo:main categories append value {name: "redstone", translateableName: '{"translate": "bingo.category.redstone"}'}
data modify storage bingo:main categories append value {name: "sand", translateableName: '{"translate": "bingo.category.sand"}'}
data modify storage bingo:main categories append value {name: "sapling", translateableName: '{"translate": "bingo.category.sapling"}'}
data modify storage bingo:main categories append value {name: "shearable", translateableName: '{"translate": "bingo.category.shearable"}'}
data modify storage bingo:main categories append value {name: "simple_iron", translateableName: '{"translate": "bingo.category.simple_iron"}'}
data modify storage bingo:main categories append value {name: "snow", translateableName: '{"translate": "bingo.category.snow"}'}
data modify storage bingo:main categories append value {name: "spider", translateableName: '{"translate": "bingo.category.spider"}'}
data modify storage bingo:main categories append value {name: "taiga", translateableName: '{"translate": "bingo.category.taiga"}'}
data modify storage bingo:main categories append value {name: "village", translateableName: '{"translate": "bingo.category.village"}'}
data modify storage bingo:main categories append value {name: "warm_ocean", translateableName: '{"translate": "bingo.category.warm_ocean"}'}
data modify storage bingo:main categories append value {name: "wool", translateableName: '{"translate": "bingo.category.wool"}'}

# items
## 0001: pumpkin_seeds
data modify storage bingo:tmp item set value {id: "bingo:pumpkin_seeds", item: {id: "minecraft:pumpkin_seeds"}, textComponent: '{"translate": "item.minecraft.pumpkin_seeds", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:pumpkin_seeds"}}}', icon: '"\\u0001"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:pumpkin_seeds"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:pumpkin_seeds 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"pumpkin"}].items append from storage bingo:tmp item

## 0002: pumpkin_pie
data modify storage bingo:tmp item set value {id: "bingo:pumpkin_pie", item: {id: "minecraft:pumpkin_pie"}, textComponent: '{"translate": "item.minecraft.pumpkin_pie", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:pumpkin_pie"}}}', icon: '"\\u0002"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:pumpkin_pie"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:pumpkin_pie 1"] , categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"pumpkin"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"egg"}].items append from storage bingo:tmp item

## 0003: egg
data modify storage bingo:tmp item set value {id: "bingo:egg", item: {id: "minecraft:egg"}, textComponent: '{"translate": "item.minecraft.egg", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:egg"}}}', icon: '"\\u0003"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:egg"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:egg 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"egg"}].items append from storage bingo:tmp item

## 0004: cake
data modify storage bingo:tmp item set value {id: "bingo:cake", item: {id: "minecraft:cake"}, textComponent: '{"translate": "bingo.minecraft.cake", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cake"}}}', icon: '"\\u0004"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:cake"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:cake 1"] , categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"egg"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"milk"}].items append from storage bingo:tmp item

## 0005: acacia_sapling
data modify storage bingo:tmp item set value {id: "bingo:acacia_sapling", item: {id: "minecraft:acacia_sapling"}, textComponent: '{"translate": "block.minecraft.acacia_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:acacia_sapling"}}}', icon: '"\\u0005"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:acacia_sapling"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:acacia_sapling 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"sapling"}].items append from storage bingo:tmp item

## 0006: spruce_sapling
data modify storage bingo:tmp item set value {id: "bingo:spruce_sapling", item: {id: "minecraft:spruce_sapling"}, textComponent: '{"translate": "block.minecraft.spruce_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:spruce_sapling"}}}', icon: '"\\u0006"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:spruce_sapling"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:spruce_sapling 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"sapling"}].items append from storage bingo:tmp item

## 0007: cocoa_beans
data modify storage bingo:tmp item set value {id: "bingo:cocoa_beans", item: {id: "minecraft:cocoa_beans"}, textComponent: '{"translate": "item.minecraft.cocoa_beans", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cocoa_beans"}}}', icon: '"\\u0007"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:cocoa_beans"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:cocoa_beans 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"jungle"}].items append from storage bingo:tmp item

## 0008: cookie
data modify storage bingo:tmp item set value {id: "bingo:cookie", item: {id: "minecraft:cookie"}, textComponent: '{"translate": "item.minecraft.cookie", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cookie"}}}', icon: '"\\u0008"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:cookie"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:cookie 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"jungle"}].items append from storage bingo:tmp item

## 0009: melon_slice
data modify storage bingo:tmp item set value {id: "bingo:melon_slice", item: {id: "minecraft:melon_slice"}, textComponent: '{"translate": "item.minecraft.melon_slice", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:melon_slice"}}}', icon: '"\\u0009"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:melon_slice"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:melon_slice 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"jungle"}].items append from storage bingo:tmp item

## 000a: glistering_melon_slice
data modify storage bingo:tmp item set value {id: "bingo:glistering_melon_slice", item: {id: "minecraft:glistering_melon_slice"}, textComponent: '{"translate": "item.minecraft.glistering_melon_slice", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:glistering_melon_slice"}}}', icon: '"\\u000a"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:glistering_melon_slice"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:glistering_melon_slice 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"jungle"}].items append from storage bingo:tmp item

## 000b: dead_bush
data modify storage bingo:tmp item set value {id: "bingo:dead_bush", item: {id: "minecraft:dead_bush"}, textComponent: '{"translate": "block.minecraft.dead_bush", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dead_bush"}}}', icon: '"\\u000b"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:dead_bush"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:dead_bush 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"shearable"}].items append from storage bingo:tmp item

## 000c: fern
data modify storage bingo:tmp item set value {id: "bingo:fern", item: {id: "minecraft:fern"}, textComponent: '{"translate": "block.minecraft.fern", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:fern"}}}', icon: '"\\u000c"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:fern"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:fern 1"] , categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"shearable"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"taiga"}].items append from storage bingo:tmp item

## 000d: vine
data modify storage bingo:tmp item set value {id: "bingo:vine", item: {id: "minecraft:vine"}, textComponent: '{"translate": "block.minecraft.vine", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:vine"}}}', icon: '"\\u000d"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:vine"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:vine 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"shearable"}].items append from storage bingo:tmp item

## 000e: rail
data modify storage bingo:tmp item set value {id: "bingo:rail", item: {id: "minecraft:rail"}, textComponent: '{"translate": "block.minecraft.rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:rail"}}}', icon: '"\\u000e"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:rail"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:rail 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"rail"}].items append from storage bingo:tmp item

## 000f: powered_rail
data modify storage bingo:tmp item set value {id: "bingo:powered_rail", item: {id: "minecraft:powered_rail"}, textComponent: '{"translate": "block.minecraft.powered_rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:powered_rail"}}}', icon: '"\\u000f"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:powered_rail"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:powered_rail 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gold"}].items append from storage bingo:tmp item

## 0010: flint
data modify storage bingo:tmp item set value {id: "bingo:flint", item: {id: "minecraft:flint"}, textComponent: '{"translate": "item.minecraft.flint", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:flint"}}}', icon: '"\\u0010"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:flint"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:flint 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"flint"}].items append from storage bingo:tmp item

## 0011: flint_and_steel
data modify storage bingo:tmp item set value {id: "bingo:flint_and_steel", item: {id: "minecraft:flint_and_steel"}, textComponent: '{"translate": "item.minecraft.flint_and_steel", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:flint_and_steel"}}}', icon: '"\\u0011"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:flint_and_steel"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:flint_and_steel 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"flint"}].items append from storage bingo:tmp item

## 0012: arrow
data modify storage bingo:tmp item set value {id: "bingo:arrow", item: {id: "minecraft:arrow"}, textComponent: '{"translate": "item.minecraft.arrow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:arrow"}}}', icon: '"\\u0012"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:arrow"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:arrow 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"flint"}].items append from storage bingo:tmp item

## 0013: ender_pearl
data modify storage bingo:tmp item set value {id: "bingo:ender_pearl", item: {id: "minecraft:ender_pearl"}, textComponent: '{"translate": "item.minecraft.ender_pearl", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:ender_pearl"}}}', icon: '"\\u0013"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:ender_pearl"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:ender_pearl 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"enderslime"}].items append from storage bingo:tmp item

## 0014: slime_ball
data modify storage bingo:tmp item set value {id: "bingo:slime_ball", item: {id: "minecraft:slime_ball"}, textComponent: '{"translate": "item.minecraft.slime_ball", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:slime_ball"}}}', icon: '"\\u0014"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:slime_ball"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:slime_ball 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"enderslime"}].items append from storage bingo:tmp item

## 0015: firework_rocket
data modify storage bingo:tmp item set value {id: "bingo:firework_rocket", item: {id: "minecraft:firework_rocket"}, textComponent: '{"translate": "item.minecraft.firework_rocket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:firework_rocket"}}}', icon: '"\\u0015"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:firework_rocket"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:firework_rocket 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gunpowder"}].items append from storage bingo:tmp item

## 0016: milk_bucket
data modify storage bingo:tmp item set value {id: "bingo:milk_bucket", item: {id: "minecraft:milk_bucket"}, textComponent: '{"translate": "item.minecraft.milk_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:milk_bucket"}}}', icon: '"\\u0016"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:milk_bucket"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:milk_bucket 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"milk"}].items append from storage bingo:tmp item

## 0017: cauldron
data modify storage bingo:tmp item set value {id: "bingo:cauldron", item: {id: "minecraft:cauldron"}, textComponent: '{"translate": "item.minecraft.cauldron", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cauldron"}}}', icon: '"\\u0017"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:cauldron"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:cauldron 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"simple_iron"}].items append from storage bingo:tmp item

## 0018: saddle
data modify storage bingo:tmp item set value {id: "bingo:saddle", item: {id: "minecraft:saddle"}, textComponent: '{"translate": "item.minecraft.saddle", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:saddle"}}}', icon: '"\\u0018"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:saddle"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:saddle 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"chest_loot"}].items append from storage bingo:tmp item

## 0019: name_tag
data modify storage bingo:tmp item set value {id: "bingo:name_tag", item: {id: "minecraft:name_tag"}, textComponent: '{"translate": "item.minecraft.name_tag", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:name_tag"}}}', icon: '"\\u0019"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:name_tag"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:name_tag 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"chest_loot"}].items append from storage bingo:tmp item

## 001a: painting
data modify storage bingo:tmp item set value {id: "bingo:painting", item: {id: "minecraft:painting"}, textComponent: '{"translate": "item.minecraft.painting", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:painting"}}}', icon: '"\\u001a"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:painting"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:painting 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"wool"}].items append from storage bingo:tmp item

## 001b: item_frame
data modify storage bingo:tmp item set value {id: "bingo:item_frame", item: {id: "minecraft:item_frame"}, textComponent: '{"translate": "item.minecraft.item_frame", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:item_frame"}}}', icon: '"\\u001b"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:item_frame"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:item_frame 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"leather"}].items append from storage bingo:tmp item

## 001c: emerald
data modify storage bingo:tmp item set value {id: "bingo:emerald", item: {id: "minecraft:emerald"}, textComponent: '{"translate": "item.minecraft.emerald", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:emerald"}}}', icon: '"\\u001c"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:emerald"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:emerald 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"village"}].items append from storage bingo:tmp item

## 001d: diamond_shovel
data modify storage bingo:tmp item set value {id: "bingo:diamond_shovel", item: {id: "minecraft:diamond_shovel"}, textComponent: '{"translate": "item.minecraft.diamond_shovel", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_shovel"}}}', icon: '"\\u001d"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:diamond_shovel"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:diamond_shovel 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"diamond"}].items append from storage bingo:tmp item

## 001e: diamond_hoe
data modify storage bingo:tmp item set value {id: "bingo:diamond_hoe", item: {id: "minecraft:diamond_hoe"}, textComponent: '{"translate": "item.minecraft.diamond_hoe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_hoe"}}}', icon: '"\\u001e"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:diamond_hoe"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:diamond_hoe 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"diamond"}].items append from storage bingo:tmp item

## 001f: diamond_axe
data modify storage bingo:tmp item set value {id: "bingo:diamond_axe", item: {id: "minecraft:diamond_axe"}, textComponent: '{"translate": "item.minecraft.diamond_axe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_axe"}}}', icon: '"\\u001f"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:diamond_axe"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:diamond_axe 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"diamond"}].items append from storage bingo:tmp item

## 0021: flower_pot
data modify storage bingo:tmp item set value {id: "bingo:flower_pot", item: {id: "minecraft:flower_pot"}, textComponent: '{"translate": "block.minecraft.flower_pot", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:flower_pot"}}}', icon: '"\\u0021"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:flower_pot"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:flower_pot 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"brick"}].items append from storage bingo:tmp item

## 0022: brick
data modify storage bingo:tmp item set value {id: "bingo:brick", item: {id: "minecraft:brick"}, textComponent: '{"translate": "item.minecraft.brick", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:brick"}}}', icon: '"\\u0022"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:brick"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:brick 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"brick"}].items append from storage bingo:tmp item

## 0023: mushroom_stew
data modify storage bingo:tmp item set value {id: "bingo:mushroom_stew", item: {id: "minecraft:mushroom_stew"}, textComponent: '{"translate": "item.minecraft.mushroom_stew", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:mushroom_stew"}}}', icon: '"\\u0023"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:mushroom_stew"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:mushroom_stew 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"mushroom"}].items append from storage bingo:tmp item

## 0024: beetroot_soup
data modify storage bingo:tmp item set value {id: "bingo:beetroot_soup", item: {id: "minecraft:beetroot_soup"}, textComponent: '{"translate": "item.minecraft.beetroot_soup", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:beetroot_soup"}}}', icon: '"\\u0024"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:beetroot_soup"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:beetroot_soup 1"] , categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"chest_loot"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"village"}].items append from storage bingo:tmp item

## 0025: apple
data modify storage bingo:tmp item set value {id: "bingo:apple", item: {id: "minecraft:apple"}, textComponent: '{"translate": "item.minecraft.apple", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:apple"}}}', icon: '"\\u0025"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:apple"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:apple 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"apple"}].items append from storage bingo:tmp item

## 0026: golden_apple
data modify storage bingo:tmp item set value {id: "bingo:golden_apple", item: {id: "minecraft:golden_apple"}, textComponent: '{"translate": "item.minecraft.golden_apple", "color": "aqua", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_apple"}}}', icon: '"\\u0026"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:golden_apple"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:golden_apple 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"apple"}].items append from storage bingo:tmp item

## 0027: golden_shovel
data modify storage bingo:tmp item set value {id: "bingo:golden_shovel", item: {id: "minecraft:golden_shovel"}, textComponent: '{"translate": "item.minecraft.golden_shovel", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_shovel"}}}', icon: '"\\u0027"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:golden_shovel"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:golden_shovel 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gold"}].items append from storage bingo:tmp item

## 0028: golden_sword
data modify storage bingo:tmp item set value {id: "bingo:golden_sword", item: {id: "minecraft:golden_sword"}, textComponent: '{"translate": "item.minecraft.golden_sword", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_sword"}}}', icon: '"\\u0028"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:golden_sword"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:golden_sword 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gold"}].items append from storage bingo:tmp item

## 0029: clock
data modify storage bingo:tmp item set value {id: "bingo:clock", item: {id: "minecraft:clock"}, textComponent: '{"translate": "item.minecraft.clock", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:clock"}}}', icon: '"\\u0029"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:clock"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:clock 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gold"}].items append from storage bingo:tmp item

## 002a: repeater
data modify storage bingo:tmp item set value {id: "bingo:repeater", item: {id: "minecraft:repeater"}, textComponent: '{"translate": "block.minecraft.repeater", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:repeater"}}}', icon: '"\\u002a"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:repeater"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:repeater 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"redstone"}].items append from storage bingo:tmp item

## 002b: compass
data modify storage bingo:tmp item set value {id: "bingo:compass", item: {id: "minecraft:compass"}, textComponent: '{"translate": "item.minecraft.compass", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:compass"}}}', icon: '"\\u002b"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:compass"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:compass 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"compass"}].items append from storage bingo:tmp item

## 002c: map
data modify storage bingo:tmp item set value {id: "bingo:map", item: {id: "minecraft:map"}, textComponent: '{"translate": "item.minecraft.map", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:map"}}}', icon: '"\\u002c"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:map"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:map 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"compass"}].items append from storage bingo:tmp item

## 002d: book
data modify storage bingo:tmp item set value {id: "bingo:book", item: {id: "minecraft:book"}, textComponent: '{"translate": "item.minecraft.book", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:book"}}}', icon: '"\\u002d"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:book"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:book 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"leather"}].items append from storage bingo:tmp item

## 002e: writable_book
data modify storage bingo:tmp item set value {id: "bingo:writable_book", item: {id: "minecraft:writable_book"}, textComponent: '{"translate": "item.minecraft.writable_book", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:writable_book"}}}', icon: '"\\u002e"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:writable_book"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:writable_book 1"] , categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"leather"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"ink"}].items append from storage bingo:tmp item

## 002f: enchanted_book
data modify storage bingo:tmp item set value {id: "bingo:enchanted_book", item: {id: "minecraft:enchanted_book"}, textComponent: '{"translate": "item.minecraft.enchanted_book", "color": "yellow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:enchanted_book"}}}', icon: '"\\u002f"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:enchanted_book"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:enchanted_book 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"chest_loot"}].items append from storage bingo:tmp item

## 0030: spider_eye
data modify storage bingo:tmp item set value {id: "bingo:spider_eye", item: {id: "minecraft:spider_eye"}, textComponent: '{"translate": "item.minecraft.spider_eye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:spider_eye"}}}', icon: '"\\u0030"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:spider_eye"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:spider_eye 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"spider"}].items append from storage bingo:tmp item

## 0031: fermented_spider_eye
data modify storage bingo:tmp item set value {id: "bingo:fermented_spider_eye", item: {id: "minecraft:fermented_spider_eye"}, textComponent: '{"translate": "item.minecraft.fermented_spider_eye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:fermented_spider_eye"}}}', icon: '"\\u0031"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:fermented_spider_eye"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:fermented_spider_eye 1"] , categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"spider"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"mushroom"}].items append from storage bingo:tmp item

## 0032: gunpowder
data modify storage bingo:tmp item set value {id: "bingo:gunpowder", item: {id: "minecraft:gunpowder"}, textComponent: '{"translate": "item.minecraft.gunpowder", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:gunpowder"}}}', icon: '"\\u0032"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:gunpowder"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:gunpowder 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gunpowder"}].items append from storage bingo:tmp item

## 0033: tnt_minecart
data modify storage bingo:tmp item set value {id: "bingo:tnt_minecart", item: {id: "minecraft:tnt_minecart"}, textComponent: '{"translate": "item.minecraft.tnt_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tnt_minecart"}}}', icon: '"\\u0033"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:tnt_minecart"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:tnt_minecart 1"] , categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"gunpowder"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"sand"}].items append from storage bingo:tmp item

## 0034: hopper
data modify storage bingo:tmp item set value {id: "bingo:hopper", item: {id: "minecraft:hopper"}, textComponent: '{"translate": "block.minecraft.hopper", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:hopper"}}}', icon: '"\\u0034"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:hopper"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:hopper 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"chest_iron"}].items append from storage bingo:tmp item

## 0035: hopper_minecart
data modify storage bingo:tmp item set value {id: "bingo:hopper_minecart", item: {id: "minecraft:hopper_minecart"}, textComponent: '{"translate": "item.minecraft.hopper_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:hopper_minecart"}}}', icon: '"\\u0035"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:hopper_minecart"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:hopper_minecart 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"chest_iron"}].items append from storage bingo:tmp item

## 0036: furnace_minecart
data modify storage bingo:tmp item set value {id: "bingo:furnace_minecart", item: {id: "minecraft:furnace_minecart"}, textComponent: '{"translate": "item.minecraft.furnace_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:furnace_minecart"}}}', icon: '"\\u0036"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:furnace_minecart"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:furnace_minecart 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"furnace_iron"}].items append from storage bingo:tmp item

## 0037: chest_minecart
data modify storage bingo:tmp item set value {id: "bingo:chest_minecart", item: {id: "minecraft:chest_minecart"}, textComponent: '{"translate": "item.minecraft.chest_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:chest_minecart"}}}', icon: '"\\u0037"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:chest_minecart"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:chest_minecart 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"chest_iron"}].items append from storage bingo:tmp item

## 0038: bone
data modify storage bingo:tmp item set value {id: "bingo:bone", item: {id: "minecraft:bone"}, textComponent: '{"translate": "item.minecraft.bone", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bone"}}}', icon: '"\\u0038"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:bone"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:bone 1"] , categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"ink_bone"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"cactus_bone"}].items append from storage bingo:tmp item

## 0039: ink_sac
data modify storage bingo:tmp item set value {id: "bingo:ink_sac", item: {id: "minecraft:ink_sac"}, textComponent: '{"translate": "item.minecraft.ink_sac", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:ink_sac"}}}', icon: '"\\u0039"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:ink_sac"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:ink_sac 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"ink"}].items append from storage bingo:tmp item

## 003a: gray_dye
data modify storage bingo:tmp item set value {id: "bingo:gray_dye", item: {id: "minecraft:gray_dye"}, textComponent: '{"translate": "item.minecraft.gray_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:gray_dye"}}}', icon: '"\\u003a"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:gray_dye"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:gray_dye 1"] , categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"ink"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"ink_bone"}].items append from storage bingo:tmp item

## 003b: green_dye
data modify storage bingo:tmp item set value {id: "bingo:green_dye", item: {id: "minecraft:green_dye"}, textComponent: '{"translate": "item.minecraft.green_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:green_dye"}}}', icon: '"\\u003b"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:green_dye"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:green_dye 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"cactus"}].items append from storage bingo:tmp item

## 003c: lime_dye
data modify storage bingo:tmp item set value {id: "bingo:lime_dye", item: {id: "minecraft:lime_dye"}, textComponent: '{"translate": "item.minecraft.lime_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lime_dye"}}}', icon: '"\\u003c"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:lime_dye"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:lime_dye 1"] , categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"cactus"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"cactus_bone"}].items append from storage bingo:tmp item

## 003d: lapis_lazuli
data modify storage bingo:tmp item set value {id: "bingo:lapis_lazuli", item: {id: "minecraft:lapis_lazuli"}, textComponent: '{"translate": "item.minecraft.lapis_lazuli", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lapis_lazuli"}}}', icon: '"\\u003d"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:lapis_lazuli"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:lapis_lazuli 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"lapis"}].items append from storage bingo:tmp item

## 003e: cyan_dye
data modify storage bingo:tmp item set value {id: "bingo:cyan_dye", item: {id: "minecraft:cyan_dye"}, textComponent: '{"translate": "item.minecraft.cyan_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cyan_dye"}}}', icon: '"\\u003e"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:cyan_dye"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:cyan_dye 1"] , categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"lapis"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"cactus"}].items append from storage bingo:tmp item

## 003f: purple_dye
data modify storage bingo:tmp item set value {id: "bingo:purple_dye", item: {id: "minecraft:purple_dye"}, textComponent: '{"translate": "item.minecraft.purple_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:purple_dye"}}}', icon: '"\\u003f"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:purple_dye"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:purple_dye 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"lapis"}].items append from storage bingo:tmp item

## 0040: suspicious_stew
data modify storage bingo:tmp item set value {id: "bingo:suspicious_stew", item: {id: "minecraft:suspicious_stew"}, textComponent: '{"translate": "item.minecraft.suspicious_stew", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:suspicious_stew"}}}', icon: '"\\u0040"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:suspicious_stew"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:suspicious_stew 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"mushroom"}].items append from storage bingo:tmp item

## 0041: glass_bottle
data modify storage bingo:tmp item set value {id: "bingo:glass_bottle", item: {id: "minecraft:glass_bottle"}, textComponent: '{"translate": "item.minecraft.glass_bottle", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:glass_bottle"}}}', icon: '"\\u0041"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:glass_bottle"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:glass_bottle 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"sand"}].items append from storage bingo:tmp item

## 0042: cod
data modify storage bingo:tmp item set value {id: "bingo:cod", item: {id: "minecraft:cod"}, textComponent: '{"translate": "item.minecraft.cod", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cod"}}}', icon: '"\\u0042"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:cod"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:cod 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"fish"}].items append from storage bingo:tmp item

## 0043: cod_bucket
data modify storage bingo:tmp item set value {id: "bingo:cod_bucket", item: {id: "minecraft:cod_bucket"}, textComponent: '{"translate": "item.minecraft.cod_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cod_bucket"}}}', icon: '"\\u0043"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:cod_bucket"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:cod_bucket 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"fish"}].items append from storage bingo:tmp item

## 0044: salmon
data modify storage bingo:tmp item set value {id: "bingo:salmon", item: {id: "minecraft:salmon"}, textComponent: '{"translate": "item.minecraft.salmon", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:salmon"}}}', icon: '"\\u0044"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:salmon"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:salmon 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"fish"}].items append from storage bingo:tmp item

## 0045: salmon_bucket
data modify storage bingo:tmp item set value {id: "bingo:salmon_bucket", item: {id: "minecraft:salmon_bucket"}, textComponent: '{"translate": "item.minecraft.salmon_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:salmon_bucket"}}}', icon: '"\\u0045"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:salmon_bucket"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:salmon_bucket 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"fish"}].items append from storage bingo:tmp item

## 0046: tropical_fish
data modify storage bingo:tmp item set value {id: "bingo:tropical_fish", item: {id: "minecraft:tropical_fish"}, textComponent: '{"translate": "item.minecraft.tropical_fish", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tropical_fish"}}}', icon: '"\\u0046"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:tropical_fish"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:tropical_fish 1"] , categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"fish"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"warm_ocean"}].items append from storage bingo:tmp item

## 0047: tropical_fish_bucket
data modify storage bingo:tmp item set value {id: "bingo:tropical_fish_bucket", item: {id: "minecraft:tropical_fish_bucket"}, textComponent: '{"translate": "item.minecraft.tropical_fish_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tropical_fish_bucket"}}}', icon: '"\\u0047"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:tropical_fish_bucket"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:tropical_fish_bucket 1"] , categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"fish"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"warm_ocean"}].items append from storage bingo:tmp item

## 0048: birch_sapling
data modify storage bingo:tmp item set value {id: "bingo:birch_sapling", item: {id: "minecraft:birch_sapling"}, textComponent: '{"translate": "block.minecraft.birch_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:birch_sapling"}}}', icon: '"\\u0048"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:birch_sapling"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:birch_sapling 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"sapling"}].items append from storage bingo:tmp item

## 0049: dark_oak_sapling
data modify storage bingo:tmp item set value {id: "bingo:dark_oak_sapling", item: {id: "minecraft:dark_oak_sapling"}, textComponent: '{"translate": "block.minecraft.dark_oak_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dark_oak_sapling"}}}', icon: '"\\u0049"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:dark_oak_sapling"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:dark_oak_sapling 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"sapling"}].items append from storage bingo:tmp item

## 004a: jungle_sapling
data modify storage bingo:tmp item set value {id: "bingo:jungle_sapling", item: {id: "minecraft:jungle_sapling"}, textComponent: '{"translate": "block.minecraft.jungle_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:jungle_sapling"}}}', icon: '"\\u004a"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:jungle_sapling"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:jungle_sapling 1"] , categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"sapling"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"jungle"}].items append from storage bingo:tmp item

## 004b: detector_rail
data modify storage bingo:tmp item set value {id: "bingo:detector_rail", item: {id: "minecraft:detector_rail"}, textComponent: '{"translate": "block.minecraft.detector_rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:detector_rail"}}}', icon: '"\\u004b"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:detector_rail"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:detector_rail 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"rail"}].items append from storage bingo:tmp item

## 004c: activator_rail
data modify storage bingo:tmp item set value {id: "bingo:activator_rail", item: {id: "minecraft:activator_rail"}, textComponent: '{"translate": "block.minecraft.activator_rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:activator_rail"}}}', icon: '"\\u004c"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:activator_rail"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:activator_rail 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"rail"}].items append from storage bingo:tmp item

## 004d: heart_of_the_sea
data modify storage bingo:tmp item set value {id: "bingo:heart_of_the_sea", item: {id: "minecraft:heart_of_the_sea"}, textComponent: '{"translate": "item.minecraft.heart_of_the_sea", "color": "yellow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:heart_of_the_sea"}}}', icon: '"\\u004d"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:heart_of_the_sea"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:heart_of_the_sea 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"heart_of_the_sea"}].items append from storage bingo:tmp item

## 004e: bell
data modify storage bingo:tmp item set value {id: "bingo:bell", item: {id: "minecraft:bell"}, textComponent: '{"translate": "block.minecraft.bell", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bell"}}}', icon: '"\\u004e"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:bell"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:bell 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"village"}].items append from storage bingo:tmp item

## 004f: sweet_berries
data modify storage bingo:tmp item set value {id: "bingo:sweet_berries", item: {id: "minecraft:sweet_berries"}, textComponent: '{"translate": "block.minecraft.sweet_berries", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:sweet_berries"}}}', icon: '"\\u004f"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:sweet_berries"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:sweet_berries 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"taiga"}].items append from storage bingo:tmp item

## 0050: diamond_sword
data modify storage bingo:tmp item set value {id: "bingo:diamond_sword", item: {id: "minecraft:diamond_sword"}, textComponent: '{"translate": "item.minecraft.diamond_sword", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_sword"}}}', icon: '"\\u0050"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:diamond_sword"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:diamond_sword 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"diamond"}].items append from storage bingo:tmp item

## 0051: diamond_pickaxe
data modify storage bingo:tmp item set value {id: "bingo:diamond_pickaxe", item: {id: "minecraft:diamond_pickaxe"}, textComponent: '{"translate": "item.minecraft.diamond_pickaxe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_pickaxe"}}}', icon: '"\\u0051"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:diamond_pickaxe"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:diamond_pickaxe 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"diamond"}].items append from storage bingo:tmp item

## 0052: golden_axe
data modify storage bingo:tmp item set value {id: "bingo:golden_axe", item: {id: "minecraft:golden_axe"}, textComponent: '{"translate": "item.minecraft.golden_axe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_axe"}}}', icon: '"\\u0052"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:golden_axe"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:golden_axe 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gold"}].items append from storage bingo:tmp item

## 0053: golden_pickaxe
data modify storage bingo:tmp item set value {id: "bingo:golden_pickaxe", item: {id: "minecraft:golden_pickaxe"}, textComponent: '{"translate": "item.minecraft.golden_pickaxe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_pickaxe"}}}', icon: '"\\u0053"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:golden_pickaxe"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:golden_pickaxe 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gold"}].items append from storage bingo:tmp item

## 0054: golden_hoe
data modify storage bingo:tmp item set value {id: "bingo:golden_hoe", item: {id: "minecraft:golden_hoe"}, textComponent: '{"translate": "item.minecraft.golden_hoe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_hoe"}}}', icon: '"\\u0054"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:golden_hoe"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:golden_hoe 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gold"}].items append from storage bingo:tmp item

## 0055: crossbow
data modify storage bingo:tmp item set value {id: "bingo:crossbow", item: {id: "minecraft:crossbow"}, textComponent: '{"translate": "item.minecraft.crossbow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:crossbow"}}}', icon: '"\\u0055"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:crossbow"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:crossbow 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"bow"}].items append from storage bingo:tmp item

## 0056: bamboo
data modify storage bingo:tmp item set value {id: "bingo:bamboo", item: {id: "minecraft:bamboo"}, textComponent: '{"translate": "block.minecraft.bamboo", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bamboo"}}}', icon: '"\\u0056"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:bamboo"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:bamboo 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"jungle"}].items append from storage bingo:tmp item

## 0057: sea_pickle
data modify storage bingo:tmp item set value {id: "bingo:sea_pickle", item: {id: "minecraft:sea_pickle"}, textComponent: '{"translate": "item.minecraft.sea_pickle", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:sea_pickle"}}}', icon: '"\\u0057"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:sea_pickle"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:sea_pickle 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"warm_ocean"}].items append from storage bingo:tmp item

## 0058: sea_grass
data modify storage bingo:tmp item set value {id: "bingo:sea_grass", item: {id: "minecraft:sea_grass"}, textComponent: '{"translate": "block.minecraft.sea_grass", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:sea_grass"}}}', icon: '"\\u0058"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:sea_grass"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:sea_grass 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"shearable"}].items append from storage bingo:tmp item

## 0100: iron_block
data modify storage bingo:tmp item set value {id: "bingo:iron_block", item: {id: "minecraft:iron_block"}, textComponent: '{"translate": "item.minecraft.iron_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:iron_block"}}}', icon: '"\\u0100"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:iron_block"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:iron_block 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"simple_iron"}].items append from storage bingo:tmp item

## 0101: redstone_block
data modify storage bingo:tmp item set value {id: "bingo:redstone_block", item: {id: "minecraft:redstone_block"}, textComponent: '{"translate": "block.minecraft.redstone_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:redstone_block"}}}', icon: '"\\u0101"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:redstone_block"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:redstone_block 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"redstone"}].items append from storage bingo:tmp item

## 0102: bookshelf
data modify storage bingo:tmp item set value {id: "bingo:bookshelf", item: {id: "minecraft:bookshelf"}, textComponent: '{"translate": "block.minecraft.bookshelf", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bookshelf"}}}', icon: '"\\u0102"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:bookshelf"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:bookshelf 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"leather"}].items append from storage bingo:tmp item

## 0103: obsidian
data modify storage bingo:tmp item set value {id: "bingo:obsidian", item: {id: "minecraft:obsidian"}, textComponent: '{"translate": "block.minecraft.obsidian", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:obsidian"}}}', icon: '"\\u0103"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:obsidian"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:obsidian 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"diamond"}].items append from storage bingo:tmp item

## 0104: melon
data modify storage bingo:tmp item set value {id: "bingo:melon", item: {id: "minecraft:melon"}, textComponent: '{"translate": "block.minecraft.melon", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:melon"}}}', icon: '"\\u0104"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:melon"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:melon 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"jungle"}].items append from storage bingo:tmp item

## 0105: mossy_stone_bricks
data modify storage bingo:tmp item set value {id: "bingo:mossy_stone_bricks", item: {id: "minecraft:mossy_stone_bricks"}, textComponent: '{"translate": "block.minecraft.mossy_stone_bricks", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:mossy_stone_bricks"}}}', icon: '"\\u0105"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:mossy_stone_bricks"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:mossy_stone_bricks 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"shearable"}].items append from storage bingo:tmp item

## 0106: jukebox
data modify storage bingo:tmp item set value {id: "bingo:jukebox", item: {id: "minecraft:jukebox"}, textComponent: '{"translate": "block.minecraft.jukebox", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:jukebox"}}}', icon: '"\\u0106"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:jukebox"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:jukebox 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"diamond"}].items append from storage bingo:tmp item

## 0107: magma_block
data modify storage bingo:tmp item set value {id: "bingo:magma_block", item: {id: "minecraft:magma_block"}, textComponent: '{"translate": "block.minecraft.magma_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:magma_block"}}}', icon: '"\\u0107"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:magma_block"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:magma_block 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"magma_block"}].items append from storage bingo:tmp item

## 0108: bone_block
data modify storage bingo:tmp item set value {id: "bingo:bone_block", item: {id: "minecraft:bone_block"}, textComponent: '{"translate": "block.minecraft.bone_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bone_block"}}}', icon: '"\\u0108"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:bone_block"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:bone_block 1"] , categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"ink_bone"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"cactus_bone"}].items append from storage bingo:tmp item

## 0109: blast_furnace
data modify storage bingo:tmp item set value {id: "bingo:blast_furnace", item: {id: "minecraft:blast_furnace"}, textComponent: '{"translate": "block.minecraft.blast_furnace", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:blast_furnace"}}}', icon: '"\\u0109"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:blast_furnace"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:blast_furnace 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"furnace_iron"}].items append from storage bingo:tmp item

## 010a: ominous_banner
data modify storage bingo:tmp item set value {id: "bingo:ominous_banner", item: {id: "minecraft:white_banner", tag: {BlockEntityTag: {Patterns: [{Pattern: "mr", Color: 9}, {Pattern: "bs", Color: 8}, {Pattern: "cs", Color: 7}, {Pattern: "bo", Color: 8}, {Pattern: "ms", Color: 15}, {Pattern: "hh", Color: 8}, {Pattern: "mc", Color: 8}, {Pattern: "bo", Color: 15}]}, display: {Name: '{"color":"gold","translate":"block.minecraft.ominous_banner"}'}}}, textComponent: '{"translate": "block.minecraft.ominous_banner", "color": "gold", "italic": true, "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:white_banner", "tag": "{BlockEntityTag: {Patterns: [{Pattern: "mr", Color: 9}, {Pattern: "bs", Color: 8}, {Pattern: "cs", Color: 7}, {Pattern: "bo", Color: 8}, {Pattern: "ms", Color: 15}, {Pattern: "hh", Color: 8}, {Pattern: "mc", Color: 8}, {Pattern: "bo", Color: 15}]}, display: {Name: "{\\"color\\":\\"gold\\",\\"translate\\":\\"block.minecraft.ominous_banner\\"}"}}"}}}', icon: '"\\u010a"', clearCommand: ['clear @a[tag=bingo_clear_ominous_banner] minecraft:white_banner{BlockEntityTag: {Patterns: [{Pattern: "mr", Color: 9}, {Pattern: "bs", Color: 8}, {Pattern: "cs", Color: 7}, {Pattern: "bo", Color: 8}, {Pattern: "ms", Color: 15}, {Pattern: "hh", Color: 8}, {Pattern: "mc", Color: 8}, {Pattern: "bo", Color: 15}]}, display: {Name: "{"color":"gold","translate":"block.minecraft.ominous_banner"}"}} 1', "tag remove @a bingo_clear_ominous_banner"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"ominous_banner"}].items append from storage bingo:tmp item

## 010b: red_bed
data modify storage bingo:tmp item set value {id: "bingo:red_bed", item: {id: "minecraft:red_bed"}, textComponent: '{"translate": "item.minecraft.red_bed", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:red_bed"}}}', icon: '"\\u010b"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:red_bed"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:red_bed 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"wool"}].items append from storage bingo:tmp item

## 010c: target
data modify storage bingo:tmp item set value {id: "bingo:target", item: {id: "minecraft:target"}, textComponent: '{"translate": "block.minecraft.target", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:target"}}}', icon: '"\\u010c"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:target"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:target 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"redstone"}].items append from storage bingo:tmp item

## 010d: snow
data modify storage bingo:tmp item set value {id: "bingo:snow", item: {id: "minecraft:snow"}, textComponent: '{"translate": "block.minecraft.snow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:snow"}}}', icon: '"\\u010d"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:snow"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:snow 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"snow"}].items append from storage bingo:tmp item

## 010e: snow_block
data modify storage bingo:tmp item set value {id: "bingo:snow_block", item: {id: "minecraft:snow_block"}, textComponent: '{"translate": "block.minecraft.snow_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:snow_block"}}}', icon: '"\\u010e"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:snow_block"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:snow_block 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"snow"}].items append from storage bingo:tmp item

## 010f: jack_o_lantern
data modify storage bingo:tmp item set value {id: "bingo:jack_o_lantern", item: {id: "minecraft:jack_o_lantern"}, textComponent: '{"translate": "block.minecraft.jack_o_lantern", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:jack_o_lantern"}}}', icon: '"\\u010f"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:jack_o_lantern"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:jack_o_lantern 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"pumpkin"}].items append from storage bingo:tmp item

## 0110: tnt
data modify storage bingo:tmp item set value {id: "bingo:tnt", item: {id: "minecraft:tnt"}, textComponent: '{"translate": "block.minecraft.tnt", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tnt"}}}', icon: '"\\u0110"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:tnt"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:tnt 1"] , categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"gunpowder"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"sand"}].items append from storage bingo:tmp item

## 0111: lapis_block
data modify storage bingo:tmp item set value {id: "bingo:lapis_block", item: {id: "minecraft:lapis_block"}, textComponent: '{"translate": "block.minecraft.lapis_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lapis_block"}}}', icon: '"\\u0111"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:lapis_block"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:lapis_block 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"lapis"}].items append from storage bingo:tmp item

## 0112: dispenser
data modify storage bingo:tmp item set value {id: "bingo:dispenser", item: {id: "minecraft:dispenser"}, textComponent: '{"translate": "block.minecraft.dispenser", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dispenser"}}}', icon: '"\\u0112"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:dispenser"}}].selected set value true', "clear @a[tag=bingo_clear] minecraft:dispenser 1"] , categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"bow"}].items append from storage bingo:tmp item

# regenerate card
scoreboard players operation $seed random_main = Seed bingo_stats
function random:set_seed

function bingo:card_generation/generate_card