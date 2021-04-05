#> bingo:init/register_items
#
# Registers all default bingo items.
#
# If you want to make an extension pack which adds more items, please make
# another function in your own namespace and add it to the function tag
# #bingo:register_items
#
# @within tag/function bingo:register_items
# @handles #bingo:register_items

# categories
data modify storage bingo:items categories append value {name: "bingo:apple", translateableName: '{"translate": "bingo.category.apple"}'}
data modify storage bingo:items categories append value {name: "bingo:bow", translateableName: '{"translate": "bingo.category.bow"}'}
data modify storage bingo:items categories append value {name: "bingo:brick", translateableName: '{"translate": "bingo.category.bricks"}'}
data modify storage bingo:items categories append value {name: "bingo:cactus", translateableName: '{"translate": "bingo.category.cactus"}'}
data modify storage bingo:items categories append value {name: "bingo:cactus_bone", translateableName: '{"translate": "bingo.category.cactus_bone"}'}
data modify storage bingo:items categories append value {name: "bingo:chest_iron", translateableName: '{"translate": "bingo.category.chest_iron"}'}
data modify storage bingo:items categories append value {name: "bingo:chest_loot", translateableName: '{"translate": "bingo.category.chest_loot"}'}
data modify storage bingo:items categories append value {name: "bingo:compass", translateableName: '{"translate": "bingo.category.compass"}'}
data modify storage bingo:items categories append value {name: "bingo:diamond", translateableName: '{"translate": "bingo.category.diamond"}'}
data modify storage bingo:items categories append value {name: "bingo:emerald", translateableName: '{"translate": "bingo.category.emerald"}'}
data modify storage bingo:items categories append value {name: "bingo:egg", translateableName: '{"translate": "bingo.category.egg"}'}
data modify storage bingo:items categories append value {name: "bingo:enderslime", translateableName: '{"translate": "bingo.category.enderslime"}'}
data modify storage bingo:items categories append value {name: "bingo:fish", translateableName: '{"translate": "bingo.category.fish"}'}
data modify storage bingo:items categories append value {name: "bingo:flint", translateableName: '{"translate": "bingo.category.flint"}'}
data modify storage bingo:items categories append value {name: "bingo:furnace", translateableName: '{"translate": "bingo.category.furnace"}'}
data modify storage bingo:items categories append value {name: "bingo:gold_and_ruined_portal", translateableName: '{"translate": "bingo.category.gold_and_ruined_portal"}'}
data modify storage bingo:items categories append value {name: "bingo:gunpowder", translateableName: '{"translate": "bingo.category.gunpowder"}'}
data modify storage bingo:items categories append value {name: "bingo:heart_of_the_sea", translateableName: '{"translate": "bingo.category.heart_of_the_sea"}'}
data modify storage bingo:items categories append value {name: "bingo:ink", translateableName: '{"translate": "bingo.category.ink"}'}
data modify storage bingo:items categories append value {name: "bingo:ink_bone", translateableName: '{"translate": "bingo.category.ink_bone"}'}
data modify storage bingo:items categories append value {name: "bingo:jungle", translateableName: '{"translate": "bingo.category.jungle"}'}
data modify storage bingo:items categories append value {name: "bingo:rabbit", translateableName: '{"translate": "bingo.category.rabbit"}'}
data modify storage bingo:items categories append value {name: "bingo:lapis", translateableName: '{"translate": "bingo.category.lapis"}'}
data modify storage bingo:items categories append value {name: "bingo:leather", translateableName: '{"translate": "bingo.category.leather"}'}
data modify storage bingo:items categories append value {name: "bingo:lime", translateableName: '{"translate": "bingo.category.lime"}'}
data modify storage bingo:items categories append value {name: "bingo:milk", translateableName: '{"translate": "bingo.category.milk"}'}
data modify storage bingo:items categories append value {name: "bingo:mushroom", translateableName: '{"translate": "bingo.category.mushroom"}'}
data modify storage bingo:items categories append value {name: "bingo:nine_smelts_one", translateableName: '{"translate": "bingo.category.nine_smelts_one"}'}
#data modify storage bingo:items categories append value {name: "bingo:ominous_banner", translateableName: '{"translate": "bingo.category.ominous_banner"}'}
data modify storage bingo:items categories append value {name: "bingo:pumpkin", translateableName: '{"translate": "bingo.category.pumpkin"}'}
data modify storage bingo:items categories append value {name: "bingo:rail", translateableName: '{"translate": "bingo.category.rail"}'}
data modify storage bingo:items categories append value {name: "bingo:redstone", translateableName: '{"translate": "bingo.category.redstone"}'}
data modify storage bingo:items categories append value {name: "bingo:sand", translateableName: '{"translate": "bingo.category.sand"}'}
data modify storage bingo:items categories append value {name: "bingo:sapling", translateableName: '{"translate": "bingo.category.sapling"}'}
data modify storage bingo:items categories append value {name: "bingo:shearable", translateableName: '{"translate": "bingo.category.shearable"}'}
data modify storage bingo:items categories append value {name: "bingo:simple_iron", translateableName: '{"translate": "bingo.category.simple_iron"}'}
data modify storage bingo:items categories append value {name: "bingo:snow", translateableName: '{"translate": "bingo.category.snow"}'}
data modify storage bingo:items categories append value {name: "bingo:spider", translateableName: '{"translate": "bingo.category.spider"}'}
data modify storage bingo:items categories append value {name: "bingo:taiga", translateableName: '{"translate": "bingo.category.taiga"}'}
#data modify storage bingo:items categories append value {name: "bingo:village", translateableName: '{"translate": "bingo.category.village"}'}
data modify storage bingo:items categories append value {name: "bingo:wheat", translateableName: '{"translate": "bingo.category.wheat"}'}
data modify storage bingo:items categories append value {name: "bingo:wool", translateableName: '{"translate": "bingo.category.wool"}'}

# items

## 0001: pumpkin_seeds
data modify storage bingo:items registry append value {id: "bingo:pumpkin_seeds", item: {id: "minecraft:pumpkin_seeds"}, textComponent: '{"translate": "item.minecraft.pumpkin_seeds", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:pumpkin_seeds"}}}', icon: '"\\u0001"', clearCommand: "clear @a[tag=bingo.clear] minecraft:pumpkin_seeds 1", categories: ["bingo:pumpkin"], weight: 1}

## 0002: pumpkin_pie
data modify storage bingo:items registry append value {id: "bingo:pumpkin_pie", item: {id: "minecraft:pumpkin_pie"}, textComponent: '{"translate": "item.minecraft.pumpkin_pie", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:pumpkin_pie"}}}', icon: '"\\u0002"', clearCommand: "clear @a[tag=bingo.clear] minecraft:pumpkin_pie 1", categories: ["bingo:pumpkin", "bingo:egg"], weight: 1}

