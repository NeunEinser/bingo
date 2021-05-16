#> bingo:init/fill_registries
#
# Registers everything in vanilla bingo.
#
# To register your own ite
#
# @within tag/function bingo:register_items
# @handles #bingo:register_items

# categories
data modify storage bingo:registries categories append value {name: "bingo:apple", translatableName: '{"translate": "bingo.category.apple"}'}
data modify storage bingo:registries categories append value {name: "bingo:bow", translatableName: '{"translate": "bingo.category.bow"}'}
data modify storage bingo:registries categories append value {name: "bingo:brick", translatableName: '{"translate": "bingo.category.bricks"}'}
data modify storage bingo:registries categories append value {name: "bingo:cactus", translatableName: '{"translate": "bingo.category.cactus"}'}
data modify storage bingo:registries categories append value {name: "bingo:cactus_bone", translatableName: '{"translate": "bingo.category.cactus_bone"}'}
data modify storage bingo:registries categories append value {name: "bingo:chest_iron", translatableName: '{"translate": "bingo.category.chest_iron"}'}
data modify storage bingo:registries categories append value {name: "bingo:chest_loot", translatableName: '{"translate": "bingo.category.chest_loot"}'}
data modify storage bingo:registries categories append value {name: "bingo:compass", translatableName: '{"translate": "bingo.category.compass"}'}
data modify storage bingo:registries categories append value {name: "bingo:diamond", translatableName: '{"translate": "bingo.category.diamond"}'}
data modify storage bingo:registries categories append value {name: "bingo:emerald", translatableName: '{"translate": "bingo.category.emerald"}'}
data modify storage bingo:registries categories append value {name: "bingo:egg", translatableName: '{"translate": "bingo.category.egg"}'}
data modify storage bingo:registries categories append value {name: "bingo:enderslime", translatableName: '{"translate": "bingo.category.enderslime"}'}
data modify storage bingo:registries categories append value {name: "bingo:fish", translatableName: '{"translate": "bingo.category.fish"}'}
data modify storage bingo:registries categories append value {name: "bingo:flint", translatableName: '{"translate": "bingo.category.flint"}'}
data modify storage bingo:registries categories append value {name: "bingo:furnace", translatableName: '{"translate": "bingo.category.furnace"}'}
data modify storage bingo:registries categories append value {name: "bingo:gold_and_ruined_portal", translatableName: '{"translate": "bingo.category.gold_and_ruined_portal"}'}
data modify storage bingo:registries categories append value {name: "bingo:gunpowder", translatableName: '{"translate": "bingo.category.gunpowder"}'}
data modify storage bingo:registries categories append value {name: "bingo:heart_of_the_sea", translatableName: '{"translate": "bingo.category.heart_of_the_sea"}'}
data modify storage bingo:registries categories append value {name: "bingo:ink", translatableName: '{"translate": "bingo.category.ink"}'}
data modify storage bingo:registries categories append value {name: "bingo:ink_bone", translatableName: '{"translate": "bingo.category.ink_bone"}'}
data modify storage bingo:registries categories append value {name: "bingo:jungle", translatableName: '{"translate": "bingo.category.jungle"}'}
data modify storage bingo:registries categories append value {name: "bingo:rabbit", translatableName: '{"translate": "bingo.category.rabbit"}'}
data modify storage bingo:registries categories append value {name: "bingo:lapis", translatableName: '{"translate": "bingo.category.lapis"}'}
data modify storage bingo:registries categories append value {name: "bingo:leather", translatableName: '{"translate": "bingo.category.leather"}'}
data modify storage bingo:registries categories append value {name: "bingo:lime", translatableName: '{"translate": "bingo.category.lime"}'}
data modify storage bingo:registries categories append value {name: "bingo:milk", translatableName: '{"translate": "bingo.category.milk"}'}
data modify storage bingo:registries categories append value {name: "bingo:mushroom", translatableName: '{"translate": "bingo.category.mushroom"}'}
data modify storage bingo:registries categories append value {name: "bingo:nine_smelts_one", translatableName: '{"translate": "bingo.category.nine_smelts_one"}'}
#data modify storage bingo:registries categories append value {name: "bingo:ominous_banner", translatableName: '{"translate": "bingo.category.ominous_banner"}'}
data modify storage bingo:registries categories append value {name: "bingo:pumpkin", translatableName: '{"translate": "bingo.category.pumpkin"}'}
data modify storage bingo:registries categories append value {name: "bingo:rail", translatableName: '{"translate": "bingo.category.rail"}'}
data modify storage bingo:registries categories append value {name: "bingo:redstone", translatableName: '{"translate": "bingo.category.redstone"}'}
data modify storage bingo:registries categories append value {name: "bingo:sand", translatableName: '{"translate": "bingo.category.sand"}'}
data modify storage bingo:registries categories append value {name: "bingo:sapling", translatableName: '{"translate": "bingo.category.sapling"}'}
data modify storage bingo:registries categories append value {name: "bingo:shearable", translatableName: '{"translate": "bingo.category.shearable"}'}
data modify storage bingo:registries categories append value {name: "bingo:simple_iron", translatableName: '{"translate": "bingo.category.simple_iron"}'}
data modify storage bingo:registries categories append value {name: "bingo:snow", translatableName: '{"translate": "bingo.category.snow"}'}
data modify storage bingo:registries categories append value {name: "bingo:spider", translatableName: '{"translate": "bingo.category.spider"}'}
data modify storage bingo:registries categories append value {name: "bingo:taiga", translatableName: '{"translate": "bingo.category.taiga"}'}
#data modify storage bingo:registries categories append value {name: "bingo:village", translatableName: '{"translate": "bingo.category.village"}'}
data modify storage bingo:registries categories append value {name: "bingo:wheat", translatableName: '{"translate": "bingo.category.wheat"}'}
data modify storage bingo:registries categories append value {name: "bingo:wool", translatableName: '{"translate": "bingo.category.wool"}'}

# items

