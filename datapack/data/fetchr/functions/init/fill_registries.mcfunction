#> fetchr:init/fill_registries
#
# Registers everything in vanilla Fetchr.
#
# To register your own ite
#
# @within tag/function fetchr:fill_registries
# @handles #fetchr:fill_registries

#TODO versioning for most registries

#TODO make sure categories are in stable order. Pretty sure they are curremtly
# in arbitary order after having been processed, meaning that if a new category
# is added which is not in the fetchr:default tag and some vanilla Fetchr items
# are added to it, existing seeds might shuffle without the item pool or active
# categories actually changing.
#
# Probably should just keep the order of initial definition

# categories
data modify storage fetchr:registries categories append value {id: "fetchr:apple", name: '{"translate": "fetchr.category.apple"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:amethyst", name: '{"translate": "fetchr.category.amethyst"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:basic_iron", name: '{"translate": "fetchr.category.basic_iron"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:bow", name: '{"translate": "fetchr.category.bow"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:cactus", name: '{"translate": "fetchr.category.cactus"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:cherry_grove", name: '{"translate": "fetchr.category.cherry_grove"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:clay", name: '{"translate": "fetchr.category.clay"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:copper", name: '{"translate": "fetchr.category.copper"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:chest_iron", name: '{"translate": "fetchr.category.chest_iron"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:compass", name: '{"translate": "fetchr.category.compass"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:deepslate", name: '{"translate": "fetchr.category.deepslate"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:diamond", name: '{"translate": "fetchr.category.diamond"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:dripstone_cave", name: '{"translate": "fetchr.category.dripstone_cave"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:egg", name: '{"translate": "fetchr.category.egg"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:nighttime_mob_drops", name: '{"translate": "fetchr.category.nighttime_mob_drops"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:fish", name: '{"translate": "fetchr.category.fish"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:flint", name: '{"translate": "fetchr.category.flint"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:furnace", name: '{"translate": "fetchr.category.furnace"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:glow_ink", name: '{"translate": "fetchr.category.glow_ink"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:gold_and_ruined_portal", name: '{"translate": "fetchr.category.gold_and_ruined_portal"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:gunpowder", name: '{"translate": "fetchr.category.gunpowder"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:ink", name: '{"translate": "fetchr.category.ink"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:jungle", name: '{"translate": "fetchr.category.jungle"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:kelp", name: '{"translate": "fetchr.category.kelp"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:lapis", name: '{"translate": "fetchr.category.lapis"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:leather", name: '{"translate": "fetchr.category.leather"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:lime", name: '{"translate": "fetchr.category.lime"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:lush_cave", name: '{"translate": "fetchr.category.lush_cave"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:milk", name: '{"translate": "fetchr.category.milk"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:mud", name: '{"translate": "fetchr.category.mud"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:mushroom", name: '{"translate": "fetchr.category.mushroom"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:piston", name: '{"translate": "fetchr.category.piston"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:pumpkin", name: '{"translate": "fetchr.category.pumpkin"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:rabbit", name: '{"translate": "fetchr.category.rabbit"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:rail", name: '{"translate": "fetchr.category.rail"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:redstone", name: '{"translate": "fetchr.category.redstone"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:sand", name: '{"translate": "fetchr.category.sand"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:sapling", name: '{"translate": "fetchr.category.sapling"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:shearable", name: '{"translate": "fetchr.category.shearable"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:shipwreck", name: '{"translate": "fetchr.category.shipwreck"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:skeleton_drops", name: '{"translate": "fetchr.category.skeleton_drops"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:snow", name: '{"translate": "fetchr.category.snow"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:spider", name: '{"translate": "fetchr.category.spider"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:taiga", name: '{"translate": "fetchr.category.taiga"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:wheat", name: '{"translate": "fetchr.category.wheat"}', tags: ["fetchr:default"]}
data modify storage fetchr:registries categories append value {id: "fetchr:wool", name: '{"translate": "fetchr.category.wool"}', tags: ["fetchr:default"]}

# items

## 0001: pumpkin_seeds
data modify storage fetchr:registries items append value {id: "fetchr:pumpkin_seeds", item: {id: "minecraft:pumpkin_seeds"}, textComponent: '{"translate": "item.minecraft.pumpkin_seeds", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:pumpkin_seeds"}}}', icon: '"\\u0001"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:pumpkin_seeds 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:pumpkin_seeds 1", categories: ["fetchr:pumpkin"]}

## 0002: pumpkin_pie
data modify storage fetchr:registries items append value {id: "fetchr:pumpkin_pie", item: {id: "minecraft:pumpkin_pie"}, textComponent: '{"translate": "item.minecraft.pumpkin_pie", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:pumpkin_pie"}}}', icon: '"\\u0002"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:pumpkin_pie 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:pumpkin_pie 1", categories: ["fetchr:pumpkin", "fetchr:egg"]}

## 0003: egg
data modify storage fetchr:registries items append value {id: "fetchr:egg", item: {id: "minecraft:egg"}, textComponent: '{"translate": "item.minecraft.egg", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:egg"}}}', icon: '"\\u0003"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:egg 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:egg 1", categories: ["fetchr:egg"]}

## 0004: cake
data modify storage fetchr:registries items append value {id: "fetchr:cake", item: {id: "minecraft:cake"}, textComponent: '{"translate": "block.minecraft.cake", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cake"}}}', icon: '"\\u0004"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:cake 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:cake 1", categories: ["fetchr:egg", "fetchr:milk"]}

## 0005: acacia_sapling
data modify storage fetchr:registries items append value {id: "fetchr:acacia_sapling", item: {id: "minecraft:acacia_sapling"}, textComponent: '{"translate": "block.minecraft.acacia_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:acacia_sapling"}}}', icon: '"\\u0005"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:acacia_sapling 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:acacia_sapling 1", categories: ["fetchr:sapling"]}

## 0006: spruce_sapling
data modify storage fetchr:registries items append value {id: "fetchr:spruce_sapling", item: {id: "minecraft:spruce_sapling"}, textComponent: '{"translate": "block.minecraft.spruce_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:spruce_sapling"}}}', icon: '"\\u0006"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:spruce_sapling 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:spruce_sapling 1", categories: ["fetchr:sapling"]}

## 0007: cocoa_beans
data modify storage fetchr:registries items append value {id: "fetchr:cocoa_beans", item: {id: "minecraft:cocoa_beans"}, textComponent: '{"translate": "item.minecraft.cocoa_beans", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cocoa_beans"}}}', icon: '"\\u0007"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:cocoa_beans 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:cocoa_beans 1", categories: ["fetchr:jungle"], weight: 3}

## 0008: cookie
data modify storage fetchr:registries items append value {id: "fetchr:cookie", item: {id: "minecraft:cookie"}, textComponent: '{"translate": "item.minecraft.cookie", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cookie"}}}', icon: '"\\u0008"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:cookie 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:cookie 1", categories: ["fetchr:jungle"], weight: 3}

## 0009: melon_slice
data modify storage fetchr:registries items append value {id: "fetchr:melon_slice", item: {id: "minecraft:melon_slice"}, textComponent: '{"translate": "item.minecraft.melon_slice", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:melon_slice"}}}', icon: '"\\u0009"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:melon_slice 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:melon_slice 1", categories: ["fetchr:jungle"], weight: 2}

## 000a: glistering_melon_slice
data modify storage fetchr:registries items append value {id: "fetchr:glistering_melon_slice", item: {id: "minecraft:glistering_melon_slice"}, textComponent: '{"translate": "item.minecraft.glistering_melon_slice", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:glistering_melon_slice"}}}', icon: '"\\u000a"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:glistering_melon_slice 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:glistering_melon_slice 1", categories: ["fetchr:jungle"], weight: 2}

## 000b: dead_bush
data modify storage fetchr:registries items append value {id: "fetchr:dead_bush", item: {id: "minecraft:dead_bush"}, textComponent: '{"translate": "block.minecraft.dead_bush", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dead_bush"}}}', icon: '"\\u000b"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:dead_bush 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:dead_bush 1", categories: ["fetchr:shearable"], weight: 2}

## 000c: fern
data modify storage fetchr:registries items append value {id: "fetchr:fern", item: {id: "minecraft:fern"}, textComponent: '{"translate": "block.minecraft.fern", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:fern"}}}', icon: '"\\u000c"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:fern 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:fern 1", categories: [{id: "fetchr:shearable", weight: 2}, {id: "fetchr:taiga"}]}

## 000d: vine
data modify storage fetchr:registries items append value {id: "fetchr:vine", item: {id: "minecraft:vine"}, textComponent: '{"translate": "block.minecraft.vine", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:vine"}}}', icon: '"\\u000d"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:vine 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:vine 1", categories: ["fetchr:shearable"]}

## 000e: rail
data modify storage fetchr:registries items append value {id: "fetchr:rail", item: {id: "minecraft:rail"}, textComponent: '{"translate": "block.minecraft.rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:rail"}}}', icon: '"\\u000e"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:rail 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:rail 1", categories: ["fetchr:rail"]}

## 000f: powered_rail
data modify storage fetchr:registries items append value {id: "fetchr:powered_rail", item: {id: "minecraft:powered_rail"}, textComponent: '{"translate": "block.minecraft.powered_rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:powered_rail"}}}', icon: '"\\u000f"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:powered_rail 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:powered_rail 1", categories: ["fetchr:gold_and_ruined_portal"], weight: 5}

## 0010: flint
data modify storage fetchr:registries items append value {id: "fetchr:flint", item: {id: "minecraft:flint"}, textComponent: '{"translate": "item.minecraft.flint", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:flint"}}}', icon: '"\\u0010"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:flint 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:flint 1", categories: ["fetchr:flint"]}

## 0011: flint_and_steel
data modify storage fetchr:registries items append value {id: "fetchr:flint_and_steel", item: {id: "minecraft:flint_and_steel"}, textComponent: '{"translate": "item.minecraft.flint_and_steel", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:flint_and_steel"}}}', icon: '"\\u0011"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:flint_and_steel 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:flint_and_steel 1", categories: ["fetchr:flint"]}

## 0012: arrow
data modify storage fetchr:registries items append value {id: "fetchr:arrow", item: {id: "minecraft:arrow"}, textComponent: '{"translate": "item.minecraft.arrow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:arrow"}}}', icon: '"\\u0012"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:arrow 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:arrow 1", categories: ["fetchr:skeleton_drops"]}

## 0013: ender_pearl
data modify storage fetchr:registries items append value {id: "fetchr:ender_pearl", item: {id: "minecraft:ender_pearl"}, textComponent: '{"translate": "item.minecraft.ender_pearl", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:ender_pearl"}}}', icon: '"\\u0013"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:ender_pearl 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:ender_pearl 1", categories: ["fetchr:nighttime_mob_drops"], weight: 3}

## 0014: slime_ball
data modify storage fetchr:registries items append value {id: "fetchr:slime_ball", item: {id: "minecraft:slime_ball"}, textComponent: '{"translate": "item.minecraft.slime_ball", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:slime_ball"}}}', icon: '"\\u0014"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:slime_ball 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:slime_ball 1", categories: ["fetchr:nighttime_mob_drops"]}

## 0015: firework_rocket
data modify storage fetchr:registries items append value {id: "fetchr:firework_rocket", item: {id: "minecraft:firework_rocket"}, textComponent: '{"translate": "item.minecraft.firework_rocket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:firework_rocket"}}}', icon: '"\\u0015"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:firework_rocket 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:firework_rocket 1", categories: ["fetchr:gunpowder"], weight: 2}

## 0016: milk_bucket
data modify storage fetchr:registries items append value {id: "fetchr:milk_bucket", item: {id: "minecraft:milk_bucket"}, textComponent: '{"translate": "item.minecraft.milk_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:milk_bucket"}}}', icon: '"\\u0016"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:milk_bucket 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:milk_bucket 1", categories: ["fetchr:milk"]}

## 0017: cauldron
data modify storage fetchr:registries items append value {id: "fetchr:cauldron", item: {id: "minecraft:cauldron"}, textComponent: '{"translate": "block.minecraft.cauldron", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cauldron"}}}', icon: '"\\u0017"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:cauldron 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:cauldron 1", categories: ["fetchr:basic_iron"]}

## 001a: painting
data modify storage fetchr:registries items append value {id: "fetchr:painting", item: {id: "minecraft:painting"}, textComponent: '{"translate": "item.minecraft.painting", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:painting"}}}', icon: '"\\u001a"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:painting 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:painting 1", categories: ["fetchr:wool"]}

## 001b: item_frame
data modify storage fetchr:registries items append value {id: "fetchr:item_frame", item: {id: "minecraft:item_frame"}, textComponent: '{"translate": "item.minecraft.item_frame", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:item_frame"}}}', icon: '"\\u001b"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:item_frame 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:item_frame 1", categories: ["fetchr:leather"], weight: 2}

## 001c: emerald
data modify storage fetchr:registries items append value {id: "fetchr:emerald", item: {id: "minecraft:emerald"}, textComponent: '{"translate": "item.minecraft.emerald", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:emerald"}}}', icon: '"\\u001c"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:emerald 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:emerald 1", categories: ["fetchr:shipwreck"]}

## 001d: diamond_shovel
data modify storage fetchr:registries items append value {id: "fetchr:diamond_shovel", item: {id: "minecraft:diamond_shovel"}, textComponent: '{"translate": "item.minecraft.diamond_shovel", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_shovel"}}}', icon: '"\\u001d"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:diamond_shovel 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:diamond_shovel 1", categories: ["fetchr:diamond"], weight: 2}

## 001e: diamond_hoe
data modify storage fetchr:registries items append value {id: "fetchr:diamond_hoe", item: {id: "minecraft:diamond_hoe"}, textComponent: '{"translate": "item.minecraft.diamond_hoe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_hoe"}}}', icon: '"\\u001e"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:diamond_hoe 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:diamond_hoe 1", categories: ["fetchr:diamond"], weight: 2}

## 001f: diamond_axe
data modify storage fetchr:registries items append value {id: "fetchr:diamond_axe", item: {id: "minecraft:diamond_axe"}, textComponent: '{"translate": "item.minecraft.diamond_axe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_axe"}}}', icon: '"\\u001f"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:diamond_axe 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:diamond_axe 1", categories: ["fetchr:diamond"], weight: 2}

## 0020: axolotl_bucket
data modify storage fetchr:registries items append value {id: "fetchr:axolotl_bucket", item: {id: "minecraft:axolotl_bucket"}, textComponent: '{"translate": "item.minecraft.axolotl_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_axe"}}}', icon: '"\\u0020"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:axolotl_bucket 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:axolotl_bucket 1", categories: ["fetchr:lush_cave"], weight: 3}

## 0021: flower_pot
data modify storage fetchr:registries items append value {id: "fetchr:flower_pot", item: {id: "minecraft:flower_pot"}, textComponent: '{"translate": "block.minecraft.flower_pot", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:flower_pot"}}}', icon: '"\\u0021"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:flower_pot 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:flower_pot 1", categories: ["fetchr:clay"]}

## 0022: brick
data modify storage fetchr:registries items append value {id: "fetchr:brick", item: {id: "minecraft:brick"}, textComponent: '{"translate": "item.minecraft.brick", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:brick"}}}', icon: '"\\u0022"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:brick 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:brick 1", categories: ["fetchr:clay"]}

## 0023: mushroom_stew
data modify storage fetchr:registries items append value {id: "fetchr:mushroom_stew", item: {id: "minecraft:mushroom_stew"}, textComponent: '{"translate": "item.minecraft.mushroom_stew", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:mushroom_stew"}}}', icon: '"\\u0023"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:mushroom_stew 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:mushroom_stew 1", categories: ["fetchr:mushroom"]}

## 0024: mangrove_propagule
data modify storage fetchr:registries items append value {id: "fetchr:mangrove_propagule", item: {id: "minecraft:mangrove_propagule"}, textComponent: '{"translate": "block.minecraft.mangrove_propagule", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:mangrove_propagule"}}}', icon: '"\\u0024"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:mangrove_propagule 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:mangrove_propagule 1", categories: ["fetchr:sapling"]}

## 0025: apple
data modify storage fetchr:registries items append value {id: "fetchr:apple", item: {id: "minecraft:apple"}, textComponent: '{"translate": "item.minecraft.apple", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:apple"}}}', icon: '"\\u0025"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:apple 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:apple 1", categories: ["fetchr:apple"]}

## 0026: golden_apple
data modify storage fetchr:registries items append value {id: "fetchr:golden_apple", item: {id: "minecraft:golden_apple"}, textComponent: '{"translate": "item.minecraft.golden_apple", "color": "aqua", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_apple"}}}', icon: '"\\u0026"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:golden_apple 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:golden_apple 1", categories: ["fetchr:apple"]}

## 0027: golden_shovel
data modify storage fetchr:registries items append value {id: "fetchr:golden_shovel", item: {id: "minecraft:golden_shovel"}, textComponent: '{"translate": "item.minecraft.golden_shovel", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_shovel"}}}', icon: '"\\u0027"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:golden_shovel 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:golden_shovel 1", categories: ["fetchr:gold_and_ruined_portal"], weight: 2}

## 0028: golden_sword
data modify storage fetchr:registries items append value {id: "fetchr:golden_sword", item: {id: "minecraft:golden_sword"}, textComponent: '{"translate": "item.minecraft.golden_sword", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_sword"}}}', icon: '"\\u0028"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:golden_sword 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:golden_sword 1", categories: ["fetchr:gold_and_ruined_portal"], weight: 2}

## 0029: clock
data modify storage fetchr:registries items append value {id: "fetchr:clock", item: {id: "minecraft:clock"}, textComponent: '{"translate": "item.minecraft.clock", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:clock"}}}', icon: '"\\u0029"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:clock 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:clock 1", categories: ["fetchr:gold_and_ruined_portal"], weight: 5}

## 002a: repeater
data modify storage fetchr:registries items append value {id: "fetchr:repeater", item: {id: "minecraft:repeater"}, textComponent: '{"translate": "block.minecraft.repeater", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:repeater"}}}', icon: '"\\u002a"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:repeater 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:repeater 1", categories: ["fetchr:redstone"]}

## 002b: compass
data modify storage fetchr:registries items append value {id: "fetchr:compass", item: {id: "minecraft:compass"}, textComponent: '{"translate": "item.minecraft.compass", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:compass"}}}', icon: '"\\u002b"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:compass 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:compass 1", categories: ["fetchr:compass"]}

## 002c: map
data modify storage fetchr:registries items append value {id: "fetchr:map", item: {id: "minecraft:map"}, textComponent: '{"translate": "item.minecraft.map", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:map"}}}', icon: '"\\u002c"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:map 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:map 1", categories: ["fetchr:compass"]}

## 002d: book
data modify storage fetchr:registries items append value {id: "fetchr:book", item: {id: "minecraft:book"}, textComponent: '{"translate": "item.minecraft.book", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:book"}}}', icon: '"\\u002d"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:book 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:book 1", categories: ["fetchr:leather"]}

## 002e: writable_book
data modify storage fetchr:registries items append value {id: "fetchr:writable_book", item: {id: "minecraft:writable_book"}, textComponent: '{"translate": "item.minecraft.writable_book", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:writable_book"}}}', icon: '"\\u002e"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:writable_book 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:writable_book 1", categories: ["fetchr:leather"]}

## 002f: enchanted_book
data modify storage fetchr:registries items append value {id: "fetchr:enchanted_book", item: {id: "minecraft:enchanted_book"}, textComponent: '{"translate": "item.minecraft.enchanted_book", "color": "yellow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:enchanted_book"}}}', icon: '"\\u002f"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:enchanted_book 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:enchanted_book 1", categories: ["fetchr:diamond"], weight: 5}

## 0030: spider_eye
data modify storage fetchr:registries items append value {id: "fetchr:spider_eye", item: {id: "minecraft:spider_eye"}, textComponent: '{"translate": "item.minecraft.spider_eye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:spider_eye"}}}', icon: '"\\u0030"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:spider_eye 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:spider_eye 1", categories: ["fetchr:spider"]}

## 0031: fermented_spider_eye
data modify storage fetchr:registries items append value {id: "fetchr:fermented_spider_eye", item: {id: "minecraft:fermented_spider_eye"}, textComponent: '{"translate": "item.minecraft.fermented_spider_eye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:fermented_spider_eye"}}}', icon: '"\\u0031"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:fermented_spider_eye 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:fermented_spider_eye 1", categories: ["fetchr:spider"]}

## 0032: gunpowder
data modify storage fetchr:registries items append value {id: "fetchr:gunpowder", item: {id: "minecraft:gunpowder"}, textComponent: '{"translate": "item.minecraft.gunpowder", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:gunpowder"}}}', icon: '"\\u0032"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:gunpowder 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:gunpowder 1", categories: ["fetchr:gunpowder"], weight: 2}

## 0033: tnt_minecart
data modify storage fetchr:registries items append value {id: "fetchr:tnt_minecart", item: {id: "minecraft:tnt_minecart"}, textComponent: '{"translate": "item.minecraft.tnt_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tnt_minecart"}}}', icon: '"\\u0033"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:tnt_minecart 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:tnt_minecart 1", categories: ["fetchr:gunpowder", "fetchr:sand"]}

## 0034: hopper
data modify storage fetchr:registries items append value {id: "fetchr:hopper", item: {id: "minecraft:hopper"}, textComponent: '{"translate": "block.minecraft.hopper", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:hopper"}}}', icon: '"\\u0034"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:hopper 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:hopper 1", categories: ["fetchr:chest_iron"]}

## 0035: hopper_minecart
data modify storage fetchr:registries items append value {id: "fetchr:hopper_minecart", item: {id: "minecraft:hopper_minecart"}, textComponent: '{"translate": "item.minecraft.hopper_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:hopper_minecart"}}}', icon: '"\\u0035"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:hopper_minecart 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:hopper_minecart 1", categories: ["fetchr:chest_iron"]}

## 0036: furnace_minecart
data modify storage fetchr:registries items append value {id: "fetchr:furnace_minecart", item: {id: "minecraft:furnace_minecart"}, textComponent: '{"translate": "item.minecraft.furnace_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:furnace_minecart"}}}', icon: '"\\u0036"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:furnace_minecart 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:furnace_minecart 1", categories: ["fetchr:furnace"]}

## 0037: chest_minecart
data modify storage fetchr:registries items append value {id: "fetchr:chest_minecart", item: {id: "minecraft:chest_minecart"}, textComponent: '{"translate": "item.minecraft.chest_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:chest_minecart"}}}', icon: '"\\u0037"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:chest_minecart 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:chest_minecart 1", categories: ["fetchr:chest_iron"]}

## 0038: bone
data modify storage fetchr:registries items append value {id: "fetchr:bone", item: {id: "minecraft:bone"}, textComponent: '{"translate": "item.minecraft.bone", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bone"}}}', icon: '"\\u0038"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:bone 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:bone 1", categories: ["fetchr:skeleton_drops"]}

## 0039: ink_sac
data modify storage fetchr:registries items append value {id: "fetchr:ink_sac", item: {id: "minecraft:ink_sac"}, textComponent: '{"translate": "item.minecraft.ink_sac", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:ink_sac"}}}', icon: '"\\u0039"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:ink_sac 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:ink_sac 1", categories: ["fetchr:ink"]}

## 003a: gray_dye
data modify storage fetchr:registries items append value {id: "fetchr:gray_dye", item: {id: "minecraft:gray_dye"}, textComponent: '{"translate": "item.minecraft.gray_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:gray_dye"}}}', icon: '"\\u003a"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:gray_dye 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:gray_dye 1", categories: ["fetchr:ink"]}

## 003b: green_dye
data modify storage fetchr:registries items append value {id: "fetchr:lime_dye", item: {id: "minecraft:green_dye"}, textComponent: '{"translate": "item.minecraft.green_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:green_dye"}}}', icon: '"\\u003b"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:green_dye 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:green_dye 1", categories: ["fetchr:cactus"]}

## 003c: lime_dye
data modify storage fetchr:registries items append value {id: "fetchr:lime_dye", item: {id: "minecraft:lime_dye"}, textComponent: '{"translate": "item.minecraft.lime_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lime_dye"}}}', icon: '"\\u003c"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:lime_dye 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:lime_dye 1", categories: ["fetchr:cactus", "fetchr:lime"]}

## 003d: lapis_lazuli
data modify storage fetchr:registries items append value {id: "fetchr:lapis_lazuli", item: {id: "minecraft:lapis_lazuli"}, textComponent: '{"translate": "item.minecraft.lapis_lazuli", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lapis_lazuli"}}}', icon: '"\\u003d"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:lapis_lazuli 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:lapis_lazuli 1", categories: ["fetchr:lapis"]}

## 003e: cyan_dye
data modify storage fetchr:registries items append value {id: "fetchr:cyan_dye", item: {id: "minecraft:cyan_dye"}, textComponent: '{"translate": "item.minecraft.cyan_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cyan_dye"}}}', icon: '"\\u003e"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:cyan_dye 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:cyan_dye 1", categories: ["fetchr:lapis"], weight: 2}

## 003f: purple_dye
data modify storage fetchr:registries items append value {id: "fetchr:purple_dye", item: {id: "minecraft:purple_dye"}, textComponent: '{"translate": "item.minecraft.purple_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:purple_dye"}}}', icon: '"\\u003f"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:purple_dye 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:purple_dye 1", categories: ["fetchr:lapis"], weight: 2}

## 0040: suspicious_stew
data modify storage fetchr:registries items append value {id: "fetchr:suspicious_stew", item: {id: "minecraft:suspicious_stew"}, textComponent: '{"translate": "item.minecraft.suspicious_stew", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:suspicious_stew"}}}', icon: '"\\u0040"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:suspicious_stew 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:suspicious_stew 1", categories: ["fetchr:mushroom"]}

## 0041: glass_bottle
data modify storage fetchr:registries items append value {id: "fetchr:glass_bottle", item: {id: "minecraft:glass_bottle"}, textComponent: '{"translate": "item.minecraft.glass_bottle", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:glass_bottle"}}}', icon: '"\\u0041"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:glass_bottle 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:glass_bottle 1", categories: ["fetchr:sand"], weight: 2}

## 0042: cod
data modify storage fetchr:registries items append value {id: "fetchr:cod", item: {id: "minecraft:cod"}, textComponent: '{"translate": "item.minecraft.cod", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cod"}}}', icon: '"\\u0042"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:cod 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:cod 1", categories: ["fetchr:fish"]}

## 0043: cod_bucket
data modify storage fetchr:registries items append value {id: "fetchr:cod_bucket", item: {id: "minecraft:cod_bucket"}, textComponent: '{"translate": "item.minecraft.cod_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cod_bucket"}}}', icon: '"\\u0043"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:cod_bucket 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:cod_bucket 1", categories: ["fetchr:fish"]}

## 0044: salmon
data modify storage fetchr:registries items append value {id: "fetchr:salmon", item: {id: "minecraft:salmon"}, textComponent: '{"translate": "item.minecraft.salmon", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:salmon"}}}', icon: '"\\u0044"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:salmon 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:salmon 1", categories: ["fetchr:fish"]}

## 0045: salmon_bucket
data modify storage fetchr:registries items append value {id: "fetchr:salmon_bucket", item: {id: "minecraft:salmon_bucket"}, textComponent: '{"translate": "item.minecraft.salmon_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:salmon_bucket"}}}', icon: '"\\u0045"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:salmon_bucket 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:salmon_bucket 1", categories: ["fetchr:fish"]}

## 0046: tropical_fish
data modify storage fetchr:registries items append value {id: "fetchr:tropical_fish", item: {id: "minecraft:tropical_fish"}, textComponent: '{"translate": "item.minecraft.tropical_fish", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tropical_fish"}}}', icon: '"\\u0046"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:tropical_fish 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:tropical_fish 1", categories: ["fetchr:fish"]}

## 0047: tropical_fish_bucket
data modify storage fetchr:registries items append value {id: "fetchr:tropical_fish_bucket", item: {id: "minecraft:tropical_fish_bucket"}, textComponent: '{"translate": "item.minecraft.tropical_fish_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tropical_fish_bucket"}}}', icon: '"\\u0047"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:tropical_fish_bucket 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:tropical_fish_bucket 1", categories: ["fetchr:fish"]}

## 0048: birch_sapling
data modify storage fetchr:registries items append value {id: "fetchr:birch_sapling", item: {id: "minecraft:birch_sapling"}, textComponent: '{"translate": "block.minecraft.birch_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:birch_sapling"}}}', icon: '"\\u0048"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:birch_sapling 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:birch_sapling 1", categories: ["fetchr:sapling"]}

## 0049: dark_oak_sapling
data modify storage fetchr:registries items append value {id: "fetchr:dark_oak_sapling", item: {id: "minecraft:dark_oak_sapling"}, textComponent: '{"translate": "block.minecraft.dark_oak_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dark_oak_sapling"}}}', icon: '"\\u0049"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:dark_oak_sapling 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:dark_oak_sapling 1", categories: ["fetchr:sapling"]}

## 004a: lead
data modify storage fetchr:registries items append value {id: "fetchr:lead", item: {id: "minecraft:lead"}, textComponent: '{"translate": "item.minecraft.lead", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lead"}}}', icon: '"\\u004a"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:lead 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:lead 1", categories: ["fetchr:nighttime_mob_drops"]}

## 004b: detector_rail
data modify storage fetchr:registries items append value {id: "fetchr:detector_rail", item: {id: "minecraft:detector_rail"}, textComponent: '{"translate": "block.minecraft.detector_rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:detector_rail"}}}', icon: '"\\u004b"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:detector_rail 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:detector_rail 1", categories: ["fetchr:rail"]}

## 004c: activator_rail
data modify storage fetchr:registries items append value {id: "fetchr:activator_rail", item: {id: "minecraft:activator_rail"}, textComponent: '{"translate": "block.minecraft.activator_rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:activator_rail"}}}', icon: '"\\u004c"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:activator_rail 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:activator_rail 1", categories: ["fetchr:rail"]}

## 004d: heart_of_the_sea
data modify storage fetchr:registries items append value {id: "fetchr:heart_of_the_sea", item: {id: "minecraft:heart_of_the_sea"}, textComponent: '{"translate": "item.minecraft.heart_of_the_sea", "color": "yellow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:heart_of_the_sea"}}}', icon: '"\\u004d"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:heart_of_the_sea 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:heart_of_the_sea 1", categories: ["fetchr:shipwreck"]}

## 004e: glow_berries
data modify storage fetchr:registries items append value {id: "fetchr:glow_berries", item: {id: "minecraft:glow_berries"}, textComponent: '{"translate": "item.minecraft.glow_berries", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:glow_berries"}}}', icon: '"\\u004e"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:glow_berries 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:glow_berries 1", categories: ["fetchr:lush_cave"], weight: 3}

## 004f: sweet_berries
data modify storage fetchr:registries items append value {id: "fetchr:sweet_berries", item: {id: "minecraft:sweet_berries"}, textComponent: '{"translate": "item.minecraft.sweet_berries", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:sweet_berries"}}}', icon: '"\\u004f"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:sweet_berries 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:sweet_berries 1", categories: ["fetchr:taiga"]}

## 0050: diamond_sword
data modify storage fetchr:registries items append value {id: "fetchr:diamond_sword", item: {id: "minecraft:diamond_sword"}, textComponent: '{"translate": "item.minecraft.diamond_sword", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_sword"}}}', icon: '"\\u0050"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:diamond_sword 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:diamond_sword 1", categories: ["fetchr:diamond"], weight: 2}

## 0051: diamond_pickaxe
data modify storage fetchr:registries items append value {id: "fetchr:diamond_pickaxe", item: {id: "minecraft:diamond_pickaxe"}, textComponent: '{"translate": "item.minecraft.diamond_pickaxe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_pickaxe"}}}', icon: '"\\u0051"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:diamond_pickaxe 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:diamond_pickaxe 1", categories: ["fetchr:diamond"], weight: 2}

## 0052: golden_axe
data modify storage fetchr:registries items append value {id: "fetchr:golden_axe", item: {id: "minecraft:golden_axe"}, textComponent: '{"translate": "item.minecraft.golden_axe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_axe"}}}', icon: '"\\u0052"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:golden_axe 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:golden_axe 1", categories: ["fetchr:gold_and_ruined_portal"], weight: 2}

## 0053: golden_pickaxe
data modify storage fetchr:registries items append value {id: "fetchr:golden_pickaxe", item: {id: "minecraft:golden_pickaxe"}, textComponent: '{"translate": "item.minecraft.golden_pickaxe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_pickaxe"}}}', icon: '"\\u0053"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:golden_pickaxe 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:golden_pickaxe 1", categories: ["fetchr:gold_and_ruined_portal"], weight: 2}

## 0054: golden_hoe
data modify storage fetchr:registries items append value {id: "fetchr:golden_hoe", item: {id: "minecraft:golden_hoe"}, textComponent: '{"translate": "item.minecraft.golden_hoe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_hoe"}}}', icon: '"\\u0054"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:golden_hoe 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:golden_hoe 1", categories: ["fetchr:gold_and_ruined_portal"], weight: 2}

## 0055: crossbow
data modify storage fetchr:registries items append value {id: "fetchr:crossbow", item: {id: "minecraft:crossbow"}, textComponent: '{"translate": "item.minecraft.crossbow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:crossbow"}}}', icon: '"\\u0055"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:crossbow 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:crossbow 1", categories: ["fetchr:bow"]}

## 0056: bamboo
data modify storage fetchr:registries items append value {id: "fetchr:bamboo", item: {id: "minecraft:bamboo"}, textComponent: '{"translate": "block.minecraft.bamboo", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bamboo"}}}', icon: '"\\u0056"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:bamboo 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:bamboo 1", categories: ["fetchr:jungle"], weight: 3}

## 0057: sea_pickle
data modify storage fetchr:registries items append value {id: "fetchr:sea_pickle", item: {id: "minecraft:sea_pickle"}, textComponent: '{"translate": "block.minecraft.sea_pickle", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:sea_pickle"}}}', icon: '"\\u0057"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:sea_pickle 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:sea_pickle 1", categories: ["fetchr:lime"]}

## 0058: seagrass
data modify storage fetchr:registries items append value {id: "fetchr:seagrass", item: {id: "minecraft:seagrass"}, textComponent: '{"translate": "block.minecraft.seagrass", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:seagrass"}}}', icon: '"\\u0058"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:seagrass 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:seagrass 1", categories: ["fetchr:shearable"], weight: 2}

## 0059: rabbit_hide
data modify storage fetchr:registries items append value {id: "fetchr:rabbit_hide", item: {id: "minecraft:rabbit_hide"}, textComponent: '{"translate": "item.minecraft.rabbit_hide", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:rabbit_hide"}}}', icon: '"\\u0059"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:rabbit_hide 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:rabbit_hide 1", categories: ["fetchr:rabbit"]}

## 005a: cooked_rabbit
data modify storage fetchr:registries items append value {id: "fetchr:cooked_rabbit", item: {id: "minecraft:cooked_rabbit"}, textComponent: '{"translate": "item.minecraft.cooked_rabbit", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cooked_rabbit"}}}', icon: '"\\u005a"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:cooked_rabbit 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:cooked_rabbit 1", categories: ["fetchr:rabbit"]}

## 005b: dried_kelp
data modify storage fetchr:registries items append value {id: "fetchr:dried_kelp", item: {id: "minecraft:dried_kelp"}, textComponent: '{"translate": "item.minecraft.dried_kelp", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dried_kelp"}}}', icon: '"\\u005b"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:dried_kelp 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:dried_kelp 1", categories: ["fetchr:kelp"]}

## 005c: slowness_arrow
#NEUN_SCRIPT until 33
#data modify storage fetchr:registries items append value {id: "fetchr:slowness_arrow", item: {id: "minecraft:tipped_arrow", tag: {Potion: "minecraft:slowness"}}, textComponent: '{"translate": "item.minecraft.tipped_arrow.effect.slowness", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tipped_arrow", "tag": "{Potion: \\"minecraft:slowness\\"}"}}}', icon: '"\\u005c"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:tipped_arrow{Potion: 'minecraft:slowness'} 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:tipped_arrow{Potion: 'minecraft:slowness'} 1", categories: [{id: "fetchr:skeleton_drops"}, {id: "fetchr:nighttime_mob_drops", weight: 3}]}
#NEUN_SCRIPT end
#NEUN_SCRIPT since 33
data modify storage fetchr:registries items append value {id: "fetchr:slowness_arrow", item: {id: "minecraft:tipped_arrow", components: {"minecraft:potion_contents": {potion: "minecraft:slowness"}}}, textComponent: '{"translate": "item.minecraft.tipped_arrow.effect.slowness", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tipped_arrow", "tag": "{Potion: \\"minecraft:slowness\\"}"}}}', icon: '"\\u005c"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:tipped_arrow[minecraft:potion_contents={potion: 'minecraft:slowness'}] 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:tipped_arrow[minecraft:potion_contents={potion: 'minecraft:slowness'}] 1", categories: [{id: "fetchr:skeleton_drops"}, {id: "fetchr:nighttime_mob_drops", weight: 3}]}
#NEUN_SCRIPT end

## 005d: glow_ink_sac
data modify storage fetchr:registries items append value {id: "fetchr:glow_ink_sac", item: {id: "minecraft:glow_ink_sac"}, textComponent: '{"translate": "item.minecraft.glow_ink_sac", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:glow_ink_sac"}}}', icon: '"\\u005d"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:glow_ink_sac 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:glow_ink_sac 1", categories: ["fetchr:glow_ink"]}

## 005e: glow_item_frame
data modify storage fetchr:registries items append value {id: "fetchr:glow_item_frame", item: {id: "minecraft:glow_item_frame"}, textComponent: '{"translate": "item.minecraft.glow_item_frame", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:glow_item_frame"}}}', icon: '"\\u005e"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:glow_item_frame 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:glow_item_frame 1", categories: [{id: "fetchr:glow_ink"}, {id: "fetchr:leather", weight: 2}]}

## 005f: pointed_dripstone
data modify storage fetchr:registries items append value {id: "fetchr:pointed_dripstone", item: {id: "minecraft:pointed_dripstone"}, textComponent: '{"translate": "block.minecraft.pointed_dripstone", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:pointed_dripstone"}}}', icon: '"\\u005f"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:pointed_dripstone 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:pointed_dripstone 1", categories: ["fetchr:dripstone_cave"]}

## 0060: hanging_roots
data modify storage fetchr:registries items append value {id: "fetchr:hanging_roots", item: {id: "minecraft:hanging_roots"}, textComponent: '{"translate": "block.minecraft.hanging_roots", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:hanging_roots"}}}', icon: '"\\u0060"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:hanging_roots 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:hanging_roots 1", categories: ["fetchr:lush_cave"]}

## 0061: glow_lichen
data modify storage fetchr:registries items append value {id: "fetchr:glow_lichen", item: {id: "minecraft:glow_lichen"}, textComponent: '{"translate": "block.minecraft.glow_lichen", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:glow_lichen"}}}', icon: '"\\u0061"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:glow_lichen 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:glow_lichen 1", categories: ["fetchr:shearable"], weight: 2}

## 0062: amethyst_shard
data modify storage fetchr:registries items append value {id: "fetchr:amethyst_shard", item: {id: "minecraft:amethyst_shard"}, textComponent: '{"translate": "item.minecraft.amethyst_shard", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:amethyst_shard"}}}', icon: '"\\u0062"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:amethyst_shard 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:amethyst_shard 1", categories: ["fetchr:amethyst"]}

## 0063: spyglass
data modify storage fetchr:registries items append value {id: "fetchr:spyglass", item: {id: "minecraft:spyglass"}, textComponent: '{"translate": "item.minecraft.spyglass", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:spyglass"}}}', icon: '"\\u0063"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:spyglass 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:spyglass 1", categories: ["fetchr:amethyst"]}

## 0064: blue_trimmed_leather_boots
#NEUN_SCRIPT until 33
#data modify storage fetchr:registries items append value {id: "fetchr:blue_trimmed_leather_boots", item: {id: "minecraft:leather_boots", tag: {Trim: {pattern: "minecraft:shaper", material: "minecraft:lapis"}, HideFlags: 128, display: {Lore:['{"translate": "item.minecraft.smithing_template.upgrade", "color": "gray", "italic": false}', '[" ", {"translate": "fetchr.item.description.any_trim", "color": "#406d95", "italic": false}]', '[" ", {"translate": "trim_material.minecraft.lapis", "color": "#406d95", "italic": false}]']}}}, textComponent: '{"translate": "fetchr.item.blue_trimmed_leather_boots", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:leather_boots", "tag": "{Trim: {pattern: \'minecraft:shaper\', material: \'minecraft:lapis\'}}"}}}', icon: '"\\u0064"', detectCommand: 'execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:leather_boots{Trim: {material: "minecraft:lapis"}} 0', clearCommand: 'clear @a[tag=fetchr.clear] minecraft:leather_boots{Trim: {material: "minecraft:lapis"}} 1', categories: ["fetchr:shipwreck"]}
#NEUN_SCRIPT end
#NEUN_SCRIPT since 33 until 39
#data modify storage fetchr:registries items append value {id: "fetchr:blue_trimmed_leather_boots", item: {id: "minecraft:leather_boots", components: {"minecraft:trim": {pattern: "minecraft:shaper", material: "minecraft:lapis", show_in_tooltip: false}, "minecraft:lore": ['{"translate": "item.minecraft.smithing_template.upgrade", "color": "gray", "italic": false}', '[" ", {"translate": "fetchr.item.description.any_trim", "color": "#406d95", "italic": false}]', '[" ", {"translate": "trim_material.minecraft.lapis", "color": "#406d95", "italic": false}]']}}, textComponent: '{"translate": "fetchr.item.blue_trimmed_leather_boots", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:leather_boots", "tag": "{Trim: {pattern: \'minecraft:shaper\', material: \'minecraft:lapis\'}}"}}}', icon: '"\\u0064"', detectCommand: "execute as @a[tag=fetchr.check_slot] run function fetchr:item_detection/special/detect_blue_trimmed_leather_boots", clearCommand: "execute as @a[tag=fetchr.clear] run function fetchr:item_detection/special/clear_blue_trimmed_leather_boots", categories: ["fetchr:shipwreck"]}
#NEUN_SCRIPT end
#NEUN_SCRIPT since 39
data modify storage fetchr:registries items append value {id: "fetchr:blue_trimmed_leather_boots", item: {id: "minecraft:leather_boots", components: {"minecraft:trim": {pattern: "minecraft:shaper", material: "minecraft:lapis", show_in_tooltip: false}, "minecraft:lore": ['{"translate": "item.minecraft.smithing_template.upgrade", "color": "gray", "italic": false}', '[" ", {"translate": "fetchr.item.description.any_trim", "color": "#406d95", "italic": false}]', '[" ", {"translate": "trim_material.minecraft.lapis", "color": "#406d95", "italic": false}]']}}, textComponent: '{"translate": "fetchr.item.blue_trimmed_leather_boots", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:leather_boots", "tag": "{Trim: {pattern: \'minecraft:shaper\', material: \'minecraft:lapis\'}}"}}}', icon: '"\\u0064"', detectCommand: 'execute as @a[tag=fetchr.check_slot] if items entity @s container.* minecraft:leather_boots[minecraft:trim~{material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1', clearCommand: 'clear @a[tag=fetchr.clear] minecraft:leather_boots[minecraft:trim~{material:"minecraft:lapis"}] 1', categories: ["fetchr:shipwreck"]}
#NEUN_SCRIPT end

## 0065: hanging_acacia_sign
data modify storage fetchr:registries items append value {id: "fetchr:hanging_acacia_sign", item: {id: "minecraft:acacia_hanging_sign"}, textComponent: '{"translate": "block.minecraft.acacia_hanging_sign", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:acacia_hanging_sign"}}}', icon: '"\\u0065"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:acacia_hanging_sign 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:acacia_hanging_sign 1", categories: ["fetchr:basic_iron"], weight: 3}

## 0066: brush
data modify storage fetchr:registries items append value {id: "fetchr:brush", item: {id: "minecraft:brush"}, textComponent: '{"translate": "item.minecraft.brush", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:brush"}}}', icon: '"\\u0066"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:brush 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:brush 1", categories: ["fetchr:copper"], weight: 3}

## 0067: cherry_chest_boat
data modify storage fetchr:registries items append value {id: "fetchr:cherry_chest_boat", item: {id: "minecraft:cherry_chest_boat"}, textComponent: '{"translate": "item.minecraft.cherry_chest_boat", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cherry_chest_boat"}}}', icon: '"\\u0067"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:cherry_chest_boat 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:cherry_chest_boat 1", categories: ["fetchr:cherry_grove"]}

## 0068: pink_petals
data modify storage fetchr:registries items append value {id: "fetchr:pink_petals", item: {id: "minecraft:pink_petals"}, textComponent: '{"translate": "block.minecraft.pink_petals", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:pink_petals"}}}', icon: '"\\u0068"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:pink_petals 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:pink_petals 1", categories: ["fetchr:cherry_grove"]}

## 0069: cherry_sapling
data modify storage fetchr:registries items append value {id: "fetchr:cherry_sapling", item: {id: "minecraft:cherry_sapling"}, textComponent: '{"translate": "block.minecraft.cherry_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cherry_sapling"}}}', icon: '"\\u0069"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:cherry_sapling 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:cherry_sapling 1", categories: ["fetchr:cherry_grove"]}

## 0100: iron_block
data modify storage fetchr:registries items append value {id: "fetchr:iron_block", item: {id: "minecraft:iron_block"}, textComponent: '{"translate": "block.minecraft.iron_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:iron_block"}}}', icon: '"\\u0100"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:iron_block 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:iron_block 1", categories: ["fetchr:basic_iron"]}

## 0101: redstone_block
data modify storage fetchr:registries items append value {id: "fetchr:redstone_block", item: {id: "minecraft:redstone_block"}, textComponent: '{"translate": "block.minecraft.redstone_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:redstone_block"}}}', icon: '"\\u0101"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:redstone_block 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:redstone_block 1", categories: ["fetchr:redstone"]}

## 0102: bookshelf
data modify storage fetchr:registries items append value {id: "fetchr:bookshelf", item: {id: "minecraft:bookshelf"}, textComponent: '{"translate": "block.minecraft.bookshelf", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bookshelf"}}}', icon: '"\\u0102"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:bookshelf 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:bookshelf 1", categories: ["fetchr:leather"]}

## 0103: obsidian
data modify storage fetchr:registries items append value {id: "fetchr:obsidian", item: {id: "minecraft:obsidian"}, textComponent: '{"translate": "block.minecraft.obsidian", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:obsidian"}}}', icon: '"\\u0103"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:obsidian 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:obsidian 1", categories: ["fetchr:diamond"], weight: 5}

## 0104: melon
data modify storage fetchr:registries items append value {id: "fetchr:melon", item: {id: "minecraft:melon"}, textComponent: '{"translate": "block.minecraft.melon", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:melon"}}}', icon: '"\\u0104"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:melon 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:melon 1", categories: ["fetchr:jungle"], weight: 2}

## 0105: mossy_stone_bricks
data modify storage fetchr:registries items append value {id: "fetchr:mossy_stone_bricks", item: {id: "minecraft:mossy_stone_bricks"}, textComponent: '{"translate": "block.minecraft.mossy_stone_bricks", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:mossy_stone_bricks"}}}', icon: '"\\u0105"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:mossy_stone_bricks 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:mossy_stone_bricks 1", categories: ["fetchr:shearable"]}

## 0106: jukebox
data modify storage fetchr:registries items append value {id: "fetchr:jukebox", item: {id: "minecraft:jukebox"}, textComponent: '{"translate": "block.minecraft.jukebox", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:jukebox"}}}', icon: '"\\u0106"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:jukebox 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:jukebox 1", categories: ["fetchr:diamond"], weight: 10}

## 0107: magma_block
data modify storage fetchr:registries items append value {id: "fetchr:magma_block", item: {id: "minecraft:magma_block"}, textComponent: '{"translate": "block.minecraft.magma_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:magma_block"}}}', icon: '"\\u0107"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:magma_block 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:magma_block 1", categories: ["fetchr:gold_and_ruined_portal"], weight: 30}

## 0108: bone_block
data modify storage fetchr:registries items append value {id: "fetchr:bone_block", item: {id: "minecraft:bone_block"}, textComponent: '{"translate": "block.minecraft.bone_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bone_block"}}}', icon: '"\\u0108"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:bone_block 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:bone_block 1", categories: ["fetchr:skeleton_drops"]}

## 0109: blast_furnace
data modify storage fetchr:registries items append value {id: "fetchr:blast_furnace", item: {id: "minecraft:blast_furnace"}, textComponent: '{"translate": "block.minecraft.blast_furnace", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:blast_furnace"}}}', icon: '"\\u0109"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:blast_furnace 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:blast_furnace 1", categories: ["fetchr:furnace"]}

## 010a: raw_iron_block
data modify storage fetchr:registries items append value {id: "fetchr:raw_iron_block", item: {id: "minecraft:raw_iron_block"}, textComponent: '{"translate": "block.minecraft.raw_iron_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:raw_iron_block"}}}', icon: '"\\u010a"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:raw_iron_block 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:raw_iron_block 1", categories: ["fetchr:basic_iron"]}

## 010b: red_bed
data modify storage fetchr:registries items append value {id: "fetchr:red_bed", item: {id: "minecraft:red_bed"}, textComponent: '{"translate": "block.minecraft.red_bed", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:red_bed"}}}', icon: '"\\u010b"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:red_bed 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:red_bed 1", categories: ["fetchr:wool"]}

## 010c: target
data modify storage fetchr:registries items append value {id: "fetchr:target", item: {id: "minecraft:target"}, textComponent: '{"translate": "block.minecraft.target", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:target"}}}', icon: '"\\u010c"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:target 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:target 1", categories: ["fetchr:wheat"]}

## 010d: snow
data modify storage fetchr:registries items append value {id: "fetchr:snow", item: {id: "minecraft:snow"}, textComponent: '{"translate": "block.minecraft.snow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:snow"}}}', icon: '"\\u010d"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:snow 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:snow 1", categories: ["fetchr:snow"]}

## 010e: stonecutter
data modify storage fetchr:registries items append value {id: "fetchr:stonecutter", item: {id: "minecraft:stonecutter"}, textComponent: '{"translate": "block.minecraft.stonecutter", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:stonecutter"}}}', icon: '"\\u010e"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:stonecutter 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:stonecutter 1", categories: ["fetchr:basic_iron"], weight: 3}

## 010f: jack_o_lantern
data modify storage fetchr:registries items append value {id: "fetchr:jack_o_lantern", item: {id: "minecraft:jack_o_lantern"}, textComponent: '{"translate": "block.minecraft.jack_o_lantern", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:jack_o_lantern"}}}', icon: '"\\u010f"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:jack_o_lantern 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:jack_o_lantern 1", categories: ["fetchr:pumpkin"]}

## 0110: tnt
data modify storage fetchr:registries items append value {id: "fetchr:tnt", item: {id: "minecraft:tnt"}, textComponent: '{"translate": "block.minecraft.tnt", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tnt"}}}', icon: '"\\u0110"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:tnt 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:tnt 1", categories: ["fetchr:gunpowder", "fetchr:sand"]}

## 0111: lapis_block
data modify storage fetchr:registries items append value {id: "fetchr:lapis_block", item: {id: "minecraft:lapis_block"}, textComponent: '{"translate": "block.minecraft.lapis_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lapis_block"}}}', icon: '"\\u0111"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:lapis_block 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:lapis_block 1", categories: ["fetchr:lapis"]}

## 0112: dispenser
data modify storage fetchr:registries items append value {id: "fetchr:dispenser", item: {id: "minecraft:dispenser"}, textComponent: '{"translate": "block.minecraft.dispenser", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dispenser"}}}', icon: '"\\u0112"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:dispenser 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:dispenser 1", categories: ["fetchr:bow"]}

## 0113: smoker
data modify storage fetchr:registries items append value {id: "fetchr:smoker", item: {id: "minecraft:smoker"}, textComponent: '{"translate": "block.minecraft.smoker", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:smoker"}}}', icon: '"\\u0113"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:smoker 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:smoker 1", categories: ["fetchr:furnace"]}

## 0114: dried_kelp_block
data modify storage fetchr:registries items append value {id: "fetchr:dried_kelp_block", item: {id: "minecraft:dried_kelp_block"}, textComponent: '{"translate": "block.minecraft.dried_kelp_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dried_kelp_block"}}}', icon: '"\\u0114"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:dried_kelp_block 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:dried_kelp_block 1", categories: ["fetchr:kelp"]}

## 0115: hay_bale
data modify storage fetchr:registries items append value {id: "fetchr:hay_bale", item: {id: "minecraft:hay_block"}, textComponent: '{"translate": "block.minecraft.hay_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:hay_block"}}}', icon: '"\\u0115"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:hay_block 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:hay_block 1", categories: ["fetchr:wheat"]}

## 0116: fletching_table
data modify storage fetchr:registries items append value {id: "fetchr:fletching_table", item: {id: "minecraft:fletching_table"}, textComponent: '{"translate": "block.minecraft.fletching_table", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:fletching_table"}}}', icon: '"\\u0116"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:fletching_table 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:fletching_table 1", categories: ["fetchr:flint"]}

## 0117: lectern
data modify storage fetchr:registries items append value {id: "fetchr:lectern", item: {id: "minecraft:lectern"}, textComponent: '{"translate": "block.minecraft.lectern", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lectern"}}}', icon: '"\\u0117"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:lectern 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:lectern 1", categories: ["fetchr:leather"]}

## 0118: raw_gold_block
data modify storage fetchr:registries items append value {id: "fetchr:raw_gold_block", item: {id: "minecraft:raw_gold_block"}, textComponent: '{"translate": "block.minecraft.raw_gold_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:raw_gold_block"}}}', icon: '"\\u0118"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:raw_gold_block 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:raw_gold_block 1", categories: ["fetchr:gold_and_ruined_portal"], weight: 5}

## 0119: gold_block
data modify storage fetchr:registries items append value {id: "fetchr:gold_block", item: {id: "minecraft:gold_block"}, textComponent: '{"translate": "block.minecraft.gold_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:gold_block"}}}', icon: '"\\u0119"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:gold_block 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:gold_block 1", categories: ["fetchr:gold_and_ruined_portal"], weight: 5}

## 011a: scaffolding
data modify storage fetchr:registries items append value {id: "fetchr:scaffolding", item: {id: "minecraft:scaffolding"}, textComponent: '{"translate": "block.minecraft.scaffolding", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:scaffolding"}}}', icon: '"\\u011a"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:scaffolding 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:scaffolding 1", categories: ["fetchr:jungle"], weight: 3}

## 011b: piston
data modify storage fetchr:registries items append value {id: "fetchr:piston", item: {id: "minecraft:piston"}, textComponent: '{"translate": "block.minecraft.piston", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:piston"}}}', icon: '"\\u011b"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:piston 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:piston 1", categories: ["fetchr:piston"]}

## 011c: sticky_piston
data modify storage fetchr:registries items append value {id: "fetchr:sticky_piston", item: {id: "minecraft:sticky_piston"}, textComponent: '{"translate": "block.minecraft.sticky_piston", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:sticky_piston"}}}', icon: '"\\u011c"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:sticky_piston 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:sticky_piston 1", categories: ["fetchr:piston", "fetchr:nighttime_mob_drops"]}

## 011d: orange_concrete
data modify storage fetchr:registries items append value {id: "fetchr:orange_concrete", item: {id: "minecraft:orange_concrete"}, textComponent: '{"translate": "block.minecraft.orange_concrete", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:orange_concrete"}}}', icon: '"\\u011d"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:orange_concrete 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:orange_concrete 1", categories: ["fetchr:sand"], weight: 2}

## 011e: pink_glazed_terracotta
data modify storage fetchr:registries items append value {id: "fetchr:pink_glazed_terracotta", item: {id: "minecraft:pink_glazed_terracotta"}, textComponent: '{"translate": "block.minecraft.pink_glazed_terracotta", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:pink_glazed_terracotta"}}}', icon: '"\\u011e"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:pink_glazed_terracotta 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:pink_glazed_terracotta 1", categories: ["fetchr:clay"], weight: 2}

## 011f: deepslate
data modify storage fetchr:registries items append value {id: "fetchr:deepslate", item: {id: "minecraft:deepslate"}, textComponent: '{"translate": "block.minecraft.deepslate", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:deepslate"}}}', icon: '"\\u011f"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:deepslate 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:deepslate 1", categories: ["fetchr:deepslate"]}

## 0120: cracked_deepslate_bricks
data modify storage fetchr:registries items append value {id: "fetchr:cracked_deepslate_bricks", item: {id: "minecraft:cracked_deepslate_bricks"}, textComponent: '{"translate": "block.minecraft.cracked_deepslate_bricks", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cracked_deepslate_bricks"}}}', icon: '"\\u0120"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:cracked_deepslate_bricks 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:cracked_deepslate_bricks 1", categories: ["fetchr:deepslate"]}

## 0121: deepslate_tile_wall
data modify storage fetchr:registries items append value {id: "fetchr:deepslate_tile_wall", item: {id: "minecraft:deepslate_tile_wall"}, textComponent: '{"translate": "block.minecraft.deepslate_tile_wall", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:deepslate_tile_wall"}}}', icon: '"\\u0121"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:deepslate_tile_wall 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:deepslate_tile_wall 1", categories: ["fetchr:deepslate"]}

## 0122: muddy_mangrove_roots
data modify storage fetchr:registries items append value {id: "fetchr:muddy_mangrove_roots", item: {id: "minecraft:muddy_mangrove_roots"}, textComponent: '{"translate": "block.minecraft.muddy_mangrove_roots", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:muddy_mangrove_roots"}}}', icon: '"\\u0122"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:muddy_mangrove_roots 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:muddy_mangrove_roots 1", categories: ["fetchr:mud"]}

## 0123: packed_mud
data modify storage fetchr:registries items append value {id: "fetchr:packed_mud", item: {id: "minecraft:packed_mud"}, textComponent: '{"translate": "block.minecraft.packed_mud", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:packed_mud"}}}', icon: '"\\u0123"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:packed_mud 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:packed_mud 1", categories: ["fetchr:mud"]}

## 0124: mud_bricks
data modify storage fetchr:registries items append value {id: "fetchr:mud_bricks", item: {id: "minecraft:mud_bricks"}, textComponent: '{"translate": "block.minecraft.mud_bricks", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:mud_bricks"}}}', icon: '"\\u0124"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:mud_bricks 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:mud_bricks 1", categories: ["fetchr:mud"]}

## 0125: rooted_dirt
data modify storage fetchr:registries items append value {id: "fetchr:rooted_dirt", item: {id: "minecraft:rooted_dirt"}, textComponent: '{"translate": "block.minecraft.rooted_dirt", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:rooted_dirt"}}}', icon: '"\\u0125"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:rooted_dirt 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:rooted_dirt 1", categories: ["fetchr:lush_cave"]}

## 0126: moss_carpet
data modify storage fetchr:registries items append value {id: "fetchr:moss_carpet", item: {id: "minecraft:moss_carpet"}, textComponent: '{"translate": "block.minecraft.moss_carpet", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:moss_carpet"}}}', icon: '"\\u0126"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:moss_carpet 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:moss_carpet 1", categories: ["fetchr:lush_cave"], weight: 3}

## 0127: flowering_azalea
data modify storage fetchr:registries items append value {id: "fetchr:flowering_azalea", item: {id: "minecraft:flowering_azalea"}, textComponent: '{"translate": "block.minecraft.flowering_azalea", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:flowering_azalea"}}}', icon: '"\\u0127"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:flowering_azalea 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:flowering_azalea 1", categories: ["fetchr:lush_cave"]}

## 0128: spore_blossom
data modify storage fetchr:registries items append value {id: "fetchr:spore_blossom", item: {id: "minecraft:spore_blossom"}, textComponent: '{"translate": "block.minecraft.spore_blossom", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:spore_blossom"}}}', icon: '"\\u0128"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:spore_blossom 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:spore_blossom 1", categories: ["fetchr:lush_cave"], weight: 3}

## 0129: dripstone_block
data modify storage fetchr:registries items append value {id: "fetchr:dripstone_block", item: {id: "minecraft:dripstone_block"}, textComponent: '{"translate": "block.minecraft.dripstone_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dripstone_block"}}}', icon: '"\\u0129"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:dripstone_block 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:dripstone_block 1", categories: ["fetchr:dripstone_cave"]}

## 012a: raw_copper_block
data modify storage fetchr:registries items append value {id: "fetchr:raw_copper_block", item: {id: "minecraft:raw_copper_block"}, textComponent: '{"translate": "block.minecraft.raw_copper_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:raw_copper_block"}}}', icon: '"\\u012a"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:raw_copper_block 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:raw_copper_block 1", categories: ["fetchr:copper"]}

## 012b: copper_block
data modify storage fetchr:registries items append value {id: "fetchr:copper_block", item: {id: "minecraft:copper_block"}, textComponent: '{"translate": "block.minecraft.copper_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:copper_block"}}}', icon: '"\\u012b"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:copper_block 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:copper_block 1", categories: ["fetchr:copper"]}

## 012c: exposed_cut_copper
data modify storage fetchr:registries items append value {id: "fetchr:exposed_cut_copper", item: {id: "minecraft:exposed_cut_copper"}, textComponent: '{"translate": "block.minecraft.exposed_cut_copper", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:exposed_cut_copper"}}}', icon: '"\\u012c"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:exposed_cut_copper 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:exposed_cut_copper 1", categories: ["fetchr:copper"]}

## 012d: big_dripleaf
data modify storage fetchr:registries items append value {id: "fetchr:big_dripleaf", item: {id: "minecraft:big_dripleaf"}, textComponent: '{"translate": "block.minecraft.big_dripleaf", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:big_dripleaf"}}}', icon: '"\\u012d"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:big_dripleaf 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:big_dripleaf 1", categories: ["fetchr:lush_cave"], weight: 3}

## 012e: tuff
data modify storage fetchr:registries items append value {id: "fetchr:tuff", item: {id: "minecraft:tuff"}, textComponent: '{"translate": "block.minecraft.tuff", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tuff"}}}', icon: '"\\u012e"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:tuff 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:tuff 1", categories: ["fetchr:deepslate"], weight: 3}

## 0131: amethyst_block
data modify storage fetchr:registries items append value {id: "fetchr:amethyst_block", item: {id: "minecraft:amethyst_block"}, textComponent: '{"translate": "block.minecraft.amethyst_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:amethyst_block"}}}', icon: '"\\u0131"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:amethyst_block 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:amethyst_block 1", categories: ["fetchr:amethyst"], weight: 2}

## 0132: calcite
data modify storage fetchr:registries items append value {id: "fetchr:calcite", item: {id: "minecraft:calcite"}, textComponent: '{"translate": "block.minecraft.calcite", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:calcite"}}}', icon: '"\\u0132"', detectCommand: "execute as @a[tag=fetchr.check_slot] store success score @s fetchr.has_item run clear @s minecraft:calcite 0", clearCommand: "clear @a[tag=fetchr.clear] minecraft:calcite 1", categories: ["fetchr:amethyst"], weight: 2}

# structures
data modify storage fetchr:registries structures append value "fetchr:credits"
data modify storage fetchr:registries structures append value "fetchr:card_generation"
data modify storage fetchr:registries structures append value "fetchr:tutorial"

# hud components
data modify storage fetchr:registries hud_components append value {id: "fetchr:timer", addByDefault: true, preferredColumn: 0, name: '{"translate": "fetchr.custom_hud.components.timer"}', iconWidth: '"\\u0008"', iconSeparator: '" "', iconFont: ['{"text":"", "font": "fetchr:clock/line0"}', '{"text":"", "font": "fetchr:clock/line1"}', '{"text":"", "font": "fetchr:clock/line2"}', '{"text":"", "font": "fetchr:clock/line3"}', '{"text":"", "font": "fetchr:clock/line4"}', '{"text":"", "font": "fetchr:clock/line5"}', '{"text":"", "font": "fetchr:clock/line6"}', '{"text":"", "font": "fetchr:clock/line7"}', '{"text":"", "font": "fetchr:clock/line8"}', '{"text":"", "font": "fetchr:clock/line9"}', '{"text":"", "font": "fetchr:clock/line10"}']}
data modify storage fetchr:registries hud_components append value {id: "fetchr:y_position", addByDefault: true, preferredColumn: 1, name: '{"translate": "fetchr.custom_hud.components.y_position"}'}
data modify storage fetchr:registries hud_components append value {id: "fetchr:player_chunk_position", addByDefault: true, preferredColumn: 1, name: '{"translate": "fetchr.custom_hud.components.player_chunk_position"}', settingsClickEvent: '{"text":"", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 70"}}', iconWidth: '"\\u0008"', iconSeparator: '" "', iconFont: ['{"text":"", "font": "fetchr:position/line0"}', '{"text":"", "font": "fetchr:position/line1"}', '{"text":"", "font": "fetchr:position/line2"}', '{"text":"", "font": "fetchr:position/line3"}', '{"text":"", "font": "fetchr:position/line4"}', '{"text":"", "font": "fetchr:position/line5"}', '{"text":"", "font": "fetchr:position/line6"}', '{"text":"", "font": "fetchr:position/line7"}', '{"text":"", "font": "fetchr:position/line8"}', '{"text":"", "font": "fetchr:position/line9"}', '{"text":"", "font": "fetchr:position/line10"}'], icon:'"c"'}
data modify storage fetchr:registries hud_components append value {id: "fetchr:player_position", addByDefault: true, preferredColumn: 1, name: '{"translate": "fetchr.custom_hud.components.player_position"}', settingsClickEvent: '{"text":"", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 72"}}', iconWidth: '"\\u000a"', iconSeparator: '" "', iconFont: ['{"text":"", "font": "fetchr:position/line0"}', '{"text":"", "font": "fetchr:position/line1"}', '{"text":"", "font": "fetchr:position/line2"}', '{"text":"", "font": "fetchr:position/line3"}', '{"text":"", "font": "fetchr:position/line4"}', '{"text":"", "font": "fetchr:position/line5"}', '{"text":"", "font": "fetchr:position/line6"}', '{"text":"", "font": "fetchr:position/line7"}', '{"text":"", "font": "fetchr:position/line8"}', '{"text":"", "font": "fetchr:position/line9"}', '{"text":"", "font": "fetchr:position/line10"}']}
data modify storage fetchr:registries hud_components append value {id: "fetchr:seed", addByDefault: true, preferredColumn: 1, icon: '"s"', iconWidth: '"\\u0009"', iconSeparator: '" "', name: '{"translate": "fetchr.custom_hud.components.seed"}', settingsClickEvent: '{"text":"", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 74"}}', iconFont: ['{"text":"", "font": "fetchr:seed/line0"}', '{"text":"", "font": "fetchr:seed/line1"}', '{"text":"", "font": "fetchr:seed/line2"}', '{"text":"", "font": "fetchr:seed/line3"}', '{"text":"", "font": "fetchr:seed/line4"}', '{"text":"", "font": "fetchr:seed/line5"}', '{"text":"", "font": "fetchr:seed/line6"}', '{"text":"", "font": "fetchr:seed/line7"}', '{"text":"", "font": "fetchr:seed/line8"}', '{"text":"", "font": "fetchr:seed/line9"}', '{"text":"", "font": "fetchr:seed/line10"}']}

# preference pages
data modify storage fetchr:registries preferences.main append value {id: "fetchr:spectator_mode", hoverText: '{"translate": "fetchr.preferences.spectator_mode.description"}', clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 2"}}'}
data modify storage fetchr:registries preferences.main append value {id: "fetchr:custom_hud", textComponent: '{"translate": "fetchr.preferences.custom_hud.title"}', hoverText: '{"translate": "fetchr.preferences.custom_hud.description"}', clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 5"}}'}
data modify storage fetchr:registries preferences.custom_hud append value {id: "fetchr:custom_hud/add_disabled", textComponent: '{"translate": "fetchr.preferences.custom_hud.add_disabled.title"}', hoverText: '{"translate": "fetchr.preferences.custom_hud.add_disabled.description"}', disabledHoverText: '{"translate": "fetchr.preferences.custom_hud.add_disabled.disabled"}', clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 6"}}'}
data modify storage fetchr:registries preferences.custom_hud append value {id: "fetchr:custom_hud/adjust_col0", textComponent: '{"translate": "fetchr.preferences.custom_hud.adjust_col0.title"}', hoverText: '{"translate": "fetchr.preferences.custom_hud.adjust_col.description"}', disabledHoverText: '{"translate": "fetchr.preferences.custom_hud.adjust_col.disabled"}', clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 9"}}'}
data modify storage fetchr:registries preferences.custom_hud append value {id: "fetchr:custom_hud/adjust_col1", textComponent: '{"translate": "fetchr.preferences.custom_hud.adjust_col1.title"}', hoverText: '{"translate": "fetchr.preferences.custom_hud.adjust_col.description"}', disabledHoverText: '{"translate": "fetchr.preferences.custom_hud.adjust_col.disabled"}', clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 10"}}'}
data modify storage fetchr:registries preferences.custom_hud append value {id: "fetchr:custom_hud/adjust_card", textComponent: '{"translate": "fetchr.preferences.custom_hud.adjust_card.title"}', hoverText: '{"translate": "fetchr.preferences.custom_hud.adjust_card.description"}', clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 11"}}'}
data modify storage fetchr:registries preferences.adjust_card append value {id: "fetchr:custom_hud/adjust_card/left_of_hotbar", textComponent: '{"translate": "fetchr.preferences.custom_hud.adjust_card.left_of_hotbar.title"}', hoverText: '{"translate": "fetchr.preferences.custom_hud.adjust_card.left_of_hotbar.description"}', clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 67"}}'}
data modify storage fetchr:registries preferences.adjust_card append value {id: "fetchr:custom_hud/adjust_card/right_of_hotbar_no_attack", textComponent: '{"translate": "fetchr.preferences.custom_hud.adjust_card.right_of_hotbar_no_attack.title"}', hoverText: '{"translate": "fetchr.preferences.custom_hud.adjust_card.right_of_hotbar_no_attack.description"}', clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 68"}}'}
data modify storage fetchr:registries preferences.adjust_card append value {id: "fetchr:custom_hud/adjust_card/right_of_hotbar_with_attack", textComponent: '{"translate": "fetchr.preferences.custom_hud.adjust_card.right_of_hotbar_with_attack.title"}', hoverText: '{"translate": "fetchr.preferences.custom_hud.adjust_card.right_of_hotbar_with_attack.description"}', clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 69"}}'}