## 0003: egg
data modify storage bingo:items registry append value {id: "bingo:egg", item: {id: "minecraft:egg"}, textComponent: '{"translate": "item.minecraft.egg", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:egg"}}}', icon: '"\\u0003"', clearCommand: "clear @a[tag=bingo.clear] minecraft:egg 1", categories: ["bingo:egg"], weight: 1}

## 0004: cake
data modify storage bingo:items registry append value {id: "bingo:cake", item: {id: "minecraft:cake"}, textComponent: '{"translate": "block.minecraft.cake", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cake"}}}', icon: '"\\u0004"', clearCommand: "clear @a[tag=bingo.clear] minecraft:cake 1", categories: ["bingo:egg", "bingo:milk", "bingo:wheat"], weight: 1}

## 0005: acacia_sapling
data modify storage bingo:items registry append value {id: "bingo:acacia_sapling", item: {id: "minecraft:acacia_sapling"}, textComponent: '{"translate": "block.minecraft.acacia_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:acacia_sapling"}}}', icon: '"\\u0005"', clearCommand: "clear @a[tag=bingo.clear] minecraft:acacia_sapling 1", categories: ["bingo:sapling"], weight: 1}

## 0006: spruce_sapling
data modify storage bingo:items registry append value {id: "bingo:spruce_sapling", item: {id: "minecraft:spruce_sapling"}, textComponent: '{"translate": "block.minecraft.spruce_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:spruce_sapling"}}}', icon: '"\\u0006"', clearCommand: "clear @a[tag=bingo.clear] minecraft:spruce_sapling 1", categories: ["bingo:sapling"], weight: 1}

## 0007: cocoa_beans
data modify storage bingo:items registry append value {id: "bingo:cocoa_beans", item: {id: "minecraft:cocoa_beans"}, textComponent: '{"translate": "item.minecraft.cocoa_beans", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cocoa_beans"}}}', icon: '"\\u0007"', clearCommand: "clear @a[tag=bingo.clear] minecraft:cocoa_beans 1", categories: ["bingo:jungle"], weight: 1}

## 0008: cookie
data modify storage bingo:items registry append value {id: "bingo:cookie", item: {id: "minecraft:cookie"}, textComponent: '{"translate": "item.minecraft.cookie", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cookie"}}}', icon: '"\\u0008"', clearCommand: "clear @a[tag=bingo.clear] minecraft:cookie 1", categories: ["bingo:jungle"], weight: 1}

## 0009: melon_slice
data modify storage bingo:items registry append value {id: "bingo:melon_slice", item: {id: "minecraft:melon_slice"}, textComponent: '{"translate": "item.minecraft.melon_slice", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:melon_slice"}}}', icon: '"\\u0009"', clearCommand: "clear @a[tag=bingo.clear] minecraft:melon_slice 1", categories: ["bingo:jungle"], weight: 1}

## 000a: glistering_melon_slice
data modify storage bingo:items registry append value {id: "bingo:glistering_melon_slice", item: {id: "minecraft:glistering_melon_slice"}, textComponent: '{"translate": "item.minecraft.glistering_melon_slice", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:glistering_melon_slice"}}}', icon: '"\\u000a"', clearCommand: "clear @a[tag=bingo.clear] minecraft:glistering_melon_slice 1", categories: ["bingo:jungle"], weight: 1}

## 000b: dead_bush
data modify storage bingo:items registry append value {id: "bingo:dead_bush", item: {id: "minecraft:dead_bush"}, textComponent: '{"translate": "block.minecraft.dead_bush", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dead_bush"}}}', icon: '"\\u000b"', clearCommand: "clear @a[tag=bingo.clear] minecraft:dead_bush 1", categories: ["bingo:shearable"], weight: 1}

## 000c: fern
data modify storage bingo:items registry append value {id: "bingo:fern", item: {id: "minecraft:fern"}, textComponent: '{"translate": "block.minecraft.fern", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:fern"}}}', icon: '"\\u000c"', clearCommand: "clear @a[tag=bingo.clear] minecraft:fern 1", categories: ["bingo:shearable", "bingo:taiga"], weight: 1}

## 000d: vine
data modify storage bingo:items registry append value {id: "bingo:vine", item: {id: "minecraft:vine"}, textComponent: '{"translate": "block.minecraft.vine", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:vine"}}}', icon: '"\\u000d"', clearCommand: "clear @a[tag=bingo.clear] minecraft:vine 1", categories: ["bingo:shearable"], weight: 1}

## 000e: rail
data modify storage bingo:items registry append value {id: "bingo:rail", item: {id: "minecraft:rail"}, textComponent: '{"translate": "block.minecraft.rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:rail"}}}', icon: '"\\u000e"', clearCommand: "clear @a[tag=bingo.clear] minecraft:rail 1", categories: ["bingo:rail"], weight: 1}

## 000f: powered_rail
data modify storage bingo:items registry append value {id: "bingo:powered_rail", item: {id: "minecraft:powered_rail"}, textComponent: '{"translate": "block.minecraft.powered_rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:powered_rail"}}}', icon: '"\\u000f"', clearCommand: "clear @a[tag=bingo.clear] minecraft:powered_rail 1", categories: ["bingo:gold_and_ruined_portal"], weight: 1}

## 0010: flint
data modify storage bingo:items registry append value {id: "bingo:flint", item: {id: "minecraft:flint"}, textComponent: '{"translate": "item.minecraft.flint", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:flint"}}}', icon: '"\\u0010"', clearCommand: "clear @a[tag=bingo.clear] minecraft:flint 1", categories: ["bingo:flint"], weight: 1}

## 0011: flint_and_steel
data modify storage bingo:items registry append value {id: "bingo:flint_and_steel", item: {id: "minecraft:flint_and_steel"}, textComponent: '{"translate": "item.minecraft.flint_and_steel", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:flint_and_steel"}}}', icon: '"\\u0011"', clearCommand: "clear @a[tag=bingo.clear] minecraft:flint_and_steel 1", categories: ["bingo:flint"], weight: 1}

## 0012: arrow
data modify storage bingo:items registry append value {id: "bingo:arrow", item: {id: "minecraft:arrow"}, textComponent: '{"translate": "item.minecraft.arrow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:arrow"}}}', icon: '"\\u0012"', clearCommand: "clear @a[tag=bingo.clear] minecraft:arrow 1", categories: ["bingo:flint"], weight: 1}

## 0013: ender_pearl
data modify storage bingo:items registry append value {id: "bingo:ender_pearl", item: {id: "minecraft:ender_pearl"}, textComponent: '{"translate": "item.minecraft.ender_pearl", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:ender_pearl"}}}', icon: '"\\u0013"', clearCommand: "clear @a[tag=bingo.clear] minecraft:ender_pearl 1", categories: ["bingo:enderslime"], weight: 1}

## 0014: slime_ball
data modify storage bingo:items registry append value {id: "bingo:slime_ball", item: {id: "minecraft:slime_ball"}, textComponent: '{"translate": "item.minecraft.slime_ball", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:slime_ball"}}}', icon: '"\\u0014"', clearCommand: "clear @a[tag=bingo.clear] minecraft:slime_ball 1", categories: ["bingo:enderslime"], weight: 1}