## 0001: pumpkin_seeds
data modify storage bingo:registries items append value {id: "bingo:pumpkin_seeds", item: {id: "minecraft:pumpkin_seeds"}, textComponent: '{"translate": "item.minecraft.pumpkin_seeds", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:pumpkin_seeds"}}}', icon: '"\\u0001"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:pumpkin_seeds 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:pumpkin_seeds 1", categories: ["bingo:pumpkin"], weight: 1}

## 0002: pumpkin_pie
data modify storage bingo:registries items append value {id: "bingo:pumpkin_pie", item: {id: "minecraft:pumpkin_pie"}, textComponent: '{"translate": "item.minecraft.pumpkin_pie", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:pumpkin_pie"}}}', icon: '"\\u0002"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:pumpkin_pie 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:pumpkin_pie 1", categories: ["bingo:pumpkin", "bingo:egg"], weight: 1}

## 0003: egg
data modify storage bingo:registries items append value {id: "bingo:egg", item: {id: "minecraft:egg"}, textComponent: '{"translate": "item.minecraft.egg", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:egg"}}}', icon: '"\\u0003"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:egg 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:egg 1", categories: ["bingo:egg"], weight: 1}

## 0004: cake
data modify storage bingo:registries items append value {id: "bingo:cake", item: {id: "minecraft:cake"}, textComponent: '{"translate": "block.minecraft.cake", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cake"}}}', icon: '"\\u0004"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:cake 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:cake 1", categories: ["bingo:egg", "bingo:milk", "bingo:wheat"], weight: 1}

## 0005: acacia_sapling
data modify storage bingo:registries items append value {id: "bingo:acacia_sapling", item: {id: "minecraft:acacia_sapling"}, textComponent: '{"translate": "block.minecraft.acacia_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:acacia_sapling"}}}', icon: '"\\u0005"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:acacia_sapling 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:acacia_sapling 1", categories: ["bingo:sapling"], weight: 1}

## 0006: spruce_sapling
data modify storage bingo:registries items append value {id: "bingo:spruce_sapling", item: {id: "minecraft:spruce_sapling"}, textComponent: '{"translate": "block.minecraft.spruce_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:spruce_sapling"}}}', icon: '"\\u0006"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:spruce_sapling 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:spruce_sapling 1", categories: ["bingo:sapling"], weight: 1}

## 0007: cocoa_beans
data modify storage bingo:registries items append value {id: "bingo:cocoa_beans", item: {id: "minecraft:cocoa_beans"}, textComponent: '{"translate": "item.minecraft.cocoa_beans", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cocoa_beans"}}}', icon: '"\\u0007"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:cocoa_beans 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:cocoa_beans 1", categories: ["bingo:jungle"], weight: 1}

## 0008: cookie
data modify storage bingo:registries items append value {id: "bingo:cookie", item: {id: "minecraft:cookie"}, textComponent: '{"translate": "item.minecraft.cookie", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cookie"}}}', icon: '"\\u0008"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:cookie 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:cookie 1", categories: ["bingo:jungle"], weight: 1}

## 0009: melon_slice
data modify storage bingo:registries items append value {id: "bingo:melon_slice", item: {id: "minecraft:melon_slice"}, textComponent: '{"translate": "item.minecraft.melon_slice", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:melon_slice"}}}', icon: '"\\u0009"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:melon_slice 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:melon_slice 1", categories: ["bingo:jungle"], weight: 1}

## 000a: glistering_melon_slice
data modify storage bingo:registries items append value {id: "bingo:glistering_melon_slice", item: {id: "minecraft:glistering_melon_slice"}, textComponent: '{"translate": "item.minecraft.glistering_melon_slice", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:glistering_melon_slice"}}}', icon: '"\\u000a"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:glistering_melon_slice 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:glistering_melon_slice 1", categories: ["bingo:jungle"], weight: 1}

## 000b: dead_bush
data modify storage bingo:registries items append value {id: "bingo:dead_bush", item: {id: "minecraft:dead_bush"}, textComponent: '{"translate": "block.minecraft.dead_bush", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dead_bush"}}}', icon: '"\\u000b"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:dead_bush 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:dead_bush 1", categories: ["bingo:shearable"], weight: 1}

## 000c: fern
data modify storage bingo:registries items append value {id: "bingo:fern", item: {id: "minecraft:fern"}, textComponent: '{"translate": "block.minecraft.fern", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:fern"}}}', icon: '"\\u000c"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:fern 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:fern 1", categories: ["bingo:shearable", "bingo:taiga"], weight: 1}

## 000d: vine
data modify storage bingo:registries items append value {id: "bingo:vine", item: {id: "minecraft:vine"}, textComponent: '{"translate": "block.minecraft.vine", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:vine"}}}', icon: '"\\u000d"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:vine 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:vine 1", categories: ["bingo:shearable"], weight: 1}

## 000e: rail
data modify storage bingo:registries items append value {id: "bingo:rail", item: {id: "minecraft:rail"}, textComponent: '{"translate": "block.minecraft.rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:rail"}}}', icon: '"\\u000e"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:rail 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:rail 1", categories: ["bingo:rail"], weight: 1}

## 000f: powered_rail
data modify storage bingo:registries items append value {id: "bingo:powered_rail", item: {id: "minecraft:powered_rail"}, textComponent: '{"translate": "block.minecraft.powered_rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:powered_rail"}}}', icon: '"\\u000f"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:powered_rail 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:powered_rail 1", categories: ["bingo:gold_and_ruined_portal"], weight: 5}

## 0010: flint
data modify storage bingo:registries items append value {id: "bingo:flint", item: {id: "minecraft:flint"}, textComponent: '{"translate": "item.minecraft.flint", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:flint"}}}', icon: '"\\u0010"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:flint 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:flint 1", categories: ["bingo:flint"], weight: 1}

## 0011: flint_and_steel
data modify storage bingo:registries items append value {id: "bingo:flint_and_steel", item: {id: "minecraft:flint_and_steel"}, textComponent: '{"translate": "item.minecraft.flint_and_steel", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:flint_and_steel"}}}', icon: '"\\u0011"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:flint_and_steel 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:flint_and_steel 1", categories: ["bingo:flint"], weight: 1}

## 0012: arrow
data modify storage bingo:registries items append value {id: "bingo:arrow", item: {id: "minecraft:arrow"}, textComponent: '{"translate": "item.minecraft.arrow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:arrow"}}}', icon: '"\\u0012"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:arrow 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:arrow 1", categories: ["bingo:flint"], weight: 1}

## 0013: ender_pearl
data modify storage bingo:registries items append value {id: "bingo:ender_pearl", item: {id: "minecraft:ender_pearl"}, textComponent: '{"translate": "item.minecraft.ender_pearl", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:ender_pearl"}}}', icon: '"\\u0013"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:ender_pearl 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:ender_pearl 1", categories: ["bingo:enderslime"], weight: 1}

## 0014: slime_ball
data modify storage bingo:registries items append value {id: "bingo:slime_ball", item: {id: "minecraft:slime_ball"}, textComponent: '{"translate": "item.minecraft.slime_ball", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:slime_ball"}}}', icon: '"\\u0014"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:slime_ball 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:slime_ball 1", categories: ["bingo:enderslime"], weight: 1}

## 0015: firework_rocket
data modify storage bingo:registries items append value {id: "bingo:firework_rocket", item: {id: "minecraft:firework_rocket"}, textComponent: '{"translate": "item.minecraft.firework_rocket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:firework_rocket"}}}', icon: '"\\u0015"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:firework_rocket 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:firework_rocket 1", categories: ["bingo:gunpowder"], weight: 1}

## 0016: milk_bucket
data modify storage bingo:registries items append value {id: "bingo:milk_bucket", item: {id: "minecraft:milk_bucket"}, textComponent: '{"translate": "item.minecraft.milk_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:milk_bucket"}}}', icon: '"\\u0016"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:milk_bucket 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:milk_bucket 1", categories: ["bingo:milk"], weight: 1}

## 0017: cauldron
data modify storage bingo:registries items append value {id: "bingo:cauldron", item: {id: "minecraft:cauldron"}, textComponent: '{"translate": "block.minecraft.cauldron", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cauldron"}}}', icon: '"\\u0017"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:cauldron 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:cauldron 1", categories: ["bingo:simple_iron"], weight: 1}

## 0018: saddle
data modify storage bingo:registries items append value {id: "bingo:saddle", item: {id: "minecraft:saddle"}, textComponent: '{"translate": "item.minecraft.saddle", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:saddle"}}}', icon: '"\\u0018"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:saddle 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:saddle 1", categories: ["bingo:chest_loot"], weight: 1}

## 0019: name_tag
data modify storage bingo:registries items append value {id: "bingo:name_tag", item: {id: "minecraft:name_tag"}, textComponent: '{"translate": "item.minecraft.name_tag", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:name_tag"}}}', icon: '"\\u0019"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:name_tag 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:name_tag 1", categories: ["bingo:chest_loot"], weight: 1}

## 001a: painting
data modify storage bingo:registries items append value {id: "bingo:painting", item: {id: "minecraft:painting"}, textComponent: '{"translate": "item.minecraft.painting", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:painting"}}}', icon: '"\\u001a"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:painting 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:painting 1", categories: ["bingo:wool"], weight: 1}

## 001b: item_frame
data modify storage bingo:registries items append value {id: "bingo:item_frame", item: {id: "minecraft:item_frame"}, textComponent: '{"translate": "item.minecraft.item_frame", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:item_frame"}}}', icon: '"\\u001b"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:item_frame 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:item_frame 1", categories: ["bingo:leather"], weight: 1}

## 001c: emerald
data modify storage bingo:registries items append value {id: "bingo:emerald", item: {id: "minecraft:emerald"}, textComponent: '{"translate": "item.minecraft.emerald", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:emerald"}}}', icon: '"\\u001c"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:emerald 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:emerald 1", categories: ["bingo:emerald"], weight: 1}

## 001d: diamond_shovel
data modify storage bingo:registries items append value {id: "bingo:diamond_shovel", item: {id: "minecraft:diamond_shovel"}, textComponent: '{"translate": "item.minecraft.diamond_shovel", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_shovel"}}}', icon: '"\\u001d"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:diamond_shovel 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:diamond_shovel 1", categories: ["bingo:diamond"], weight: 1}

## 001e: diamond_hoe
data modify storage bingo:registries items append value {id: "bingo:diamond_hoe", item: {id: "minecraft:diamond_hoe"}, textComponent: '{"translate": "item.minecraft.diamond_hoe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_hoe"}}}', icon: '"\\u001e"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:diamond_hoe 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:diamond_hoe 1", categories: ["bingo:diamond"], weight: 1}

## 001f: diamond_axe
data modify storage bingo:registries items append value {id: "bingo:diamond_axe", item: {id: "minecraft:diamond_axe"}, textComponent: '{"translate": "item.minecraft.diamond_axe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_axe"}}}', icon: '"\\u001f"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:diamond_axe 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:diamond_axe 1", categories: ["bingo:diamond"], weight: 1}

## 0021: flower_pot
data modify storage bingo:registries items append value {id: "bingo:flower_pot", item: {id: "minecraft:flower_pot"}, textComponent: '{"translate": "block.minecraft.flower_pot", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:flower_pot"}}}', icon: '"\\u0021"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:flower_pot 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:flower_pot 1", categories: ["bingo:brick"], weight: 1}

## 0022: brick
data modify storage bingo:registries items append value {id: "bingo:brick", item: {id: "minecraft:brick"}, textComponent: '{"translate": "item.minecraft.brick", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:brick"}}}', icon: '"\\u0022"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:brick 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:brick 1", categories: ["bingo:brick"], weight: 1}

## 0023: mushroom_stew
data modify storage bingo:registries items append value {id: "bingo:mushroom_stew", item: {id: "minecraft:mushroom_stew"}, textComponent: '{"translate": "item.minecraft.mushroom_stew", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:mushroom_stew"}}}', icon: '"\\u0023"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:mushroom_stew 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:mushroom_stew 1", categories: ["bingo:mushroom"], weight: 1}

## 0024: beetroot_soup
data modify storage bingo:registries items append value {id: "bingo:beetroot_soup", item: {id: "minecraft:beetroot_soup"}, textComponent: '{"translate": "item.minecraft.beetroot_soup", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:beetroot_soup"}}}', icon: '"\\u0024"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:beetroot_soup 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:beetroot_soup 1", categories: ["bingo:chest_loot"], weight: 1}

## 0025: apple
data modify storage bingo:registries items append value {id: "bingo:apple", item: {id: "minecraft:apple"}, textComponent: '{"translate": "item.minecraft.apple", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:apple"}}}', icon: '"\\u0025"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:apple 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:apple 1", categories: ["bingo:apple"], weight: 1}

## 0026: golden_apple
data modify storage bingo:registries items append value {id: "bingo:golden_apple", item: {id: "minecraft:golden_apple"}, textComponent: '{"translate": "item.minecraft.golden_apple", "color": "aqua", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_apple"}}}', icon: '"\\u0026"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:golden_apple 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:golden_apple 1", categories: ["bingo:apple"], weight: 1}

## 0027: golden_shovel
data modify storage bingo:registries items append value {id: "bingo:golden_shovel", item: {id: "minecraft:golden_shovel"}, textComponent: '{"translate": "item.minecraft.golden_shovel", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_shovel"}}}', icon: '"\\u0027"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:golden_shovel 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:golden_shovel 1", categories: ["bingo:gold_and_ruined_portal"], weight: 2}

## 0028: golden_sword
data modify storage bingo:registries items append value {id: "bingo:golden_sword", item: {id: "minecraft:golden_sword"}, textComponent: '{"translate": "item.minecraft.golden_sword", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_sword"}}}', icon: '"\\u0028"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:golden_sword 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:golden_sword 1", categories: ["bingo:gold_and_ruined_portal"], weight: 2}

## 0029: clock
data modify storage bingo:registries items append value {id: "bingo:clock", item: {id: "minecraft:clock"}, textComponent: '{"translate": "item.minecraft.clock", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:clock"}}}', icon: '"\\u0029"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:clock 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:clock 1", categories: ["bingo:gold_and_ruined_portal"], weight: 5}

## 002a: repeater
data modify storage bingo:registries items append value {id: "bingo:repeater", item: {id: "minecraft:repeater"}, textComponent: '{"translate": "block.minecraft.repeater", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:repeater"}}}', icon: '"\\u002a"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:repeater 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:repeater 1", categories: ["bingo:redstone"], weight: 1}

## 002b: compass
data modify storage bingo:registries items append value {id: "bingo:compass", item: {id: "minecraft:compass"}, textComponent: '{"translate": "item.minecraft.compass", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:compass"}}}', icon: '"\\u002b"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:compass 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:compass 1", categories: ["bingo:compass"], weight: 1}

## 002c: map
data modify storage bingo:registries items append value {id: "bingo:map", item: {id: "minecraft:map"}, textComponent: '{"translate": "item.minecraft.map", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:map"}}}', icon: '"\\u002c"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:map 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:map 1", categories: ["bingo:compass"], weight: 1}

## 002d: book
data modify storage bingo:registries items append value {id: "bingo:book", item: {id: "minecraft:book"}, textComponent: '{"translate": "item.minecraft.book", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:book"}}}', icon: '"\\u002d"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:book 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:book 1", categories: ["bingo:leather"], weight: 1}

## 002e: writable_book
data modify storage bingo:registries items append value {id: "bingo:writable_book", item: {id: "minecraft:writable_book"}, textComponent: '{"translate": "item.minecraft.writable_book", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:writable_book"}}}', icon: '"\\u002e"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:writable_book 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:writable_book 1", categories: ["bingo:leather", "bingo:ink"], weight: 1}

## 002f: enchanted_book
data modify storage bingo:registries items append value {id: "bingo:enchanted_book", item: {id: "minecraft:enchanted_book"}, textComponent: '{"translate": "item.minecraft.enchanted_book", "color": "yellow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:enchanted_book"}}}', icon: '"\\u002f"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:enchanted_book 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:enchanted_book 1", categories: ["bingo:chest_loot"], weight: 1}

## 0030: spider_eye
data modify storage bingo:registries items append value {id: "bingo:spider_eye", item: {id: "minecraft:spider_eye"}, textComponent: '{"translate": "item.minecraft.spider_eye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:spider_eye"}}}', icon: '"\\u0030"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:spider_eye 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:spider_eye 1", categories: ["bingo:spider"], weight: 1}

## 0031: fermented_spider_eye
data modify storage bingo:registries items append value {id: "bingo:fermented_spider_eye", item: {id: "minecraft:fermented_spider_eye"}, textComponent: '{"translate": "item.minecraft.fermented_spider_eye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:fermented_spider_eye"}}}', icon: '"\\u0031"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:fermented_spider_eye 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:fermented_spider_eye 1", categories: ["bingo:spider", "bingo:mushroom"], weight: 1}

## 0032: gunpowder
data modify storage bingo:registries items append value {id: "bingo:gunpowder", item: {id: "minecraft:gunpowder"}, textComponent: '{"translate": "item.minecraft.gunpowder", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:gunpowder"}}}', icon: '"\\u0032"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:gunpowder 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:gunpowder 1", categories: ["bingo:gunpowder"], weight: 1}

## 0033: tnt_minecart
data modify storage bingo:registries items append value {id: "bingo:tnt_minecart", item: {id: "minecraft:tnt_minecart"}, textComponent: '{"translate": "item.minecraft.tnt_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tnt_minecart"}}}', icon: '"\\u0033"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:tnt_minecart 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:tnt_minecart 1", categories: ["bingo:gunpowder", "bingo:sand"], weight: 1}

## 0034: hopper
data modify storage bingo:registries items append value {id: "bingo:hopper", item: {id: "minecraft:hopper"}, textComponent: '{"translate": "block.minecraft.hopper", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:hopper"}}}', icon: '"\\u0034"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:hopper 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:hopper 1", categories: ["bingo:chest_iron"], weight: 1}

## 0035: hopper_minecart
data modify storage bingo:registries items append value {id: "bingo:hopper_minecart", item: {id: "minecraft:hopper_minecart"}, textComponent: '{"translate": "item.minecraft.hopper_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:hopper_minecart"}}}', icon: '"\\u0035"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:hopper_minecart 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:hopper_minecart 1", categories: ["bingo:chest_iron"], weight: 1}

## 0036: furnace_minecart
data modify storage bingo:registries items append value {id: "bingo:furnace_minecart", item: {id: "minecraft:furnace_minecart"}, textComponent: '{"translate": "item.minecraft.furnace_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:furnace_minecart"}}}', icon: '"\\u0036"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:furnace_minecart 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:furnace_minecart 1", categories: ["bingo:furnace"], weight: 1}

## 0037: chest_minecart
data modify storage bingo:registries items append value {id: "bingo:chest_minecart", item: {id: "minecraft:chest_minecart"}, textComponent: '{"translate": "item.minecraft.chest_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:chest_minecart"}}}', icon: '"\\u0037"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:chest_minecart 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:chest_minecart 1", categories: ["bingo:chest_iron"], weight: 1}

## 0038: bone
data modify storage bingo:registries items append value {id: "bingo:bone", item: {id: "minecraft:bone"}, textComponent: '{"translate": "item.minecraft.bone", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bone"}}}', icon: '"\\u0038"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:bone 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:bone 1", categories: ["bingo:ink_bone", "bingo:cactus_bone"], weight: 1}

## 0039: ink_sac
data modify storage bingo:registries items append value {id: "bingo:ink_sac", item: {id: "minecraft:ink_sac"}, textComponent: '{"translate": "item.minecraft.ink_sac", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:ink_sac"}}}', icon: '"\\u0039"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:ink_sac 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:ink_sac 1", categories: ["bingo:ink"], weight: 1}

## 003a: gray_dye
data modify storage bingo:registries items append value {id: "bingo:gray_dye", item: {id: "minecraft:gray_dye"}, textComponent: '{"translate": "item.minecraft.gray_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:gray_dye"}}}', icon: '"\\u003a"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:gray_dye 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:gray_dye 1", categories: ["bingo:ink", "bingo:ink_bone"], weight: 1}

## 003b: green_dye
data modify storage bingo:registries items append value {id: "bingo:green_dye", item: {id: "minecraft:green_dye"}, textComponent: '{"translate": "item.minecraft.green_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:green_dye"}}}', icon: '"\\u003b"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:green_dye 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:green_dye 1", categories: ["bingo:cactus"], weight: 1}

## 003c: lime_dye
data modify storage bingo:registries items append value {id: "bingo:lime_dye", item: {id: "minecraft:lime_dye"}, textComponent: '{"translate": "item.minecraft.lime_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lime_dye"}}}', icon: '"\\u003c"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:lime_dye 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:lime_dye 1", categories: ["bingo:cactus", "bingo:cactus_bone", "bingo:lime"], weight: 1}

## 003d: lapis_lazuli
data modify storage bingo:registries items append value {id: "bingo:lapis_lazuli", item: {id: "minecraft:lapis_lazuli"}, textComponent: '{"translate": "item.minecraft.lapis_lazuli", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lapis_lazuli"}}}', icon: '"\\u003d"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:lapis_lazuli 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:lapis_lazuli 1", categories: ["bingo:lapis"], weight: 1}

## 003e: cyan_dye
data modify storage bingo:registries items append value {id: "bingo:cyan_dye", item: {id: "minecraft:cyan_dye"}, textComponent: '{"translate": "item.minecraft.cyan_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cyan_dye"}}}', icon: '"\\u003e"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:cyan_dye 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:cyan_dye 1", categories: ["bingo:lapis", "bingo:cactus"], weight: 1}

## 003f: purple_dye
data modify storage bingo:registries items append value {id: "bingo:purple_dye", item: {id: "minecraft:purple_dye"}, textComponent: '{"translate": "item.minecraft.purple_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:purple_dye"}}}', icon: '"\\u003f"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:purple_dye 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:purple_dye 1", categories: ["bingo:lapis"], weight: 1}

## 0040: suspicious_stew
data modify storage bingo:registries items append value {id: "bingo:suspicious_stew", item: {id: "minecraft:suspicious_stew"}, textComponent: '{"translate": "item.minecraft.suspicious_stew", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:suspicious_stew"}}}', icon: '"\\u0040"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:suspicious_stew 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:suspicious_stew 1", categories: ["bingo:mushroom"], weight: 1}

## 0041: glass_bottle
data modify storage bingo:registries items append value {id: "bingo:glass_bottle", item: {id: "minecraft:glass_bottle"}, textComponent: '{"translate": "item.minecraft.glass_bottle", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:glass_bottle"}}}', icon: '"\\u0041"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:glass_bottle 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:glass_bottle 1", categories: ["bingo:sand"], weight: 1}

## 0042: cod
data modify storage bingo:registries items append value {id: "bingo:cod", item: {id: "minecraft:cod"}, textComponent: '{"translate": "item.minecraft.cod", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cod"}}}', icon: '"\\u0042"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:cod 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:cod 1", categories: ["bingo:fish"], weight: 1}

## 0043: cod_bucket
data modify storage bingo:registries items append value {id: "bingo:cod_bucket", item: {id: "minecraft:cod_bucket"}, textComponent: '{"translate": "item.minecraft.cod_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cod_bucket"}}}', icon: '"\\u0043"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:cod_bucket 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:cod_bucket 1", categories: ["bingo:fish"], weight: 1}

## 0044: salmon
data modify storage bingo:registries items append value {id: "bingo:salmon", item: {id: "minecraft:salmon"}, textComponent: '{"translate": "item.minecraft.salmon", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:salmon"}}}', icon: '"\\u0044"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:salmon 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:salmon 1", categories: ["bingo:fish"], weight: 1}

## 0045: salmon_bucket
data modify storage bingo:registries items append value {id: "bingo:salmon_bucket", item: {id: "minecraft:salmon_bucket"}, textComponent: '{"translate": "item.minecraft.salmon_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:salmon_bucket"}}}', icon: '"\\u0045"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:salmon_bucket 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:salmon_bucket 1", categories: ["bingo:fish"], weight: 1}

## 0046: tropical_fish
data modify storage bingo:registries items append value {id: "bingo:tropical_fish", item: {id: "minecraft:tropical_fish"}, textComponent: '{"translate": "item.minecraft.tropical_fish", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tropical_fish"}}}', icon: '"\\u0046"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:tropical_fish 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:tropical_fish 1", categories: ["bingo:fish"], weight: 1}

## 0047: tropical_fish_bucket
data modify storage bingo:registries items append value {id: "bingo:tropical_fish_bucket", item: {id: "minecraft:tropical_fish_bucket"}, textComponent: '{"translate": "item.minecraft.tropical_fish_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tropical_fish_bucket"}}}', icon: '"\\u0047"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:tropical_fish_bucket 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:tropical_fish_bucket 1", categories: ["bingo:fish"], weight: 1}

## 0048: birch_sapling
data modify storage bingo:registries items append value {id: "bingo:birch_sapling", item: {id: "minecraft:birch_sapling"}, textComponent: '{"translate": "block.minecraft.birch_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:birch_sapling"}}}', icon: '"\\u0048"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:birch_sapling 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:birch_sapling 1", categories: ["bingo:sapling"], weight: 1}

## 0049: dark_oak_sapling
data modify storage bingo:registries items append value {id: "bingo:dark_oak_sapling", item: {id: "minecraft:dark_oak_sapling"}, textComponent: '{"translate": "block.minecraft.dark_oak_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dark_oak_sapling"}}}', icon: '"\\u0049"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:dark_oak_sapling 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:dark_oak_sapling 1", categories: ["bingo:sapling"], weight: 1}

## 004a: jungle_sapling
data modify storage bingo:registries items append value {id: "bingo:jungle_sapling", item: {id: "minecraft:jungle_sapling"}, textComponent: '{"translate": "block.minecraft.jungle_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:jungle_sapling"}}}', icon: '"\\u004a"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:jungle_sapling 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:jungle_sapling 1", categories: ["bingo:sapling", "bingo:jungle"], weight: 1}

## 004b: detector_rail
data modify storage bingo:registries items append value {id: "bingo:detector_rail", item: {id: "minecraft:detector_rail"}, textComponent: '{"translate": "block.minecraft.detector_rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:detector_rail"}}}', icon: '"\\u004b"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:detector_rail 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:detector_rail 1", categories: ["bingo:rail"], weight: 1}

## 004c: activator_rail
data modify storage bingo:registries items append value {id: "bingo:activator_rail", item: {id: "minecraft:activator_rail"}, textComponent: '{"translate": "block.minecraft.activator_rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:activator_rail"}}}', icon: '"\\u004c"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:activator_rail 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:activator_rail 1", categories: ["bingo:rail"], weight: 1}

## 004d: heart_of_the_sea
data modify storage bingo:registries items append value {id: "bingo:heart_of_the_sea", item: {id: "minecraft:heart_of_the_sea"}, textComponent: '{"translate": "item.minecraft.heart_of_the_sea", "color": "yellow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:heart_of_the_sea"}}}', icon: '"\\u004d"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:heart_of_the_sea 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:heart_of_the_sea 1", categories: ["bingo:heart_of_the_sea"], weight: 1}

## 004e: bell
#data modify storage bingo:registries items append value {id: "bingo:bell", item: {id: "minecraft:bell"}, textComponent: '{"translate": "block.minecraft.bell", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bell"}}}', icon: '"\\u004e"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:bell 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:bell 1", categories: ["bingo:village"], weight: 1}

## 004f: sweet_berries
data modify storage bingo:registries items append value {id: "bingo:sweet_berries", item: {id: "minecraft:sweet_berries"}, textComponent: '{"translate": "item.minecraft.sweet_berries", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:sweet_berries"}}}', icon: '"\\u004f"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:sweet_berries 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:sweet_berries 1", categories: ["bingo:taiga"], weight: 1}

## 0050: diamond_sword
data modify storage bingo:registries items append value {id: "bingo:diamond_sword", item: {id: "minecraft:diamond_sword"}, textComponent: '{"translate": "item.minecraft.diamond_sword", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_sword"}}}', icon: '"\\u0050"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:diamond_sword 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:diamond_sword 1", categories: ["bingo:diamond"], weight: 1}

## 0051: diamond_pickaxe
data modify storage bingo:registries items append value {id: "bingo:diamond_pickaxe", item: {id: "minecraft:diamond_pickaxe"}, textComponent: '{"translate": "item.minecraft.diamond_pickaxe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_pickaxe"}}}', icon: '"\\u0051"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:diamond_pickaxe 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:diamond_pickaxe 1", categories: ["bingo:diamond"], weight: 1}

## 0052: golden_axe
data modify storage bingo:registries items append value {id: "bingo:golden_axe", item: {id: "minecraft:golden_axe"}, textComponent: '{"translate": "item.minecraft.golden_axe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_axe"}}}', icon: '"\\u0052"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:golden_axe 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:golden_axe 1", categories: ["bingo:gold_and_ruined_portal"], weight: 2}

## 0053: golden_pickaxe
data modify storage bingo:registries items append value {id: "bingo:golden_pickaxe", item: {id: "minecraft:golden_pickaxe"}, textComponent: '{"translate": "item.minecraft.golden_pickaxe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_pickaxe"}}}', icon: '"\\u0053"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:golden_pickaxe 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:golden_pickaxe 1", categories: ["bingo:gold_and_ruined_portal"], weight: 2}

## 0054: golden_hoe
data modify storage bingo:registries items append value {id: "bingo:golden_hoe", item: {id: "minecraft:golden_hoe"}, textComponent: '{"translate": "item.minecraft.golden_hoe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_hoe"}}}', icon: '"\\u0054"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:golden_hoe 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:golden_hoe 1", categories: ["bingo:gold_and_ruined_portal"], weight: 2}

## 0055: crossbow
data modify storage bingo:registries items append value {id: "bingo:crossbow", item: {id: "minecraft:crossbow"}, textComponent: '{"translate": "item.minecraft.crossbow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:crossbow"}}}', icon: '"\\u0055"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:crossbow 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:crossbow 1", categories: ["bingo:bow"], weight: 1}

## 0056: bamboo
data modify storage bingo:registries items append value {id: "bingo:bamboo", item: {id: "minecraft:bamboo"}, textComponent: '{"translate": "block.minecraft.bamboo", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bamboo"}}}', icon: '"\\u0056"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:bamboo 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:bamboo 1", categories: ["bingo:jungle"], weight: 1}

## 0057: sea_pickle
data modify storage bingo:registries items append value {id: "bingo:sea_pickle", item: {id: "minecraft:sea_pickle"}, textComponent: '{"translate": "block.minecraft.sea_pickle", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:sea_pickle"}}}', icon: '"\\u0057"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:sea_pickle 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:sea_pickle 1", categories: ["bingo:lime"], weight: 1}

## 0058: seagrass
data modify storage bingo:registries items append value {id: "bingo:seagrass", item: {id: "minecraft:seagrass"}, textComponent: '{"translate": "block.minecraft.seagrass", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:seagrass"}}}', icon: '"\\u0058"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:seagrass 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:seagrass 1", categories: ["bingo:shearable"], weight: 1}

## 0059: rabbit_hide
data modify storage bingo:registries items append value {id: "bingo:rabbit_hide", item: {id: "minecraft:rabbit_hide"}, textComponent: '{"translate": "item.minecraft.rabbit_hide", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:rabbit_hide"}}}', icon: '"\\u0059"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:rabbit_hide 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:rabbit_hide 1", categories: ["bingo:rabbit"], weight: 1}

## 005a: cooked_rabbit
data modify storage bingo:registries items append value {id: "bingo:cooked_rabbit", item: {id: "minecraft:cooked_rabbit"}, textComponent: '{"translate": "item.minecraft.cooked_rabbit", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cooked_rabbit"}}}', icon: '"\\u005a"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:cooked_rabbit 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:cooked_rabbit 1", categories: ["bingo:rabbit"], weight: 1}

## 0100: iron_block
data modify storage bingo:registries items append value {id: "bingo:iron_block", item: {id: "minecraft:iron_block"}, textComponent: '{"translate": "block.minecraft.iron_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:iron_block"}}}', icon: '"\\u0100"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:iron_block 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:iron_block 1", categories: ["bingo:simple_iron", "bingo:nine_smelts_one"], weight: 1}

## 0101: redstone_block
data modify storage bingo:registries items append value {id: "bingo:redstone_block", item: {id: "minecraft:redstone_block"}, textComponent: '{"translate": "block.minecraft.redstone_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:redstone_block"}}}', icon: '"\\u0101"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:redstone_block 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:redstone_block 1", categories: ["bingo:redstone"], weight: 1}

## 0102: bookshelf
data modify storage bingo:registries items append value {id: "bingo:bookshelf", item: {id: "minecraft:bookshelf"}, textComponent: '{"translate": "block.minecraft.bookshelf", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bookshelf"}}}', icon: '"\\u0102"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:bookshelf 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:bookshelf 1", categories: ["bingo:leather"], weight: 1}

## 0103: obsidian
data modify storage bingo:registries items append value {id: "bingo:obsidian", item: {id: "minecraft:obsidian"}, textComponent: '{"translate": "block.minecraft.obsidian", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:obsidian"}}}', icon: '"\\u0103"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:obsidian 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:obsidian 1", categories: ["bingo:diamond"], weight: 1}

## 0104: melon
data modify storage bingo:registries items append value {id: "bingo:melon", item: {id: "minecraft:melon"}, textComponent: '{"translate": "block.minecraft.melon", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:melon"}}}', icon: '"\\u0104"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:melon 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:melon 1", categories: ["bingo:jungle"], weight: 1}

## 0105: mossy_stone_bricks
data modify storage bingo:registries items append value {id: "bingo:mossy_stone_bricks", item: {id: "minecraft:mossy_stone_bricks"}, textComponent: '{"translate": "block.minecraft.mossy_stone_bricks", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:mossy_stone_bricks"}}}', icon: '"\\u0105"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:mossy_stone_bricks 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:mossy_stone_bricks 1", categories: ["bingo:shearable"], weight: 1}

## 0106: jukebox
data modify storage bingo:registries items append value {id: "bingo:jukebox", item: {id: "minecraft:jukebox"}, textComponent: '{"translate": "block.minecraft.jukebox", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:jukebox"}}}', icon: '"\\u0106"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:jukebox 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:jukebox 1", categories: ["bingo:diamond"], weight: 1}

## 0107: magma_block
data modify storage bingo:registries items append value {id: "bingo:magma_block", item: {id: "minecraft:magma_block"}, textComponent: '{"translate": "block.minecraft.magma_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:magma_block"}}}', icon: '"\\u0107"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:magma_block 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:magma_block 1", categories: ["bingo:gold_and_ruined_portal"], weight: 10}

## 0108: bone_block
data modify storage bingo:registries items append value {id: "bingo:bone_block", item: {id: "minecraft:bone_block"}, textComponent: '{"translate": "block.minecraft.bone_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bone_block"}}}', icon: '"\\u0108"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:bone_block 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:bone_block 1", categories: ["bingo:ink_bone", "bingo:cactus_bone"], weight: 1}

## 0109: blast_furnace
data modify storage bingo:registries items append value {id: "bingo:blast_furnace", item: {id: "minecraft:blast_furnace"}, textComponent: '{"translate": "block.minecraft.blast_furnace", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:blast_furnace"}}}', icon: '"\\u0109"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:blast_furnace 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:blast_furnace 1", categories: ["bingo:furnace"], weight: 1}

## 010a: ominous_banner
#data modify storage bingo:registries items append value {id: "bingo:ominous_banner", item: {id: "minecraft:white_banner", tag: {BlockEntityTag: {Patterns: [{Pattern: "mr", Color: 9}, {Pattern: "bs", Color: 8}, {Pattern: "cs", Color: 7}, {Pattern: "bo", Color: 8}, {Pattern: "ms", Color: 15}, {Pattern: "hh", Color: 8}, {Pattern: "mc", Color: 8}, {Pattern: "bo", Color: 15}]}, display: {Name: '{"color":"gold","translate":"block.minecraft.ominous_banner"}'}}}, textComponent: '{"translate": "block.minecraft.ominous_banner", "color": "gold", "italic": true, "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:white_banner", "tag": "{BlockEntityTag: {Patterns: [{Pattern: \'mr\', Color: 9}, {Pattern: \'bs\', Color: 8}, {Pattern: \'cs\', Color: 7}, {Pattern: \'bo\', Color: 8}, {Pattern: \'ms\', Color: 15}, {Pattern: \'hh\', Color: 8}, {Pattern: \'mc\', Color: 8}, {Pattern: \'bo\', Color: 15}]}, display: {Name: \'{\\"color\\":\\"gold\\",\\"translate\\":\\"block.minecraft.ominous_banner\\"}\'}}"}}}', icon: '"\\u010a"', clearCommand: ['data modify storage bingo:card slots[{item:{id: "bingo:ominous_banner"}}].selected set value true', 'clear @a[tag=bingo.clear] minecraft:white_banner{BlockEntityTag: {Patterns: [{Pattern: "mr", Color: 9}, {Pattern: "bs", Color: 8}, {Pattern: "cs", Color: 7}, {Pattern: "bo", Color: 8}, {Pattern: "ms", Color: 15}, {Pattern: "hh", Color: 8}, {Pattern: "mc", Color: 8}, {Pattern: "bo", Color: 15}]}, display: {Name: \'{"color":"gold","translate":"block.minecraft.ominous_banner"}\'}} 1'], categories: ["bingo:ominous_banner"], weight: 1}

## 010b: red_bed
data modify storage bingo:registries items append value {id: "bingo:red_bed", item: {id: "minecraft:red_bed"}, textComponent: '{"translate": "block.minecraft.red_bed", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:red_bed"}}}', icon: '"\\u010b"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:red_bed 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:red_bed 1", categories: ["bingo:wool"], weight: 1}

## 010c: target
data modify storage bingo:registries items append value {id: "bingo:target", item: {id: "minecraft:target"}, textComponent: '{"translate": "block.minecraft.target", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:target"}}}', icon: '"\\u010c"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:target 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:target 1", categories: ["bingo:wheat"], weight: 1}

## 010d: snow
data modify storage bingo:registries items append value {id: "bingo:snow", item: {id: "minecraft:snow"}, textComponent: '{"translate": "block.minecraft.snow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:snow"}}}', icon: '"\\u010d"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:snow 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:snow 1", categories: ["bingo:snow"], weight: 1}

## 010e: snow_block
data modify storage bingo:registries items append value {id: "bingo:snow_block", item: {id: "minecraft:snow_block"}, textComponent: '{"translate": "block.minecraft.snow_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:snow_block"}}}', icon: '"\\u010e"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:snow_block 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:snow_block 1", categories: ["bingo:snow"], weight: 1}

## 010f: jack_o_lantern
data modify storage bingo:registries items append value {id: "bingo:jack_o_lantern", item: {id: "minecraft:jack_o_lantern"}, textComponent: '{"translate": "block.minecraft.jack_o_lantern", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:jack_o_lantern"}}}', icon: '"\\u010f"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:jack_o_lantern 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:jack_o_lantern 1", categories: ["bingo:pumpkin"], weight: 1}

## 0110: tnt
data modify storage bingo:registries items append value {id: "bingo:tnt", item: {id: "minecraft:tnt"}, textComponent: '{"translate": "block.minecraft.tnt", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tnt"}}}', icon: '"\\u0110"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:tnt 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:tnt 1", categories: ["bingo:gunpowder", "bingo:sand"], weight: 1}

## 0111: lapis_block
data modify storage bingo:registries items append value {id: "bingo:lapis_block", item: {id: "minecraft:lapis_block"}, textComponent: '{"translate": "block.minecraft.lapis_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lapis_block"}}}', icon: '"\\u0111"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:lapis_block 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:lapis_block 1", categories: ["bingo:lapis"], weight: 1}

## 0112: dispenser
data modify storage bingo:registries items append value {id: "bingo:dispenser", item: {id: "minecraft:dispenser"}, textComponent: '{"translate": "block.minecraft.dispenser", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dispenser"}}}', icon: '"\\u0112"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:dispenser 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:dispenser 1", categories: ["bingo:bow"], weight: 1}

## 113: smoker
data modify storage bingo:registries items append value {id: "bingo:smoker", item: {id: "minecraft:smoker"}, textComponent: '{"translate": "block.minecraft.smoker", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:smoker"}}}', icon: '"\\u0113"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:smoker 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:smoker 1", categories: ["bingo:furnace"], weight: 1}

## 114: dried_kelp_block
data modify storage bingo:registries items append value {id: "bingo:dried_kelp_block", item: {id: "minecraft:dried_kelp_block"}, textComponent: '{"translate": "block.minecraft.dried_kelp_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dried_kelp_block"}}}', icon: '"\\u0114"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:dried_kelp_block 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:dried_kelp_block 1", categories: ["bingo:nine_smelts_one"], weight: 1}

## 115: hay_bale
data modify storage bingo:registries items append value {id: "bingo:hay_bale", item: {id: "minecraft:hay_block"}, textComponent: '{"translate": "block.minecraft.hay_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:hay_block"}}}', icon: '"\\u0115"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:hay_block 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:hay_block 1", categories: ["bingo:wheat"], weight: 1}

## 116: fletching_table
data modify storage bingo:registries items append value {id: "bingo:fletching_table", item: {id: "minecraft:fletching_table"}, textComponent: '{"translate": "block.minecraft.fletching_table", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:hay_bale"}}}', icon: '"\\u0116"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:fletching_table 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:fletching_table 1", categories: ["bingo:flint"], weight: 1}

## 117: lectern
data modify storage bingo:registries items append value {id: "bingo:lectern", item: {id: "minecraft:lectern"}, textComponent: '{"translate": "block.minecraft.lectern", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lectern"}}}', icon: '"\\u0117"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:lectern 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:lectern 1", categories: ["bingo:leather"], weight: 1}

## 118: crying_obsidian
data modify storage bingo:registries items append value {id: "bingo:crying_obsidian", item: {id: "minecraft:crying_obsidian"}, textComponent: '{"translate": "block.minecraft.crying_obsidian", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:crying_obsidian"}}}', icon: '"\\u0118"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:crying_obsidian 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:crying_obsidian 1", categories: [{id: "bingo:diamond", weight: 1 }, { id: "bingo:gold_and_ruined_portal", weight: 10 }]}

## 119: gold_block
data modify storage bingo:registries items append value {id: "bingo:gold_block", item: {id: "minecraft:gold_block"}, textComponent: '{"translate": "block.minecraft.gold_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:gold_block"}}}', icon: '"\\u0119"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:gold_block 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:gold_block 1", categories: [{ id: "bingo:gold_and_ruined_portal", weight: 10 }, { id: "bingo:nine_smelts_one", weight: 1 }]}

## 11a: scaffolding
data modify storage bingo:registries items append value {id: "bingo:scaffolding", item: {id: "minecraft:scaffolding"}, textComponent: '{"translate": "block.minecraft.scaffolding", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:scaffolding"}}}', icon: '"\\u011a"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:scaffolding 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:scaffolding 1", categories: ["bingo:jungle"], weight: 1}

## 11b: piston
data modify storage bingo:registries items append value {id: "bingo:piston", item: {id: "minecraft:piston"}, textComponent: '{"translate": "block.minecraft.piston", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:piston"}}}', icon: '"\\u011b"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:piston 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:piston 1", categories: ["bingo:redstone"], weight: 1}

## 11c: sticky_piston
data modify storage bingo:registries items append value {id: "bingo:sticky_piston", item: {id: "minecraft:sticky_piston"}, textComponent: '{"translate": "block.minecraft.sticky_piston", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:sticky_piston"}}}', icon: '"\\u011c"', detectCommand: "execute as @a store success score @s bingo.has_item run clear @s minecraft:sticky_piston 0", clearCommand: "clear @a[tag=bingo.clear] minecraft:sticky_piston 1", categories: ["bingo:redstone", "bingo:enderslime"], weight: 1}

# structures
data remove storage bingo:registries structures

data modify storage bingo:registries structures append value "bingo:credits"
data modify storage bingo:registries structures append value "bingo:card_generation"
data modify storage bingo:registries structures append value "bingo:tutorial"