## 0015: firework_rocket
data modify storage bingo:items registry append value {id: "bingo:firework_rocket", item: {id: "minecraft:firework_rocket"}, textComponent: '{"translate": "item.minecraft.firework_rocket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:firework_rocket"}}}', icon: '"\\u0015"', clearCommand: "clear @a[tag=bingo.clear] minecraft:firework_rocket 1", categories: ["bingo:gunpowder"], weight: 1}

## 0016: milk_bucket
data modify storage bingo:items registry append value {id: "bingo:milk_bucket", item: {id: "minecraft:milk_bucket"}, textComponent: '{"translate": "item.minecraft.milk_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:milk_bucket"}}}', icon: '"\\u0016"', clearCommand: "clear @a[tag=bingo.clear] minecraft:milk_bucket 1", categories: ["bingo:milk"], weight: 1}

## 0017: cauldron
data modify storage bingo:items registry append value {id: "bingo:cauldron", item: {id: "minecraft:cauldron"}, textComponent: '{"translate": "block.minecraft.cauldron", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cauldron"}}}', icon: '"\\u0017"', clearCommand: "clear @a[tag=bingo.clear] minecraft:cauldron 1", categories: ["bingo:simple_iron"], weight: 1}
#
## 0018: saddle
data modify storage bingo:items registry append value {id: "bingo:saddle", item: {id: "minecraft:saddle"}, textComponent: '{"translate": "item.minecraft.saddle", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:saddle"}}}', icon: '"\\u0018"', clearCommand: "clear @a[tag=bingo.clear] minecraft:saddle 1", categories: ["bingo:chest_loot"], weight: 1}

## 0019: name_tag
data modify storage bingo:items registry append value {id: "bingo:name_tag", item: {id: "minecraft:name_tag"}, textComponent: '{"translate": "item.minecraft.name_tag", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:name_tag"}}}', icon: '"\\u0019"', clearCommand: "clear @a[tag=bingo.clear] minecraft:name_tag 1", categories: ["bingo:chest_loot"], weight: 1}

## 001a: painting
data modify storage bingo:items registry append value {id: "bingo:painting", item: {id: "minecraft:painting"}, textComponent: '{"translate": "item.minecraft.painting", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:painting"}}}', icon: '"\\u001a"', clearCommand: "clear @a[tag=bingo.clear] minecraft:painting 1", categories: ["bingo:wool"], weight: 1}

## 001b: item_frame
data modify storage bingo:items registry append value {id: "bingo:item_frame", item: {id: "minecraft:item_frame"}, textComponent: '{"translate": "item.minecraft.item_frame", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:item_frame"}}}', icon: '"\\u001b"', clearCommand: "clear @a[tag=bingo.clear] minecraft:item_frame 1", categories: ["bingo:leather"], weight: 1}

## 001c: emerald
data modify storage bingo:items registry append value {id: "bingo:emerald", item: {id: "minecraft:emerald"}, textComponent: '{"translate": "item.minecraft.emerald", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:emerald"}}}', icon: '"\\u001c"', clearCommand: "clear @a[tag=bingo.clear] minecraft:emerald 1", categories: ["bingo:emerald"], weight: 1}
#
## 001d: diamond_shovel
data modify storage bingo:items registry append value {id: "bingo:diamond_shovel", item: {id: "minecraft:diamond_shovel"}, textComponent: '{"translate": "item.minecraft.diamond_shovel", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_shovel"}}}', icon: '"\\u001d"', clearCommand: "clear @a[tag=bingo.clear] minecraft:diamond_shovel 1", categories: ["bingo:diamond"], weight: 1}

## 001e: diamond_hoe
data modify storage bingo:items registry append value {id: "bingo:diamond_hoe", item: {id: "minecraft:diamond_hoe"}, textComponent: '{"translate": "item.minecraft.diamond_hoe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_hoe"}}}', icon: '"\\u001e"', clearCommand: "clear @a[tag=bingo.clear] minecraft:diamond_hoe 1", categories: ["bingo:diamond"], weight: 1}

## 001f: diamond_axe
data modify storage bingo:items registry append value {id: "bingo:diamond_axe", item: {id: "minecraft:diamond_axe"}, textComponent: '{"translate": "item.minecraft.diamond_axe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_axe"}}}', icon: '"\\u001f"', clearCommand: "clear @a[tag=bingo.clear] minecraft:diamond_axe 1", categories: ["bingo:diamond"], weight: 1}

## 0021: flower_pot
data modify storage bingo:items registry append value {id: "bingo:flower_pot", item: {id: "minecraft:flower_pot"}, textComponent: '{"translate": "block.minecraft.flower_pot", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:flower_pot"}}}', icon: '"\\u0021"', clearCommand: "clear @a[tag=bingo.clear] minecraft:flower_pot 1", categories: ["bingo:brick"], weight: 1}

## 0022: brick
data modify storage bingo:items registry append value {id: "bingo:brick", item: {id: "minecraft:brick"}, textComponent: '{"translate": "item.minecraft.brick", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:brick"}}}', icon: '"\\u0022"', clearCommand: "clear @a[tag=bingo.clear] minecraft:brick 1", categories: ["bingo:brick"], weight: 1}

## 0023: mushroom_stew
data modify storage bingo:items registry append value {id: "bingo:mushroom_stew", item: {id: "minecraft:mushroom_stew"}, textComponent: '{"translate": "item.minecraft.mushroom_stew", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:mushroom_stew"}}}', icon: '"\\u0023"', clearCommand: "clear @a[tag=bingo.clear] minecraft:mushroom_stew 1", categories: ["bingo:mushroom"], weight: 1}

## 0024: beetroot_soup
data modify storage bingo:items registry append value {id: "bingo:beetroot_soup", item: {id: "minecraft:beetroot_soup"}, textComponent: '{"translate": "item.minecraft.beetroot_soup", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:beetroot_soup"}}}', icon: '"\\u0024"', clearCommand: "clear @a[tag=bingo.clear] minecraft:beetroot_soup 1", categories: ["bingo:chest_loot"], weight: 1}
#
## 0025: apple
data modify storage bingo:items registry append value {id: "bingo:apple", item: {id: "minecraft:apple"}, textComponent: '{"translate": "item.minecraft.apple", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:apple"}}}', icon: '"\\u0025"', clearCommand: "clear @a[tag=bingo.clear] minecraft:apple 1", categories: ["bingo:apple"], weight: 1}

## 0026: golden_apple
data modify storage bingo:items registry append value {id: "bingo:golden_apple", item: {id: "minecraft:golden_apple"}, textComponent: '{"translate": "item.minecraft.golden_apple", "color": "aqua", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_apple"}}}', icon: '"\\u0026"', clearCommand: "clear @a[tag=bingo.clear] minecraft:golden_apple 1", categories: ["bingo:apple"], weight: 1}

## 0027: golden_shovel
data modify storage bingo:items registry append value {id: "bingo:golden_shovel", item: {id: "minecraft:golden_shovel"}, textComponent: '{"translate": "item.minecraft.golden_shovel", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_shovel"}}}', icon: '"\\u0027"', clearCommand: "clear @a[tag=bingo.clear] minecraft:golden_shovel 1", categories: ["bingo:gold_and_ruined_portal"], weight: 1}

## 0028: golden_sword
data modify storage bingo:items registry append value {id: "bingo:golden_sword", item: {id: "minecraft:golden_sword"}, textComponent: '{"translate": "item.minecraft.golden_sword", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_sword"}}}', icon: '"\\u0028"', clearCommand: "clear @a[tag=bingo.clear] minecraft:golden_sword 1", categories: ["bingo:gold_and_ruined_portal"], weight: 1}

## 0029: clock
data modify storage bingo:items registry append value {id: "bingo:clock", item: {id: "minecraft:clock"}, textComponent: '{"translate": "item.minecraft.clock", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:clock"}}}', icon: '"\\u0029"', clearCommand: "clear @a[tag=bingo.clear] minecraft:clock 1", categories: ["bingo:gold_and_ruined_portal"], weight: 1}

## 002a: repeater
data modify storage bingo:items registry append value {id: "bingo:repeater", item: {id: "minecraft:repeater"}, textComponent: '{"translate": "block.minecraft.repeater", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:repeater"}}}', icon: '"\\u002a"', clearCommand: "clear @a[tag=bingo.clear] minecraft:repeater 1", categories: ["bingo:redstone"], weight: 1}

## 002b: compass
data modify storage bingo:items registry append value {id: "bingo:compass", item: {id: "minecraft:compass"}, textComponent: '{"translate": "item.minecraft.compass", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:compass"}}}', icon: '"\\u002b"', clearCommand: "clear @a[tag=bingo.clear] minecraft:compass 1", categories: ["bingo:compass"], weight: 1}

## 002c: map
data modify storage bingo:items registry append value {id: "bingo:map", item: {id: "minecraft:map"}, textComponent: '{"translate": "item.minecraft.map", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:map"}}}', icon: '"\\u002c"', clearCommand: "clear @a[tag=bingo.clear] minecraft:map 1", categories: ["bingo:compass"], weight: 1}

## 002d: book
data modify storage bingo:items registry append value {id: "bingo:book", item: {id: "minecraft:book"}, textComponent: '{"translate": "item.minecraft.book", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:book"}}}', icon: '"\\u002d"', clearCommand: "clear @a[tag=bingo.clear] minecraft:book 1", categories: ["bingo:leather"], weight: 1}

## 002e: writable_book
data modify storage bingo:items registry append value {id: "bingo:writable_book", item: {id: "minecraft:writable_book"}, textComponent: '{"translate": "item.minecraft.writable_book", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:writable_book"}}}', icon: '"\\u002e"', clearCommand: "clear @a[tag=bingo.clear] minecraft:writable_book 1", categories: ["bingo:leather", "bingo:ink"], weight: 1}

## 002f: enchanted_book
data modify storage bingo:items registry append value {id: "bingo:enchanted_book", item: {id: "minecraft:enchanted_book"}, textComponent: '{"translate": "item.minecraft.enchanted_book", "color": "yellow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:enchanted_book"}}}', icon: '"\\u002f"', clearCommand: "clear @a[tag=bingo.clear] minecraft:enchanted_book 1", categories: ["bingo:chest_loot"], weight: 1}

## 0030: spider_eye
data modify storage bingo:items registry append value {id: "bingo:spider_eye", item: {id: "minecraft:spider_eye"}, textComponent: '{"translate": "item.minecraft.spider_eye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:spider_eye"}}}', icon: '"\\u0030"', clearCommand: "clear @a[tag=bingo.clear] minecraft:spider_eye 1", categories: ["bingo:spider"], weight: 1}

## 0031: fermented_spider_eye
data modify storage bingo:items registry append value {id: "bingo:fermented_spider_eye", item: {id: "minecraft:fermented_spider_eye"}, textComponent: '{"translate": "item.minecraft.fermented_spider_eye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:fermented_spider_eye"}}}', icon: '"\\u0031"', clearCommand: "clear @a[tag=bingo.clear] minecraft:fermented_spider_eye 1", categories: ["bingo:spider", "bingo:mushroom"], weight: 1}

## 0032: gunpowder
data modify storage bingo:items registry append value {id: "bingo:gunpowder", item: {id: "minecraft:gunpowder"}, textComponent: '{"translate": "item.minecraft.gunpowder", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:gunpowder"}}}', icon: '"\\u0032"', clearCommand: "clear @a[tag=bingo.clear] minecraft:gunpowder 1", categories: ["bingo:gunpowder"], weight: 1}

## 0033: tnt_minecart
data modify storage bingo:items registry append value {id: "bingo:tnt_minecart", item: {id: "minecraft:tnt_minecart"}, textComponent: '{"translate": "item.minecraft.tnt_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tnt_minecart"}}}', icon: '"\\u0033"', clearCommand: "clear @a[tag=bingo.clear] minecraft:tnt_minecart 1", categories: ["bingo:gunpowder", "bingo:sand"], weight: 1}

## 0034: hopper
data modify storage bingo:items registry append value {id: "bingo:hopper", item: {id: "minecraft:hopper"}, textComponent: '{"translate": "block.minecraft.hopper", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:hopper"}}}', icon: '"\\u0034"', clearCommand: "clear @a[tag=bingo.clear] minecraft:hopper 1", categories: ["bingo:chest_iron"], weight: 1}

## 0035: hopper_minecart
data modify storage bingo:items registry append value {id: "bingo:hopper_minecart", item: {id: "minecraft:hopper_minecart"}, textComponent: '{"translate": "item.minecraft.hopper_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:hopper_minecart"}}}', icon: '"\\u0035"', clearCommand: "clear @a[tag=bingo.clear] minecraft:hopper_minecart 1", categories: ["bingo:chest_iron"], weight: 1}

## 0036: furnace_minecart
data modify storage bingo:items registry append value {id: "bingo:furnace_minecart", item: {id: "minecraft:furnace_minecart"}, textComponent: '{"translate": "item.minecraft.furnace_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:furnace_minecart"}}}', icon: '"\\u0036"', clearCommand: "clear @a[tag=bingo.clear] minecraft:furnace_minecart 1", categories: ["bingo:furnace"], weight: 1}

## 0037: chest_minecart
data modify storage bingo:items registry append value {id: "bingo:chest_minecart", item: {id: "minecraft:chest_minecart"}, textComponent: '{"translate": "item.minecraft.chest_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:chest_minecart"}}}', icon: '"\\u0037"', clearCommand: "clear @a[tag=bingo.clear] minecraft:chest_minecart 1", categories: ["bingo:chest_iron"], weight: 1}

## 0038: bone
data modify storage bingo:items registry append value {id: "bingo:bone", item: {id: "minecraft:bone"}, textComponent: '{"translate": "item.minecraft.bone", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bone"}}}', icon: '"\\u0038"', clearCommand: "clear @a[tag=bingo.clear] minecraft:bone 1", categories: ["bingo:ink_bone", "bingo:cactus_bone"], weight: 1}

## 0039: ink_sac
data modify storage bingo:items registry append value {id: "bingo:ink_sac", item: {id: "minecraft:ink_sac"}, textComponent: '{"translate": "item.minecraft.ink_sac", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:ink_sac"}}}', icon: '"\\u0039"', clearCommand: "clear @a[tag=bingo.clear] minecraft:ink_sac 1", categories: ["bingo:ink"], weight: 1}

## 003a: gray_dye
data modify storage bingo:items registry append value {id: "bingo:gray_dye", item: {id: "minecraft:gray_dye"}, textComponent: '{"translate": "item.minecraft.gray_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:gray_dye"}}}', icon: '"\\u003a"', clearCommand: "clear @a[tag=bingo.clear] minecraft:gray_dye 1", categories: ["bingo:ink", "bingo:ink_bone"], weight: 1}

## 003b: green_dye
data modify storage bingo:items registry append value {id: "bingo:green_dye", item: {id: "minecraft:green_dye"}, textComponent: '{"translate": "item.minecraft.green_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:green_dye"}}}', icon: '"\\u003b"', clearCommand: "clear @a[tag=bingo.clear] minecraft:green_dye 1", categories: ["bingo:cactus"], weight: 1}

## 003c: lime_dye
data modify storage bingo:items registry append value {id: "bingo:lime_dye", item: {id: "minecraft:lime_dye"}, textComponent: '{"translate": "item.minecraft.lime_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lime_dye"}}}', icon: '"\\u003c"', clearCommand: "clear @a[tag=bingo.clear] minecraft:lime_dye 1", categories: ["bingo:cactus", "bingo:cactus_bone", "bingo:lime"], weight: 1}

## 003d: lapis_lazuli
data modify storage bingo:items registry append value {id: "bingo:lapis_lazuli", item: {id: "minecraft:lapis_lazuli"}, textComponent: '{"translate": "item.minecraft.lapis_lazuli", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lapis_lazuli"}}}', icon: '"\\u003d"', clearCommand: "clear @a[tag=bingo.clear] minecraft:lapis_lazuli 1", categories: ["bingo:lapis"], weight: 1}

## 003e: cyan_dye
data modify storage bingo:items registry append value {id: "bingo:cyan_dye", item: {id: "minecraft:cyan_dye"}, textComponent: '{"translate": "item.minecraft.cyan_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cyan_dye"}}}', icon: '"\\u003e"', clearCommand: "clear @a[tag=bingo.clear] minecraft:cyan_dye 1", categories: ["bingo:lapis", "bingo:cactus"], weight: 1}

## 003f: purple_dye
data modify storage bingo:items registry append value {id: "bingo:purple_dye", item: {id: "minecraft:purple_dye"}, textComponent: '{"translate": "item.minecraft.purple_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:purple_dye"}}}', icon: '"\\u003f"', clearCommand: "clear @a[tag=bingo.clear] minecraft:purple_dye 1", categories: ["bingo:lapis"], weight: 1}

## 0040: suspicious_stew
data modify storage bingo:items registry append value {id: "bingo:suspicious_stew", item: {id: "minecraft:suspicious_stew"}, textComponent: '{"translate": "item.minecraft.suspicious_stew", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:suspicious_stew"}}}', icon: '"\\u0040"', clearCommand: "clear @a[tag=bingo.clear] minecraft:suspicious_stew 1", categories: ["bingo:mushroom"], weight: 1}

## 0041: glass_bottle
data modify storage bingo:items registry append value {id: "bingo:glass_bottle", item: {id: "minecraft:glass_bottle"}, textComponent: '{"translate": "item.minecraft.glass_bottle", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:glass_bottle"}}}', icon: '"\\u0041"', clearCommand: "clear @a[tag=bingo.clear] minecraft:glass_bottle 1", categories: ["bingo:sand"], weight: 1}

## 0042: cod
data modify storage bingo:items registry append value {id: "bingo:cod", item: {id: "minecraft:cod"}, textComponent: '{"translate": "item.minecraft.cod", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cod"}}}', icon: '"\\u0042"', clearCommand: "clear @a[tag=bingo.clear] minecraft:cod 1", categories: ["bingo:fish"], weight: 1}

## 0043: cod_bucket
data modify storage bingo:items registry append value {id: "bingo:cod_bucket", item: {id: "minecraft:cod_bucket"}, textComponent: '{"translate": "item.minecraft.cod_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cod_bucket"}}}', icon: '"\\u0043"', clearCommand: "clear @a[tag=bingo.clear] minecraft:cod_bucket 1", categories: ["bingo:fish"], weight: 1}

## 0044: salmon
data modify storage bingo:items registry append value {id: "bingo:salmon", item: {id: "minecraft:salmon"}, textComponent: '{"translate": "item.minecraft.salmon", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:salmon"}}}', icon: '"\\u0044"', clearCommand: "clear @a[tag=bingo.clear] minecraft:salmon 1", categories: ["bingo:fish"], weight: 1}

## 0045: salmon_bucket
data modify storage bingo:items registry append value {id: "bingo:salmon_bucket", item: {id: "minecraft:salmon_bucket"}, textComponent: '{"translate": "item.minecraft.salmon_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:salmon_bucket"}}}', icon: '"\\u0045"', clearCommand: "clear @a[tag=bingo.clear] minecraft:salmon_bucket 1", categories: ["bingo:fish"], weight: 1}

## 0046: tropical_fish
data modify storage bingo:items registry append value {id: "bingo:tropical_fish", item: {id: "minecraft:tropical_fish"}, textComponent: '{"translate": "item.minecraft.tropical_fish", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tropical_fish"}}}', icon: '"\\u0046"', clearCommand: "clear @a[tag=bingo.clear] minecraft:tropical_fish 1", categories: ["bingo:fish"], weight: 1}

## 0047: tropical_fish_bucket
data modify storage bingo:items registry append value {id: "bingo:tropical_fish_bucket", item: {id: "minecraft:tropical_fish_bucket"}, textComponent: '{"translate": "item.minecraft.tropical_fish_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tropical_fish_bucket"}}}', icon: '"\\u0047"', clearCommand: "clear @a[tag=bingo.clear] minecraft:tropical_fish_bucket 1", categories: ["bingo:fish"], weight: 1}

## 0048: birch_sapling
data modify storage bingo:items registry append value {id: "bingo:birch_sapling", item: {id: "minecraft:birch_sapling"}, textComponent: '{"translate": "block.minecraft.birch_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:birch_sapling"}}}', icon: '"\\u0048"', clearCommand: "clear @a[tag=bingo.clear] minecraft:birch_sapling 1", categories: ["bingo:sapling"], weight: 1}

## 0049: dark_oak_sapling
data modify storage bingo:items registry append value {id: "bingo:dark_oak_sapling", item: {id: "minecraft:dark_oak_sapling"}, textComponent: '{"translate": "block.minecraft.dark_oak_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dark_oak_sapling"}}}', icon: '"\\u0049"', clearCommand: "clear @a[tag=bingo.clear] minecraft:dark_oak_sapling 1", categories: ["bingo:sapling"], weight: 1}

## 004a: jungle_sapling
data modify storage bingo:items registry append value {id: "bingo:jungle_sapling", item: {id: "minecraft:jungle_sapling"}, textComponent: '{"translate": "block.minecraft.jungle_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:jungle_sapling"}}}', icon: '"\\u004a"', clearCommand: "clear @a[tag=bingo.clear] minecraft:jungle_sapling 1", categories: ["bingo:sapling", "bingo:jungle"], weight: 1}

## 004b: detector_rail
data modify storage bingo:items registry append value {id: "bingo:detector_rail", item: {id: "minecraft:detector_rail"}, textComponent: '{"translate": "block.minecraft.detector_rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:detector_rail"}}}', icon: '"\\u004b"', clearCommand: "clear @a[tag=bingo.clear] minecraft:detector_rail 1", categories: ["bingo:rail"], weight: 1}

## 004c: activator_rail
data modify storage bingo:items registry append value {id: "bingo:activator_rail", item: {id: "minecraft:activator_rail"}, textComponent: '{"translate": "block.minecraft.activator_rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:activator_rail"}}}', icon: '"\\u004c"', clearCommand: "clear @a[tag=bingo.clear] minecraft:activator_rail 1", categories: ["bingo:rail"], weight: 1}

## 004d: heart_of_the_sea
data modify storage bingo:items registry append value {id: "bingo:heart_of_the_sea", item: {id: "minecraft:heart_of_the_sea"}, textComponent: '{"translate": "item.minecraft.heart_of_the_sea", "color": "yellow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:heart_of_the_sea"}}}', icon: '"\\u004d"', clearCommand: "clear @a[tag=bingo.clear] minecraft:heart_of_the_sea 1", categories: ["bingo:heart_of_the_sea"], weight: 1}

## 004e: bell
#data modify storage bingo:items registry append value {id: "bingo:bell", item: {id: "minecraft:bell"}, textComponent: '{"translate": "block.minecraft.bell", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bell"}}}', icon: '"\\u004e"', clearCommand: "clear @a[tag=bingo.clear] minecraft:bell 1", categories: ["bingo:village"], weight: 1}
#
## 004f: sweet_berries
data modify storage bingo:items registry append value {id: "bingo:sweet_berries", item: {id: "minecraft:sweet_berries"}, textComponent: '{"translate": "item.minecraft.sweet_berries", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:sweet_berries"}}}', icon: '"\\u004f"', clearCommand: "clear @a[tag=bingo.clear] minecraft:sweet_berries 1", categories: ["bingo:taiga"], weight: 1}

## 0050: diamond_sword
data modify storage bingo:items registry append value {id: "bingo:diamond_sword", item: {id: "minecraft:diamond_sword"}, textComponent: '{"translate": "item.minecraft.diamond_sword", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_sword"}}}', icon: '"\\u0050"', clearCommand: "clear @a[tag=bingo.clear] minecraft:diamond_sword 1", categories: ["bingo:diamond"], weight: 1}

## 0051: diamond_pickaxe
data modify storage bingo:items registry append value {id: "bingo:diamond_pickaxe", item: {id: "minecraft:diamond_pickaxe"}, textComponent: '{"translate": "item.minecraft.diamond_pickaxe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_pickaxe"}}}', icon: '"\\u0051"', clearCommand: "clear @a[tag=bingo.clear] minecraft:diamond_pickaxe 1", categories: ["bingo:diamond"], weight: 1}

## 0052: golden_axe
data modify storage bingo:items registry append value {id: "bingo:golden_axe", item: {id: "minecraft:golden_axe"}, textComponent: '{"translate": "item.minecraft.golden_axe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_axe"}}}', icon: '"\\u0052"', clearCommand: "clear @a[tag=bingo.clear] minecraft:golden_axe 1", categories: ["bingo:gold_and_ruined_portal"], weight: 1}

## 0053: golden_pickaxe
data modify storage bingo:items registry append value {id: "bingo:golden_pickaxe", item: {id: "minecraft:golden_pickaxe"}, textComponent: '{"translate": "item.minecraft.golden_pickaxe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_pickaxe"}}}', icon: '"\\u0053"', clearCommand: "clear @a[tag=bingo.clear] minecraft:golden_pickaxe 1", categories: ["bingo:gold_and_ruined_portal"], weight: 1}

## 0054: golden_hoe
data modify storage bingo:items registry append value {id: "bingo:golden_hoe", item: {id: "minecraft:golden_hoe"}, textComponent: '{"translate": "item.minecraft.golden_hoe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_hoe"}}}', icon: '"\\u0054"', clearCommand: "clear @a[tag=bingo.clear] minecraft:golden_hoe 1", categories: ["bingo:gold_and_ruined_portal"], weight: 1}

## 0055: crossbow
data modify storage bingo:items registry append value {id: "bingo:crossbow", item: {id: "minecraft:crossbow"}, textComponent: '{"translate": "item.minecraft.crossbow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:crossbow"}}}', icon: '"\\u0055"', clearCommand: "clear @a[tag=bingo.clear] minecraft:crossbow 1", categories: ["bingo:bow"], weight: 1}

## 0056: bamboo
data modify storage bingo:items registry append value {id: "bingo:bamboo", item: {id: "minecraft:bamboo"}, textComponent: '{"translate": "block.minecraft.bamboo", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bamboo"}}}', icon: '"\\u0056"', clearCommand: "clear @a[tag=bingo.clear] minecraft:bamboo 1", categories: ["bingo:jungle"], weight: 1}

## 0057: sea_pickle
data modify storage bingo:items registry append value {id: "bingo:sea_pickle", item: {id: "minecraft:sea_pickle"}, textComponent: '{"translate": "block.minecraft.sea_pickle", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:sea_pickle"}}}', icon: '"\\u0057"', clearCommand: "clear @a[tag=bingo.clear] minecraft:sea_pickle 1", categories: ["bingo:lime"], weight: 1}

## 0058: seagrass
data modify storage bingo:items registry append value {id: "bingo:seagrass", item: {id: "minecraft:seagrass"}, textComponent: '{"translate": "block.minecraft.seagrass", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:seagrass"}}}', icon: '"\\u0058"', clearCommand: "clear @a[tag=bingo.clear] minecraft:seagrass 1", categories: ["bingo:shearable"], weight: 1}

## 0059: rabbit_hide
data modify storage bingo:items registry append value {id: "bingo:rabbit_hide", item: {id: "minecraft:rabbit_hide"}, textComponent: '{"translate": "item.minecraft.rabbit_hide", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:rabbit_hide"}}}', icon: '"\\u0059"', clearCommand: "clear @a[tag=bingo.clear] minecraft:rabbit_hide 1", categories: ["bingo:rabbit"], weight: 1}

## 005a: cooked_rabbit
data modify storage bingo:items registry append value {id: "bingo:cooked_rabbit", item: {id: "minecraft:cooked_rabbit"}, textComponent: '{"translate": "item.minecraft.cooked_rabbit", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cooked_rabbit"}}}', icon: '"\\u005a"', clearCommand: "clear @a[tag=bingo.clear] minecraft:cooked_rabbit 1", categories: ["bingo:rabbit"], weight: 1}

## 0100: iron_block
data modify storage bingo:items registry append value {id: "bingo:iron_block", item: {id: "minecraft:iron_block"}, textComponent: '{"translate": "block.minecraft.iron_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:iron_block"}}}', icon: '"\\u0100"', clearCommand: "clear @a[tag=bingo.clear] minecraft:iron_block 1", categories: ["bingo:simple_iron", "bingo:nine_smelts_one"], weight: 1}

## 0101: redstone_block
data modify storage bingo:items registry append value {id: "bingo:redstone_block", item: {id: "minecraft:redstone_block"}, textComponent: '{"translate": "block.minecraft.redstone_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:redstone_block"}}}', icon: '"\\u0101"', clearCommand: "clear @a[tag=bingo.clear] minecraft:redstone_block 1", categories: ["bingo:redstone"], weight: 1}

## 0102: bookshelf
data modify storage bingo:items registry append value {id: "bingo:bookshelf", item: {id: "minecraft:bookshelf"}, textComponent: '{"translate": "block.minecraft.bookshelf", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bookshelf"}}}', icon: '"\\u0102"', clearCommand: "clear @a[tag=bingo.clear] minecraft:bookshelf 1", categories: ["bingo:leather"], weight: 1}

## 0103: obsidian
data modify storage bingo:items registry append value {id: "bingo:obsidian", item: {id: "minecraft:obsidian"}, textComponent: '{"translate": "block.minecraft.obsidian", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:obsidian"}}}', icon: '"\\u0103"', clearCommand: "clear @a[tag=bingo.clear] minecraft:obsidian 1", categories: ["bingo:diamond"], weight: 1}

## 0104: melon
data modify storage bingo:items registry append value {id: "bingo:melon", item: {id: "minecraft:melon"}, textComponent: '{"translate": "block.minecraft.melon", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:melon"}}}', icon: '"\\u0104"', clearCommand: "clear @a[tag=bingo.clear] minecraft:melon 1", categories: ["bingo:jungle"], weight: 1}

## 0105: mossy_stone_bricks
data modify storage bingo:items registry append value {id: "bingo:mossy_stone_bricks", item: {id: "minecraft:mossy_stone_bricks"}, textComponent: '{"translate": "block.minecraft.mossy_stone_bricks", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:mossy_stone_bricks"}}}', icon: '"\\u0105"', clearCommand: "clear @a[tag=bingo.clear] minecraft:mossy_stone_bricks 1", categories: ["bingo:shearable"], weight: 1}

## 0106: jukebox
data modify storage bingo:items registry append value {id: "bingo:jukebox", item: {id: "minecraft:jukebox"}, textComponent: '{"translate": "block.minecraft.jukebox", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:jukebox"}}}', icon: '"\\u0106"', clearCommand: "clear @a[tag=bingo.clear] minecraft:jukebox 1", categories: ["bingo:diamond"], weight: 1}

## 0107: magma_block
data modify storage bingo:items registry append value {id: "bingo:magma_block", item: {id: "minecraft:magma_block"}, textComponent: '{"translate": "block.minecraft.magma_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:magma_block"}}}', icon: '"\\u0107"', clearCommand: "clear @a[tag=bingo.clear] minecraft:magma_block 1", categories: ["bingo:gold_and_ruined_portal"], weight: 1}

## 0108: bone_block
data modify storage bingo:items registry append value {id: "bingo:bone_block", item: {id: "minecraft:bone_block"}, textComponent: '{"translate": "block.minecraft.bone_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bone_block"}}}', icon: '"\\u0108"', clearCommand: "clear @a[tag=bingo.clear] minecraft:bone_block 1", categories: ["bingo:ink_bone", "bingo:cactus_bone"], weight: 1}

## 0109: blast_furnace
data modify storage bingo:items registry append value {id: "bingo:blast_furnace", item: {id: "minecraft:blast_furnace"}, textComponent: '{"translate": "block.minecraft.blast_furnace", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:blast_furnace"}}}', icon: '"\\u0109"', clearCommand: "clear @a[tag=bingo.clear] minecraft:blast_furnace 1", categories: ["bingo:furnace"], weight: 1}
#
## 010a: ominous_banner
#data modify storage bingo:items registry append value {id: "bingo:ominous_banner", item: {id: "minecraft:white_banner", tag: {BlockEntityTag: {Patterns: [{Pattern: "mr", Color: 9}, {Pattern: "bs", Color: 8}, {Pattern: "cs", Color: 7}, {Pattern: "bo", Color: 8}, {Pattern: "ms", Color: 15}, {Pattern: "hh", Color: 8}, {Pattern: "mc", Color: 8}, {Pattern: "bo", Color: 15}]}, display: {Name: '{"color":"gold","translate":"block.minecraft.ominous_banner"}'}}}, textComponent: '{"translate": "block.minecraft.ominous_banner", "color": "gold", "italic": true, "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:white_banner", "tag": "{BlockEntityTag: {Patterns: [{Pattern: \'mr\', Color: 9}, {Pattern: \'bs\', Color: 8}, {Pattern: \'cs\', Color: 7}, {Pattern: \'bo\', Color: 8}, {Pattern: \'ms\', Color: 15}, {Pattern: \'hh\', Color: 8}, {Pattern: \'mc\', Color: 8}, {Pattern: \'bo\', Color: 15}]}, display: {Name: \'{\\"color\\":\\"gold\\",\\"translate\\":\\"block.minecraft.ominous_banner\\"}\'}}"}}}', icon: '"\\u010a"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:ominous_banner"}}].selected set value true', 'clear @a[tag=bingo.clear] minecraft:white_banner{BlockEntityTag: {Patterns: [{Pattern: "mr", Color: 9}, {Pattern: "bs", Color: 8}, {Pattern: "cs", Color: 7}, {Pattern: "bo", Color: 8}, {Pattern: "ms", Color: 15}, {Pattern: "hh", Color: 8}, {Pattern: "mc", Color: 8}, {Pattern: "bo", Color: 15}]}, display: {Name: \'{"color":"gold","translate":"block.minecraft.ominous_banner"}\'}} 1'], categories: ["bingo:ominous_banner"], weight: 1}
#
## 010b: red_bed
data modify storage bingo:items registry append value {id: "bingo:red_bed", item: {id: "minecraft:red_bed"}, textComponent: '{"translate": "block.minecraft.red_bed", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:red_bed"}}}', icon: '"\\u010b"', clearCommand: "clear @a[tag=bingo.clear] minecraft:red_bed 1", categories: ["bingo:wool"], weight: 1}

## 010c: target
data modify storage bingo:items registry append value {id: "bingo:target", item: {id: "minecraft:target"}, textComponent: '{"translate": "block.minecraft.target", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:target"}}}', icon: '"\\u010c"', clearCommand: "clear @a[tag=bingo.clear] minecraft:target 1", categories: ["bingo:wheat"], weight: 1}

## 010d: snow
data modify storage bingo:items registry append value {id: "bingo:snow", item: {id: "minecraft:snow"}, textComponent: '{"translate": "block.minecraft.snow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:snow"}}}', icon: '"\\u010d"', clearCommand: "clear @a[tag=bingo.clear] minecraft:snow 1", categories: ["bingo:snow"], weight: 1}

## 010e: snow_block
data modify storage bingo:items registry append value {id: "bingo:snow_block", item: {id: "minecraft:snow_block"}, textComponent: '{"translate": "block.minecraft.snow_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:snow_block"}}}', icon: '"\\u010e"', clearCommand: "clear @a[tag=bingo.clear] minecraft:snow_block 1", categories: ["bingo:snow"], weight: 1}

## 010f: jack_o_lantern
data modify storage bingo:items registry append value {id: "bingo:jack_o_lantern", item: {id: "minecraft:jack_o_lantern"}, textComponent: '{"translate": "block.minecraft.jack_o_lantern", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:jack_o_lantern"}}}', icon: '"\\u010f"', clearCommand: "clear @a[tag=bingo.clear] minecraft:jack_o_lantern 1", categories: ["bingo:pumpkin"], weight: 1}

## 0110: tnt
data modify storage bingo:items registry append value {id: "bingo:tnt", item: {id: "minecraft:tnt"}, textComponent: '{"translate": "block.minecraft.tnt", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tnt"}}}', icon: '"\\u0110"', clearCommand: "clear @a[tag=bingo.clear] minecraft:tnt 1", categories: ["bingo:gunpowder", "bingo:sand"], weight: 1}

## 0111: lapis_block
data modify storage bingo:items registry append value {id: "bingo:lapis_block", item: {id: "minecraft:lapis_block"}, textComponent: '{"translate": "block.minecraft.lapis_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lapis_block"}}}', icon: '"\\u0111"', clearCommand: "clear @a[tag=bingo.clear] minecraft:lapis_block 1", categories: ["bingo:lapis"], weight: 1}

## 0112: dispenser
data modify storage bingo:items registry append value {id: "bingo:dispenser", item: {id: "minecraft:dispenser"}, textComponent: '{"translate": "block.minecraft.dispenser", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dispenser"}}}', icon: '"\\u0112"', clearCommand: "clear @a[tag=bingo.clear] minecraft:dispenser 1", categories: ["bingo:bow"], weight: 1}

## 113: smoker
data modify storage bingo:items registry append value {id: "bingo:smoker", item: {id: "minecraft:smoker"}, textComponent: '{"translate": "block.minecraft.smoker", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:smoker"}}}', icon: '"\\u0113"', clearCommand: "clear @a[tag=bingo.clear] minecraft:smoker 1", categories: ["bingo:furnace"], weight: 1}
#
## 114: dried_kelp_block
data modify storage bingo:items registry append value {id: "bingo:dried_kelp_block", item: {id: "minecraft:dried_kelp_block"}, textComponent: '{"translate": "block.minecraft.dried_kelp_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dried_kelp_block"}}}', icon: '"\\u0114"', clearCommand: "clear @a[tag=bingo.clear] minecraft:dried_kelp_block 1", categories: ["bingo:nine_smelts_one"], weight: 1}

## 115: hay_bale
data modify storage bingo:items registry append value {id: "bingo:hay_bale", item: {id: "minecraft:hay_block"}, textComponent: '{"translate": "block.minecraft.hay_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:hay_bale"}}}', icon: '"\\u0115"', clearCommand: "clear @a[tag=bingo.clear] minecraft:hay_bale 1", categories: ["bingo:wheat"], weight: 1}

## 116: fletching_table
data modify storage bingo:items registry append value {id: "bingo:fletching_table", item: {id: "minecraft:fletching_table"}, textComponent: '{"translate": "block.minecraft.fletching_table", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:hay_bale"}}}', icon: '"\\u0116"', clearCommand: "clear @a[tag=bingo.clear] minecraft:fletching_table 1", categories: ["bingo:flint"], weight: 1}

## 117: lectern
data modify storage bingo:items registry append value {id: "bingo:lectern", item: {id: "minecraft:lectern"}, textComponent: '{"translate": "block.minecraft.lectern", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lectern"}}}', icon: '"\\u0117"', clearCommand: "clear @a[tag=bingo.clear] minecraft:lectern 1", categories: ["bingo:leather"], weight: 1}
#
## 118: crying_obsidian
data modify storage bingo:items registry append value {id: "bingo:crying_obsidian", item: {id: "minecraft:crying_obsidian"}, textComponent: '{"translate": "block.minecraft.crying_obsidian", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:crying_obsidian"}}}', icon: '"\\u0118"', clearCommand: "clear @a[tag=bingo.clear] minecraft:crying_obsidian 1", categories: ["bingo:diamond", "bingo:gold_and_ruined_portal"], weight: 1}

## 119: gold_block
data modify storage bingo:items registry append value {id: "bingo:gold_block", item: {id: "minecraft:gold_block"}, textComponent: '{"translate": "block.minecraft.gold_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:gold_block"}}}', icon: '"\\u0119"', clearCommand: "clear @a[tag=bingo.clear] minecraft:gold_block 1", categories: ["bingo:gold_and_ruined_portal", "bingo:nine_smelts_one"], weight: 1}

## 11a: scaffolding
data modify storage bingo:items registry append value {id: "bingo:scaffolding", item: {id: "minecraft:scaffolding"}, textComponent: '{"translate": "block.minecraft.scaffolding", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:scaffolding"}}}', icon: '"\\u011a"', clearCommand: "clear @a[tag=bingo.clear] minecraft:scaffolding 1", categories: ["bingo:jungle"], weight: 1}

## 11b: piston
data modify storage bingo:items registry append value {id: "bingo:piston", item: {id: "minecraft:piston"}, textComponent: '{"translate": "block.minecraft.piston", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:piston"}}}', icon: '"\\u011b"', clearCommand: "clear @a[tag=bingo.clear] minecraft:piston 1", categories: ["bingo:redstone"], weight: 1}

## 11c: sticky_piston
data modify storage bingo:items registry append value {id: "bingo:sticky_piston", item: {id: "minecraft:sticky_piston"}, textComponent: '{"translate": "block.minecraft.sticky_piston", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:sticky_piston"}}}', icon: '"\\u011c"', clearCommand: "clear @a[tag=bingo.clear] minecraft:sticky_piston 1", categories: ["bingo:redstone", "bingo:enderslime"], weight: 1}