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
# in arbitary order after having been processed,\
	meaning that if a new category
# is added which is not in the fetchr:default tag and some vanilla Fetchr items
# are added to it,\
	existing seeds might shuffle without the item pool or active
# categories actually changing.
#
# Probably should just keep the order of initial definition

# categories
data modify storage fetchr:registries categories append value {\
	id: "fetchr:apple",\
	name: '{"translate": "fetchr.category.apple"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:amethyst",\
	name: '{"translate": "fetchr.category.amethyst"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:basic_iron",\
	name: '{"translate": "fetchr.category.basic_iron"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:bow",\
	name: '{"translate": "fetchr.category.bow"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:cactus",\
	name: '{"translate": "fetchr.category.cactus"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:cherry_grove",\
	name: '{"translate": "fetchr.category.cherry_grove"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:clay",\
	name: '{"translate": "fetchr.category.clay"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:copper",\
	name: '{"translate": "fetchr.category.copper"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:chest_iron",\
	name: '{"translate": "fetchr.category.chest_iron"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:compass",\
	name: '{"translate": "fetchr.category.compass"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:deepslate",\
	name: '{"translate": "fetchr.category.deepslate"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:diamond",\
	name: '{"translate": "fetchr.category.diamond"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:dripstone_cave",\
	name: '{"translate": "fetchr.category.dripstone_cave"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:egg",\
	name: '{"translate": "fetchr.category.egg"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:nighttime_mob_drops",\
	name: '{"translate": "fetchr.category.nighttime_mob_drops"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:fish",\
	name: '{"translate": "fetchr.category.fish"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:flint",\
	name: '{"translate": "fetchr.category.flint"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:furnace",\
	name: '{"translate": "fetchr.category.furnace"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:glow_ink",\
	name: '{"translate": "fetchr.category.glow_ink"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:gold_and_ruined_portal",\
	name: '{"translate": "fetchr.category.gold_and_ruined_portal"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:gunpowder",\
	name: '{"translate": "fetchr.category.gunpowder"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:ink",\
	name: '{"translate": "fetchr.category.ink"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:jungle",\
	name: '{"translate": "fetchr.category.jungle"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:kelp",\
	name: '{"translate": "fetchr.category.kelp"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:lapis",\
	name: '{"translate": "fetchr.category.lapis"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:leather",\
	name: '{"translate": "fetchr.category.leather"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:lime",\
	name: '{"translate": "fetchr.category.lime"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:lush_cave",\
	name: '{"translate": "fetchr.category.lush_cave"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:milk",\
	name: '{"translate": "fetchr.category.milk"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:mud",\
	name: '{"translate": "fetchr.category.mud"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:mushroom",\
	name: '{"translate": "fetchr.category.mushroom"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:piston",\
	name: '{"translate": "fetchr.category.piston"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:pumpkin",\
	name: '{"translate": "fetchr.category.pumpkin"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:rabbit",\
	name: '{"translate": "fetchr.category.rabbit"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:rail",\
	name: '{"translate": "fetchr.category.rail"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:redstone",\
	name: '{"translate": "fetchr.category.redstone"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:sand",\
	name: '{"translate": "fetchr.category.sand"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:sapling",\
	name: '{"translate": "fetchr.category.sapling"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:shearable",\
	name: '{"translate": "fetchr.category.shearable"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:shipwreck",\
	name: '{"translate": "fetchr.category.shipwreck"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:skeleton_drops",\
	name: '{"translate": "fetchr.category.skeleton_drops"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:snow",\
	name: '{"translate": "fetchr.category.snow"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:spider",\
	name: '{"translate": "fetchr.category.spider"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:taiga",\
	name: '{"translate": "fetchr.category.taiga"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:wheat",\
	name: '{"translate": "fetchr.category.wheat"}',\
	tags: ["fetchr:default"]\
}
data modify storage fetchr:registries categories append value {\
	id: "fetchr:wool",\
	name: '{"translate": "fetchr.category.wool"}',\
	tags: ["fetchr:default"]\
}

# items

## 0001: pumpkin_seeds
data modify storage fetchr:registries items append value {\
	id: "fetchr:pumpkin_seeds",\
	item: {id: "minecraft:pumpkin_seeds"},\
	translation: "item.minecraft.pumpkin_seeds",\
	icon: "0001",\
	categories: ["fetchr:pumpkin"]\
}

## 0002: pumpkin_pie
data modify storage fetchr:registries items append value {\
	id: "fetchr:pumpkin_pie",\
	item: {id: "minecraft:pumpkin_pie"},\
	translation: "item.minecraft.pumpkin_pie",\
	icon: "0002",\
	categories: ["fetchr:pumpkin", "fetchr:egg"]\
}

## 0003: egg
data modify storage fetchr:registries items append value {\
	id: "fetchr:egg",\
	item: {id: "minecraft:egg"},\
	translation: "item.minecraft.egg",\
	icon: "0003",\
	categories: ["fetchr:egg"]\
}

## 0004: cake
data modify storage fetchr:registries items append value {\
	id: "fetchr:cake",\
	item: {id: "minecraft:cake"},\
	translation: "block.minecraft.cake",\
	icon: "0004",\
	categories: ["fetchr:egg", "fetchr:milk"]\
}

## 0005: acacia_sapling
data modify storage fetchr:registries items append value {\
	id: "fetchr:acacia_sapling",\
	item: {id: "minecraft:acacia_sapling"},\
	translation: "block.minecraft.acacia_sapling",\
	icon: "0005",\
	categories: ["fetchr:sapling"]\
}

## 0006: spruce_sapling
data modify storage fetchr:registries items append value {\
	id: "fetchr:spruce_sapling",\
	item: {id: "minecraft:spruce_sapling"},\
	translation: "block.minecraft.spruce_sapling",\
	icon: "0006",\
	categories: ["fetchr:sapling"]\
}

## 0007: cocoa_beans
data modify storage fetchr:registries items append value {\
	id: "fetchr:cocoa_beans",\
	item: {id: "minecraft:cocoa_beans"},\
	translation: "item.minecraft.cocoa_beans",\
	icon: "0007",\
	categories: ["fetchr:jungle"],\
	weight: 3\
}

## 0008: cookie
data modify storage fetchr:registries items append value {\
	id: "fetchr:cookie",\
	item: {id: "minecraft:cookie"},\
	translation: "item.minecraft.cookie",\
	icon: "0008",\
	categories: ["fetchr:jungle"],\
	weight: 3\
}

## 0009: melon_slice
data modify storage fetchr:registries items append value {\
	id: "fetchr:melon_slice",\
	item: {id: "minecraft:melon_slice"},\
	translation: "item.minecraft.melon_slice",\
	icon: "0009",\
	categories: ["fetchr:jungle"],\
	weight: 2\
}

## 000a: glistering_melon_slice
data modify storage fetchr:registries items append value {\
	id: "fetchr:glistering_melon_slice",\
	item: {id: "minecraft:glistering_melon_slice"},\
	translation: "item.minecraft.glistering_melon_slice",\
	icon: "000a",\
	categories: ["fetchr:jungle"],\
	weight: 2\
}

## 000b: dead_bush
data modify storage fetchr:registries items append value {\
	id: "fetchr:dead_bush",\
	item: {id: "minecraft:dead_bush"},\
	translation: "block.minecraft.dead_bush",\
	icon: "000b",\
	categories: ["fetchr:shearable"],\
	weight: 2\
}

## 000c: fern
data modify storage fetchr:registries items append value {\
	id: "fetchr:fern",\
	item: {id: "minecraft:fern"},\
	translation: "block.minecraft.fern",\
	icon: "000c",\
	categories: [{id: "fetchr:shearable", weight: 2}, {id: "fetchr:taiga"}]\
}

## 000d: vine
data modify storage fetchr:registries items append value {\
	id: "fetchr:vine",\
	item: {id: "minecraft:vine"},\
	translation: "block.minecraft.vine",\
	icon: "000d",\
	categories: ["fetchr:shearable"]\
}

## 000e: rail
data modify storage fetchr:registries items append value {\
	id: "fetchr:rail",\
	item: {id: "minecraft:rail"},\
	translation: "block.minecraft.rail",\
	icon: "000e",\
	categories: ["fetchr:rail"]\
}

## 000f: powered_rail
data modify storage fetchr:registries items append value {\
	id: "fetchr:powered_rail",\
	item: {id: "minecraft:powered_rail"},\
	translation: "block.minecraft.powered_rail",\
	icon: "000f",\
	categories: ["fetchr:gold_and_ruined_portal"],\
	weight: 5\
}

## 0010: flint
data modify storage fetchr:registries items append value {\
	id: "fetchr:flint",\
	item: {id: "minecraft:flint"},\
	translation: "item.minecraft.flint",\
	icon: "0010",\
	categories: ["fetchr:flint"]\
}

## 0011: flint_and_steel
data modify storage fetchr:registries items append value {\
	id: "fetchr:flint_and_steel",\
	item: {id: "minecraft:flint_and_steel"},\
	translation: "item.minecraft.flint_and_steel",\
	icon: "0011",\
	categories: ["fetchr:flint"]\
}

## 0012: arrow
data modify storage fetchr:registries items append value {\
	id: "fetchr:arrow",\
	item: {id: "minecraft:arrow"},\
	translation: "item.minecraft.arrow",\
	icon: "0012",\
	categories: ["fetchr:skeleton_drops"]\
}

## 0013: ender_pearl
data modify storage fetchr:registries items append value {\
	id: "fetchr:ender_pearl",\
	item: {id: "minecraft:ender_pearl"},\
	translation: "item.minecraft.ender_pearl",\
	icon: "0013",\
	categories: ["fetchr:nighttime_mob_drops"],\
	weight: 3\
}

## 0014: slime_ball
data modify storage fetchr:registries items append value {\
	id: "fetchr:slime_ball",\
	item: {id: "minecraft:slime_ball"},\
	translation: "item.minecraft.slime_ball",\
	icon: "0014",\
	categories: ["fetchr:nighttime_mob_drops"]\
}

## 0015: firework_rocket
data modify storage fetchr:registries items append value {\
	id: "fetchr:firework_rocket",\
	item: {id: "minecraft:firework_rocket"},\
	translation: "item.minecraft.firework_rocket",\
	icon: "0015",\
	categories: ["fetchr:gunpowder"],\
	weight: 2\
}

## 0016: milk_bucket
data modify storage fetchr:registries items append value {\
	id: "fetchr:milk_bucket",\
	item: {id: "minecraft:milk_bucket"},\
	translation: "item.minecraft.milk_bucket",\
	icon: "0016",\
	categories: ["fetchr:milk"]\
}

## 0017: cauldron
data modify storage fetchr:registries items append value {\
	id: "fetchr:cauldron",\
	item: {id: "minecraft:cauldron"},\
	translation: "block.minecraft.cauldron",\
	icon: "0017",\
	categories: ["fetchr:basic_iron"]\
}

## 001a: painting
data modify storage fetchr:registries items append value {\
	id: "fetchr:painting",\
	item: {id: "minecraft:painting"},\
	translation: "item.minecraft.painting",\
	icon: "001a",\
	categories: ["fetchr:wool"]\
}

## 001b: item_frame
data modify storage fetchr:registries items append value {\
	id: "fetchr:item_frame",\
	item: {id: "minecraft:item_frame"},\
	translation: "item.minecraft.item_frame",\
	icon: "001b",\
	categories: ["fetchr:leather"],\
	weight: 2\
}

## 001c: emerald
data modify storage fetchr:registries items append value {\
	id: "fetchr:emerald",\
	item: {id: "minecraft:emerald"},\
	translation: "item.minecraft.emerald",\
	icon: "001c",\
	categories: ["fetchr:shipwreck"]\
}

## 001d: diamond_shovel
data modify storage fetchr:registries items append value {\
	id: "fetchr:diamond_shovel",\
	item: {id: "minecraft:diamond_shovel"},\
	translation: "item.minecraft.diamond_shovel",\
	icon: "001d",\
	categories: ["fetchr:diamond"],\
	weight: 2\
}

## 001e: diamond_hoe
data modify storage fetchr:registries items append value {\
	id: "fetchr:diamond_hoe",\
	item: {id: "minecraft:diamond_hoe"},\
	translation: "item.minecraft.diamond_hoe",\
	icon: "001e",\
	categories: ["fetchr:diamond"],\
	weight: 2\
}

## 001f: diamond_axe
data modify storage fetchr:registries items append value {\
	id: "fetchr:diamond_axe",\
	item: {id: "minecraft:diamond_axe"},\
	translation: "item.minecraft.diamond_axe",\
	icon: "001f",\
	categories: ["fetchr:diamond"],\
	weight: 2\
}

## 0020: axolotl_bucket
data modify storage fetchr:registries items append value {\
	id: "fetchr:axolotl_bucket",\
	item: {id: "minecraft:axolotl_bucket"},\
	translation: "item.minecraft.axolotl_bucket",\
	icon: "0020",\
	categories: ["fetchr:lush_cave"],\
	weight: 3\
}

## 0021: flower_pot
data modify storage fetchr:registries items append value {\
	id: "fetchr:flower_pot",\
	item: {id: "minecraft:flower_pot"},\
	translation: "block.minecraft.flower_pot",\
	icon: "0021",\
	categories: ["fetchr:clay"]\
}

## 0022: brick
data modify storage fetchr:registries items append value {\
	id: "fetchr:brick",\
	item: {id: "minecraft:brick"},\
	translation: "item.minecraft.brick",\
	icon: "0022",\
	categories: ["fetchr:clay"]\
}

## 0023: mushroom_stew
data modify storage fetchr:registries items append value {\
	id: "fetchr:mushroom_stew",\
	item: {id: "minecraft:mushroom_stew"},\
	translation: "item.minecraft.mushroom_stew",\
	icon: "0023",\
	categories: ["fetchr:mushroom"]\
}

## 0024: mangrove_propagule
data modify storage fetchr:registries items append value {\
	id: "fetchr:mangrove_propagule",\
	item: {id: "minecraft:mangrove_propagule"},\
	translation: "block.minecraft.mangrove_propagule",\
	icon: "0024",\
	categories: ["fetchr:sapling"]\
}

## 0025: apple
data modify storage fetchr:registries items append value {\
	id: "fetchr:apple",\
	item: {id: "minecraft:apple"},\
	translation: "item.minecraft.apple",\
	icon: "0025",\
	categories: ["fetchr:apple"]\
}

## 0026: golden_apple
data modify storage fetchr:registries items append value {\
	id: "fetchr:golden_apple",\
	item: {id: "minecraft:golden_apple"},\
	translation: "item.minecraft.golden_apple",\
	icon: "0026",\
	categories: ["fetchr:apple"]\
}

## 0027: golden_shovel
data modify storage fetchr:registries items append value {\
	id: "fetchr:golden_shovel",\
	item: {id: "minecraft:golden_shovel"},\
	translation: "item.minecraft.golden_shovel",\
	icon: "0027",\
	categories: ["fetchr:gold_and_ruined_portal"],\
	weight: 2\
}

## 0028: golden_sword
data modify storage fetchr:registries items append value {\
	id: "fetchr:golden_sword",\
	item: {id: "minecraft:golden_sword"},\
	translation: "item.minecraft.golden_sword",\
	icon: "0028",\
	categories: ["fetchr:gold_and_ruined_portal"],\
	weight: 2\
}

## 0029: clock
data modify storage fetchr:registries items append value {\
	id: "fetchr:clock",\
	item: {id: "minecraft:clock"},\
	translation: "item.minecraft.clock",\
	icon: "0029",\
	categories: ["fetchr:gold_and_ruined_portal"],\
	weight: 5\
}

## 002a: repeater
data modify storage fetchr:registries items append value {\
	id: "fetchr:repeater",\
	item: {id: "minecraft:repeater"},\
	translation: "block.minecraft.repeater",\
	icon: "002a",\
	categories: ["fetchr:redstone"]\
}

## 002b: compass
data modify storage fetchr:registries items append value {\
	id: "fetchr:compass",\
	item: {id: "minecraft:compass"},\
	translation: "item.minecraft.compass",\
	icon: "002b",\
	categories: ["fetchr:compass"]\
}

## 002c: map
data modify storage fetchr:registries items append value {\
	id: "fetchr:map",\
	item: {id: "minecraft:map"},\
	translation: "item.minecraft.map",\
	icon: "002c",\
	categories: ["fetchr:compass"]\
}

## 002d: book
data modify storage fetchr:registries items append value {\
	id: "fetchr:book",\
	item: {id: "minecraft:book"},\
	translation: "item.minecraft.book",\
	icon: "002d",\
	categories: ["fetchr:leather"]\
}

## 002e: writable_book
data modify storage fetchr:registries items append value {\
	id: "fetchr:writable_book",\
	item: {id: "minecraft:writable_book"},\
	translation: "item.minecraft.writable_book",\
	icon: "002e",\
	categories: ["fetchr:leather"]\
}

## 002f: enchanted_book
data modify storage fetchr:registries items append value {\
	id: "fetchr:enchanted_book",\
	item: {id: "minecraft:enchanted_book"},\
	translation: "item.minecraft.enchanted_book",\
	icon: "002f",\
	categories: ["fetchr:diamond"],\
	weight: 5\
}

## 0030: spider_eye
data modify storage fetchr:registries items append value {\
	id: "fetchr:spider_eye",\
	item: {id: "minecraft:spider_eye"},\
	translation: "item.minecraft.spider_eye",\
	icon: "0030",\
	categories: ["fetchr:spider"]\
}

## 0031: fermented_spider_eye
data modify storage fetchr:registries items append value {\
	id: "fetchr:fermented_spider_eye",\
	item: {id: "minecraft:fermented_spider_eye"},\
	translation: "item.minecraft.fermented_spider_eye",\
	icon: "0031",\
	categories: ["fetchr:spider"]\
}

## 0032: gunpowder
data modify storage fetchr:registries items append value {\
	id: "fetchr:gunpowder",\
	item: {id: "minecraft:gunpowder"},\
	translation: "item.minecraft.gunpowder",\
	icon: "0032",\
	categories: ["fetchr:gunpowder"],\
	weight: 2\
}

## 0033: tnt_minecart
data modify storage fetchr:registries items append value {\
	id: "fetchr:tnt_minecart",\
	item: {id: "minecraft:tnt_minecart"},\
	translation: "item.minecraft.tnt_minecart",\
	icon: "0033",\
	categories: ["fetchr:gunpowder", "fetchr:sand"]\
}

## 0034: hopper
data modify storage fetchr:registries items append value {\
	id: "fetchr:hopper",\
	item: {id: "minecraft:hopper"},\
	translation: "block.minecraft.hopper",\
	icon: "0034",\
	categories: ["fetchr:chest_iron"]\
}

## 0035: hopper_minecart
data modify storage fetchr:registries items append value {\
	id: "fetchr:hopper_minecart",\
	item: {id: "minecraft:hopper_minecart"},\
	translation: "item.minecraft.hopper_minecart",\
	icon: "0035",\
	categories: ["fetchr:chest_iron"]\
}

## 0036: furnace_minecart
data modify storage fetchr:registries items append value {\
	id: "fetchr:furnace_minecart",\
	item: {id: "minecraft:furnace_minecart"},\
	translation: "item.minecraft.furnace_minecart",\
	icon: "0036",\
	categories: ["fetchr:furnace"]\
}

## 0037: chest_minecart
data modify storage fetchr:registries items append value {\
	id: "fetchr:chest_minecart",\
	item: {id: "minecraft:chest_minecart"},\
	translation: "item.minecraft.chest_minecart",\
	icon: "0037",\
	categories: ["fetchr:chest_iron"]\
}

## 0038: bone
data modify storage fetchr:registries items append value {\
	id: "fetchr:bone",\
	item: {id: "minecraft:bone"},\
	translation: "item.minecraft.bone",\
	icon: "0038",\
	categories: ["fetchr:skeleton_drops"]\
}

## 0039: ink_sac
data modify storage fetchr:registries items append value {\
	id: "fetchr:ink_sac",\
	item: {id: "minecraft:ink_sac"},\
	translation: "item.minecraft.ink_sac",\
	icon: "0039",\
	categories: ["fetchr:ink"]\
}

## 003a: gray_dye
data modify storage fetchr:registries items append value {\
	id: "fetchr:gray_dye",\
	item: {id: "minecraft:gray_dye"},\
	translation: "item.minecraft.gray_dye",\
	icon: "003a",\
	categories: ["fetchr:ink"]\
}

## 003b: green_dye
data modify storage fetchr:registries items append value {\
	id: "fetchr:lime_dye",\
	item: {id: "minecraft:green_dye"},\
	translation: "item.minecraft.green_dye",\
	icon: "003b",\
	categories: ["fetchr:cactus"]\
}

## 003c: lime_dye
data modify storage fetchr:registries items append value {\
	id: "fetchr:lime_dye",\
	item: {id: "minecraft:lime_dye"},\
	translation: "item.minecraft.lime_dye",\
	icon: "003c",\
	categories: ["fetchr:cactus", "fetchr:lime"]\
}

## 003d: lapis_lazuli
data modify storage fetchr:registries items append value {\
	id: "fetchr:lapis_lazuli",\
	item: {id: "minecraft:lapis_lazuli"},\
	translation: "item.minecraft.lapis_lazuli",\
	icon: "003d",\
	categories: ["fetchr:lapis"]\
}

## 003e: cyan_dye
data modify storage fetchr:registries items append value {\
	id: "fetchr:cyan_dye",\
	item: {id: "minecraft:cyan_dye"},\
	translation: "item.minecraft.cyan_dye",\
	icon: "003e",\
	categories: ["fetchr:lapis"],\
	weight: 2\
}

## 003f: purple_dye
data modify storage fetchr:registries items append value {\
	id: "fetchr:purple_dye",\
	item: {id: "minecraft:purple_dye"},\
	translation: "item.minecraft.purple_dye",\
	icon: "003f",\
	categories: ["fetchr:lapis"],\
	weight: 2\
}

## 0040: suspicious_stew
data modify storage fetchr:registries items append value {\
	id: "fetchr:suspicious_stew",\
	item: {id: "minecraft:suspicious_stew"},\
	translation: "item.minecraft.suspicious_stew",\
	icon: "0040",\
	categories: ["fetchr:mushroom"]\
}

## 0041: glass_bottle
data modify storage fetchr:registries items append value {\
	id: "fetchr:glass_bottle",\
	item: {id: "minecraft:glass_bottle"},\
	translation: "item.minecraft.glass_bottle",\
	icon: "0041",\
	categories: ["fetchr:sand"],\
	weight: 2\
}

## 0042: cod
data modify storage fetchr:registries items append value {\
	id: "fetchr:cod",\
	item: {id: "minecraft:cod"},\
	translation: "item.minecraft.cod",\
	icon: "0042",\
	categories: ["fetchr:fish"]\
}

## 0043: cod_bucket
data modify storage fetchr:registries items append value {\
	id: "fetchr:cod_bucket",\
	item: {id: "minecraft:cod_bucket"},\
	translation: "item.minecraft.cod_bucket",\
	icon: "0043",\
	categories: ["fetchr:fish"]\
}

## 0044: salmon
data modify storage fetchr:registries items append value {\
	id: "fetchr:salmon",\
	item: {id: "minecraft:salmon"},\
	translation: "item.minecraft.salmon",\
	icon: "0044",\
	categories: ["fetchr:fish"]\
}

## 0045: salmon_bucket
data modify storage fetchr:registries items append value {\
	id: "fetchr:salmon_bucket",\
	item: {id: "minecraft:salmon_bucket"},\
	translation: "item.minecraft.salmon_bucket",\
	icon: "0045",\
	categories: ["fetchr:fish"]\
}

## 0046: tropical_fish
data modify storage fetchr:registries items append value {\
	id: "fetchr:tropical_fish",\
	item: {id: "minecraft:tropical_fish"},\
	translation: "item.minecraft.tropical_fish",\
	icon: "0046",\
	categories: ["fetchr:fish"]\
}

## 0047: tropical_fish_bucket
data modify storage fetchr:registries items append value {\
	id: "fetchr:tropical_fish_bucket",\
	item: {id: "minecraft:tropical_fish_bucket"},\
	translation: "item.minecraft.tropical_fish_bucket",\
	icon: "0047",\
	categories: ["fetchr:fish"]\
}

## 0048: birch_sapling
data modify storage fetchr:registries items append value {\
	id: "fetchr:birch_sapling",\
	item: {id: "minecraft:birch_sapling"},\
	translation: "block.minecraft.birch_sapling",\
	icon: "0048",\
	categories: ["fetchr:sapling"]\
}

## 0049: dark_oak_sapling
data modify storage fetchr:registries items append value {\
	id: "fetchr:dark_oak_sapling",\
	item: {id: "minecraft:dark_oak_sapling"},\
	translation: "block.minecraft.dark_oak_sapling",\
	icon: "0049",\
	categories: ["fetchr:sapling"]\
}

## 004a: lead
data modify storage fetchr:registries items append value {\
	id: "fetchr:lead",\
	item: {id: "minecraft:lead"},\
	translation: "item.minecraft.lead",\
	icon: "004a",\
	categories: ["fetchr:nighttime_mob_drops"]\
}

## 004b: detector_rail
data modify storage fetchr:registries items append value {\
	id: "fetchr:detector_rail",\
	item: {id: "minecraft:detector_rail"},\
	translation: "block.minecraft.detector_rail",\
	icon: "004b",\
	categories: ["fetchr:rail"]\
}

## 004c: activator_rail
data modify storage fetchr:registries items append value {\
	id: "fetchr:activator_rail",\
	item: {id: "minecraft:activator_rail"},\
	translation: "block.minecraft.activator_rail",\
	icon: "004c",\
	categories: ["fetchr:rail"]\
}

## 004d: heart_of_the_sea
data modify storage fetchr:registries items append value {\
	id: "fetchr:heart_of_the_sea",\
	item: {id: "minecraft:heart_of_the_sea"},\
	translation: "item.minecraft.heart_of_the_sea",\
	icon: "004d",\
	categories: ["fetchr:shipwreck"]\
}

## 004e: glow_berries
data modify storage fetchr:registries items append value {\
	id: "fetchr:glow_berries",\
	item: {id: "minecraft:glow_berries"},\
	translation: "item.minecraft.glow_berries",\
	icon: "004e",\
	categories: ["fetchr:lush_cave"],\
	weight: 3\
}

## 004f: sweet_berries
data modify storage fetchr:registries items append value {\
	id: "fetchr:sweet_berries",\
	item: {id: "minecraft:sweet_berries"},\
	translation: "item.minecraft.sweet_berries",\
	icon: "004f",\
	categories: ["fetchr:taiga"]\
}

## 0050: diamond_sword
data modify storage fetchr:registries items append value {\
	id: "fetchr:diamond_sword",\
	item: {id: "minecraft:diamond_sword"},\
	translation: "item.minecraft.diamond_sword",\
	icon: "0050",\
	categories: ["fetchr:diamond"],\
	weight: 2\
}

## 0051: diamond_pickaxe
data modify storage fetchr:registries items append value {\
	id: "fetchr:diamond_pickaxe",\
	item: {id: "minecraft:diamond_pickaxe"},\
	translation: "item.minecraft.diamond_pickaxe",\
	icon: "0051",\
	categories: ["fetchr:diamond"],\
	weight: 2\
}

## 0052: golden_axe
data modify storage fetchr:registries items append value {\
	id: "fetchr:golden_axe",\
	item: {id: "minecraft:golden_axe"},\
	translation: "item.minecraft.golden_axe",\
	icon: "0052",\
	categories: ["fetchr:gold_and_ruined_portal"],\
	weight: 2\
}

## 0053: golden_pickaxe
data modify storage fetchr:registries items append value {\
	id: "fetchr:golden_pickaxe",\
	item: {id: "minecraft:golden_pickaxe"},\
	translation: "item.minecraft.golden_pickaxe",\
	icon: "0053",\
	categories: ["fetchr:gold_and_ruined_portal"],\
	weight: 2\
}

## 0054: golden_hoe
data modify storage fetchr:registries items append value {\
	id: "fetchr:golden_hoe",\
	item: {id: "minecraft:golden_hoe"},\
	translation: "item.minecraft.golden_hoe",\
	icon: "0054",\
	categories: ["fetchr:gold_and_ruined_portal"],\
	weight: 2\
}

## 0055: crossbow
data modify storage fetchr:registries items append value {\
	id: "fetchr:crossbow",\
	item: {id: "minecraft:crossbow"},\
	translation: "item.minecraft.crossbow",\
	icon: "0055",\
	categories: ["fetchr:bow"]\
}

## 0056: bamboo
data modify storage fetchr:registries items append value {\
	id: "fetchr:bamboo",\
	item: {id: "minecraft:bamboo"},\
	translation: "block.minecraft.bamboo",\
	icon: "0056",\
	categories: ["fetchr:jungle"],\
	weight: 3\
}

## 0057: sea_pickle
data modify storage fetchr:registries items append value {\
	id: "fetchr:sea_pickle",\
	item: {id: "minecraft:sea_pickle"},\
	translation: "block.minecraft.sea_pickle",\
	icon: "0057",\
	categories: ["fetchr:lime"]\
}

## 0058: seagrass
data modify storage fetchr:registries items append value {\
	id: "fetchr:seagrass",\
	item: {id: "minecraft:seagrass"},\
	translation: "block.minecraft.seagrass",\
	icon: "0058",\
	categories: ["fetchr:shearable"],\
	weight: 2\
}

## 0059: rabbit_hide
data modify storage fetchr:registries items append value {\
	id: "fetchr:rabbit_hide",\
	item: {id: "minecraft:rabbit_hide"},\
	translation: "item.minecraft.rabbit_hide",\
	icon: "0059",\
	categories: ["fetchr:rabbit"]\
}

## 005a: cooked_rabbit
data modify storage fetchr:registries items append value {\
	id: "fetchr:cooked_rabbit",\
	item: {id: "minecraft:cooked_rabbit"},\
	translation: "item.minecraft.cooked_rabbit",\
	icon: "005a",\
	categories: ["fetchr:rabbit"]\
}

## 005b: dried_kelp
data modify storage fetchr:registries items append value {\
	id: "fetchr:dried_kelp",\
	item: {id: "minecraft:dried_kelp"},\
	translation: "item.minecraft.dried_kelp",\
	icon: "005b",\
	categories: ["fetchr:kelp"]\
}

## 005c: slowness_arrow
data modify storage fetchr:registries items append value {\
	id: "fetchr:slowness_arrow",\
	item: {\
		id: "minecraft:tipped_arrow",\
		components: {"minecraft:potion_contents": {potion: "minecraft:slowness"}}\
	},\
	translation: "item.minecraft.tipped_arrow.effect.slowness",\
	icon: "005c",\
	categories: [{id: "fetchr:skeleton_drops"}, {id: "fetchr:nighttime_mob_drops", weight: 3}]\
}

## 005d: glow_ink_sac
data modify storage fetchr:registries items append value {\
	id: "fetchr:glow_ink_sac",\
	item: {id: "minecraft:glow_ink_sac"},\
	translation: "item.minecraft.glow_ink_sac",\
	icon: "005d",\
	categories: ["fetchr:glow_ink"]\
}

## 005e: glow_item_frame
data modify storage fetchr:registries items append value {\
	id: "fetchr:glow_item_frame",\
	item: {id: "minecraft:glow_item_frame"},\
	translation: "item.minecraft.glow_item_frame",\
	icon: "005e",\
	categories: [{id: "fetchr:glow_ink"}, {id: "fetchr:leather", weight: 2}]\
}

## 005f: pointed_dripstone
data modify storage fetchr:registries items append value {\
	id: "fetchr:pointed_dripstone",\
	item: {id: "minecraft:pointed_dripstone"},\
	translation: "block.minecraft.pointed_dripstone",\
	icon: "005f",\
	categories: ["fetchr:dripstone_cave"]\
}

## 0060: hanging_roots
data modify storage fetchr:registries items append value {\
	id: "fetchr:hanging_roots",\
	item: {id: "minecraft:hanging_roots"},\
	translation: "block.minecraft.hanging_roots",\
	icon: "0060",\
	categories: ["fetchr:lush_cave"]\
}

## 0061: glow_lichen
data modify storage fetchr:registries items append value {\
	id: "fetchr:glow_lichen",\
	item: {id: "minecraft:glow_lichen"},\
	translation: "block.minecraft.glow_lichen",\
	icon: "0061",\
	categories: ["fetchr:shearable"],\
	weight: 2\
}

## 0062: amethyst_shard
data modify storage fetchr:registries items append value {\
	id: "fetchr:amethyst_shard",\
	item: {id: "minecraft:amethyst_shard"},\
	translation: "item.minecraft.amethyst_shard",\
	icon: "0062",\
	categories: ["fetchr:amethyst"]\
}

## 0063: spyglass
data modify storage fetchr:registries items append value {\
	id: "fetchr:spyglass",\
	item: {id: "minecraft:spyglass"},\
	translation: "item.minecraft.spyglass",\
	icon: "0063",\
	categories: ["fetchr:amethyst"]\
}

## 0064: blue_trimmed_leather_boots
data modify storage fetchr:registries items append value {\
	id: "fetchr:blue_trimmed_leather_boots",\
	item: {\
		id: "minecraft:leather_boots",\
		components: {\
			"minecraft:trim": {\
				pattern: "minecraft:shaper",\
				material: "minecraft:lapis",\
				show_in_tooltip: false\
			},\
			"minecraft:lore": [\
				'{"translate": "item.minecraft.smithing_template.upgrade", "color": "gray", "italic": false}',\
				'[" ", {"translate": "fetchr.item.description.any_trim", "color": "#406d95", "italic": false}]',\
				'[" ", {"translate": "trim_material.minecraft.lapis", "color": "#406d95", "italic": false}]'\
			]\
		}\
	},\
	item_tests: [{ type: "fetchr:predicate", id: "minecraft:trim", predicate: {material: "minecraft:lapis" }}],\
	translation: "fetchr.item.blue_trimmed_leather_boots",\
	icon: "0064",\
	categories: ["fetchr:shipwreck"]\
}

## 0065: hanging_acacia_sign
data modify storage fetchr:registries items append value {\
	id: "fetchr:hanging_acacia_sign",\
	item: {id: "minecraft:acacia_hanging_sign"},\
	translation: "block.minecraft.acacia_hanging_sign",\
	icon: "0065",\
	categories: ["fetchr:basic_iron"],\
	weight: 3\
}

## 0066: brush
data modify storage fetchr:registries items append value {\
	id: "fetchr:brush",\
	item: {id: "minecraft:brush"},\
	translation: "item.minecraft.brush",\
	icon: "0066",\
	categories: ["fetchr:copper"],\
	weight: 3\
}

## 0067: cherry_chest_boat
data modify storage fetchr:registries items append value {\
	id: "fetchr:cherry_chest_boat",\
	item: {id: "minecraft:cherry_chest_boat"},\
	translation: "item.minecraft.cherry_chest_boat",\
	icon: "0067",\
	categories: ["fetchr:cherry_grove"]\
}

## 0068: pink_petals
data modify storage fetchr:registries items append value {\
	id: "fetchr:pink_petals",\
	item: {id: "minecraft:pink_petals"},\
	translation: "block.minecraft.pink_petals",\
	icon: "0068",\
	categories: ["fetchr:cherry_grove"]\
}

## 0069: cherry_sapling
data modify storage fetchr:registries items append value {\
	id: "fetchr:cherry_sapling",\
	item: {id: "minecraft:cherry_sapling"},\
	translation: "block.minecraft.cherry_sapling",\
	icon: "0069",\
	categories: ["fetchr:cherry_grove"]\
}

## 0100: iron_block
data modify storage fetchr:registries items append value {\
	id: "fetchr:iron_block",\
	item: {id: "minecraft:iron_block"},\
	translation: "block.minecraft.iron_block",\
	icon: "0100",\
	categories: ["fetchr:basic_iron"]\
}

## 0101: redstone_block
data modify storage fetchr:registries items append value {\
	id: "fetchr:redstone_block",\
	item: {id: "minecraft:redstone_block"},\
	translation: "block.minecraft.redstone_block",\
	icon: "0101",\
	categories: ["fetchr:redstone"]\
}

## 0102: bookshelf
data modify storage fetchr:registries items append value {\
	id: "fetchr:bookshelf",\
	item: {id: "minecraft:bookshelf"},\
	translation: "block.minecraft.bookshelf",\
	icon: "0102",\
	categories: ["fetchr:leather"]\
}

## 0103: obsidian
data modify storage fetchr:registries items append value {\
	id: "fetchr:obsidian",\
	item: {id: "minecraft:obsidian"},\
	translation: "block.minecraft.obsidian",\
	icon: "0103",\
	categories: ["fetchr:diamond"],\
	weight: 5\
}

## 0104: melon
data modify storage fetchr:registries items append value {\
	id: "fetchr:melon",\
	item: {id: "minecraft:melon"},\
	translation: "block.minecraft.melon",\
	icon: "0104",\
	categories: ["fetchr:jungle"],\
	weight: 2\
}

## 0105: mossy_stone_bricks
data modify storage fetchr:registries items append value {\
	id: "fetchr:mossy_stone_bricks",\
	item: {id: "minecraft:mossy_stone_bricks"},\
	translation: "block.minecraft.mossy_stone_bricks",\
	icon: "0105",\
	categories: ["fetchr:shearable"]\
}

## 0106: jukebox
data modify storage fetchr:registries items append value {\
	id: "fetchr:jukebox",\
	item: {id: "minecraft:jukebox"},\
	translation: "block.minecraft.jukebox",\
	icon: "0106",\
	categories: ["fetchr:diamond"],\
	weight: 10\
}

## 0107: magma_block
data modify storage fetchr:registries items append value {\
	id: "fetchr:magma_block",\
	item: {id: "minecraft:magma_block"},\
	translation: "block.minecraft.magma_block",\
	icon: "0107",\
	categories: ["fetchr:gold_and_ruined_portal"],\
	weight: 30\
}

## 0108: bone_block
data modify storage fetchr:registries items append value {\
	id: "fetchr:bone_block",\
	item: {id: "minecraft:bone_block"},\
	translation: "block.minecraft.bone_block",\
	icon: "0108",\
	categories: ["fetchr:skeleton_drops"]\
}

## 0109: blast_furnace
data modify storage fetchr:registries items append value {\
	id: "fetchr:blast_furnace",\
	item: {id: "minecraft:blast_furnace"},\
	translation: "block.minecraft.blast_furnace",\
	icon: "0109",\
	categories: ["fetchr:furnace"]\
}

## 010a: raw_iron_block
data modify storage fetchr:registries items append value {\
	id: "fetchr:raw_iron_block",\
	item: {id: "minecraft:raw_iron_block"},\
	translation: "block.minecraft.raw_iron_block",\
	icon: "010a",\
	categories: ["fetchr:basic_iron"]\
}

## 010b: red_bed
data modify storage fetchr:registries items append value {\
	id: "fetchr:red_bed",\
	item: {id: "minecraft:red_bed"},\
	translation: "block.minecraft.red_bed",\
	icon: "010b",\
	categories: ["fetchr:wool"]\
}

## 010c: target
data modify storage fetchr:registries items append value {\
	id: "fetchr:target",\
	item: {id: "minecraft:target"},\
	translation: "block.minecraft.target",\
	icon: "010c",\
	categories: ["fetchr:wheat"]\
}

## 010d: snow
data modify storage fetchr:registries items append value {\
	id: "fetchr:snow",\
	item: {id: "minecraft:snow"},\
	translation: "block.minecraft.snow",\
	icon: "010d",\
	categories: ["fetchr:snow"]\
}

## 010e: stonecutter
data modify storage fetchr:registries items append value {\
	id: "fetchr:stonecutter",\
	item: {id: "minecraft:stonecutter"},\
	translation: "block.minecraft.stonecutter",\
	icon: "010e",\
	categories: ["fetchr:basic_iron"],\
	weight: 3\
}

## 010f: jack_o_lantern
data modify storage fetchr:registries items append value {\
	id: "fetchr:jack_o_lantern",\
	item: {id: "minecraft:jack_o_lantern"},\
	translation: "block.minecraft.jack_o_lantern",\
	icon: "010f",\
	categories: ["fetchr:pumpkin"]\
}

## 0110: tnt
data modify storage fetchr:registries items append value {\
	id: "fetchr:tnt",\
	item: {id: "minecraft:tnt"},\
	translation: "block.minecraft.tnt",\
	icon: "0110",\
	categories: ["fetchr:gunpowder", "fetchr:sand"]\
}

## 0111: lapis_block
data modify storage fetchr:registries items append value {\
	id: "fetchr:lapis_block",\
	item: {id: "minecraft:lapis_block"},\
	translation: "block.minecraft.lapis_block",\
	icon: "0111",\
	categories: ["fetchr:lapis"]\
}

## 0112: dispenser
data modify storage fetchr:registries items append value {\
	id: "fetchr:dispenser",\
	item: {id: "minecraft:dispenser"},\
	translation: "block.minecraft.dispenser",\
	icon: "0112",\
	categories: ["fetchr:bow"]\
}

## 0113: smoker
data modify storage fetchr:registries items append value {\
	id: "fetchr:smoker",\
	item: {id: "minecraft:smoker"},\
	translation: "block.minecraft.smoker",\
	icon: "0113",\
	categories: ["fetchr:furnace"]\
}

## 0114: dried_kelp_block
data modify storage fetchr:registries items append value {\
	id: "fetchr:dried_kelp_block",\
	item: {id: "minecraft:dried_kelp_block"},\
	translation: "block.minecraft.dried_kelp_block",\
	icon: "0114",\
	categories: ["fetchr:kelp"]\
}

## 0115: hay_bale
data modify storage fetchr:registries items append value {\
	id: "fetchr:hay_bale",\
	item: {id: "minecraft:hay_block"},\
	translation: "block.minecraft.hay_block",\
	icon: "0115",\
	categories: ["fetchr:wheat"]\
}

## 0116: fletching_table
data modify storage fetchr:registries items append value {\
	id: "fetchr:fletching_table",\
	item: {id: "minecraft:fletching_table"},\
	translation: "block.minecraft.fletching_table",\
	icon: "0116",\
	categories: ["fetchr:flint"]\
}

## 0117: lectern
data modify storage fetchr:registries items append value {\
	id: "fetchr:lectern",\
	item: {id: "minecraft:lectern"},\
	translation: "block.minecraft.lectern",\
	icon: "0117",\
	categories: ["fetchr:leather"]\
}

## 0118: raw_gold_block
data modify storage fetchr:registries items append value {\
	id: "fetchr:raw_gold_block",\
	item: {id: "minecraft:raw_gold_block"},\
	translation: "block.minecraft.raw_gold_block",\
	icon: "0118",\
	categories: ["fetchr:gold_and_ruined_portal"],\
	weight: 5\
}

## 0119: gold_block
data modify storage fetchr:registries items append value {\
	id: "fetchr:gold_block",\
	item: {id: "minecraft:gold_block"},\
	translation: "block.minecraft.gold_block",\
	icon: "0119",\
	categories: ["fetchr:gold_and_ruined_portal"],\
	weight: 5\
}

## 011a: scaffolding
data modify storage fetchr:registries items append value {\
	id: "fetchr:scaffolding",\
	item: {id: "minecraft:scaffolding"},\
	translation: "block.minecraft.scaffolding",\
	icon: "011a",\
	categories: ["fetchr:jungle"],\
	weight: 3\
}

## 011b: piston
data modify storage fetchr:registries items append value {\
	id: "fetchr:piston",\
	item: {id: "minecraft:piston"},\
	translation: "block.minecraft.piston",\
	icon: "011b",\
	categories: ["fetchr:piston"]\
}

## 011c: sticky_piston
data modify storage fetchr:registries items append value {\
	id: "fetchr:sticky_piston",\
	item: {id: "minecraft:sticky_piston"},\
	translation: "block.minecraft.sticky_piston",\
	icon: "011c",\
	categories: ["fetchr:piston", "fetchr:nighttime_mob_drops"]\
}

## 011d: orange_concrete
data modify storage fetchr:registries items append value {\
	id: "fetchr:orange_concrete",\
	item: {id: "minecraft:orange_concrete"},\
	translation: "block.minecraft.orange_concrete",\
	icon: "011d",\
	categories: ["fetchr:sand"],\
	weight: 2\
}

## 011e: pink_glazed_terracotta
data modify storage fetchr:registries items append value {\
	id: "fetchr:pink_glazed_terracotta",\
	item: {id: "minecraft:pink_glazed_terracotta"},\
	translation: "block.minecraft.pink_glazed_terracotta",\
	icon: "011e",\
	categories: ["fetchr:clay"],\
	weight: 2\
}

## 011f: deepslate
data modify storage fetchr:registries items append value {\
	id: "fetchr:deepslate",\
	item: {id: "minecraft:deepslate"},\
	translation: "block.minecraft.deepslate",\
	icon: "011f",\
	categories: ["fetchr:deepslate"]\
}

## 0120: cracked_deepslate_bricks
data modify storage fetchr:registries items append value {\
	id: "fetchr:cracked_deepslate_bricks",\
	item: {id: "minecraft:cracked_deepslate_bricks"},\
	translation: "block.minecraft.cracked_deepslate_bricks",\
	icon: "0120",\
	categories: ["fetchr:deepslate"]\
}

## 0121: deepslate_tile_wall
data modify storage fetchr:registries items append value {\
	id: "fetchr:deepslate_tile_wall",\
	item: {id: "minecraft:deepslate_tile_wall"},\
	translation: "block.minecraft.deepslate_tile_wall",\
	icon: "0121",\
	categories: ["fetchr:deepslate"]\
}

## 0122: muddy_mangrove_roots
data modify storage fetchr:registries items append value {\
	id: "fetchr:muddy_mangrove_roots",\
	item: {id: "minecraft:muddy_mangrove_roots"},\
	translation: "block.minecraft.muddy_mangrove_roots",\
	icon: "0122",\
	categories: ["fetchr:mud"]\
}

## 0123: packed_mud
data modify storage fetchr:registries items append value {\
	id: "fetchr:packed_mud",\
	item: {id: "minecraft:packed_mud"},\
	translation: "block.minecraft.packed_mud",\
	icon: "0123",\
	categories: ["fetchr:mud"]\
}

## 0124: mud_bricks
data modify storage fetchr:registries items append value {\
	id: "fetchr:mud_bricks",\
	item: {id: "minecraft:mud_bricks"},\
	translation: "block.minecraft.mud_bricks",\
	icon: "0124",\
	categories: ["fetchr:mud"]\
}

## 0125: rooted_dirt
data modify storage fetchr:registries items append value {\
	id: "fetchr:rooted_dirt",\
	item: {id: "minecraft:rooted_dirt"},\
	translation: "block.minecraft.rooted_dirt",\
	icon: "0125",\
	categories: ["fetchr:lush_cave"]\
}

## 0126: moss_carpet
data modify storage fetchr:registries items append value {\
	id: "fetchr:moss_carpet",\
	item: {id: "minecraft:moss_carpet"},\
	translation: "block.minecraft.moss_carpet",\
	icon: "0126",\
	categories: ["fetchr:lush_cave"],\
	weight: 3\
}

## 0127: flowering_azalea
data modify storage fetchr:registries items append value {\
	id: "fetchr:flowering_azalea",\
	item: {id: "minecraft:flowering_azalea"},\
	translation: "block.minecraft.flowering_azalea",\
	icon: "0127",\
	categories: ["fetchr:lush_cave"]\
}

## 0128: spore_blossom
data modify storage fetchr:registries items append value {\
	id: "fetchr:spore_blossom",\
	item: {id: "minecraft:spore_blossom"},\
	translation: "block.minecraft.spore_blossom",\
	icon: "0128",\
	categories: ["fetchr:lush_cave"],\
	weight: 3\
}

## 0129: dripstone_block
data modify storage fetchr:registries items append value {\
	id: "fetchr:dripstone_block",\
	item: {id: "minecraft:dripstone_block"},\
	translation: "block.minecraft.dripstone_block",\
	icon: "0129",\
	categories: ["fetchr:dripstone_cave"]\
}

## 012a: raw_copper_block
data modify storage fetchr:registries items append value {\
	id: "fetchr:raw_copper_block",\
	item: {id: "minecraft:raw_copper_block"},\
	translation: "block.minecraft.raw_copper_block",\
	icon: "012a",\
	categories: ["fetchr:copper"]\
}

## 012b: copper_block
data modify storage fetchr:registries items append value {\
	id: "fetchr:copper_block",\
	item: {id: "minecraft:copper_block"},\
	translation: "block.minecraft.copper_block",\
	icon: "012b",\
	categories: ["fetchr:copper"]\
}

## 012c: exposed_cut_copper
data modify storage fetchr:registries items append value {\
	id: "fetchr:exposed_cut_copper",\
	item: {id: "minecraft:exposed_cut_copper"},\
	translation: "block.minecraft.exposed_cut_copper",\
	icon: "012c",\
	categories: ["fetchr:copper"]\
}

## 012d: big_dripleaf
data modify storage fetchr:registries items append value {\
	id: "fetchr:big_dripleaf",\
	item: {id: "minecraft:big_dripleaf"},\
	translation: "block.minecraft.big_dripleaf",\
	icon: "012d",\
	categories: ["fetchr:lush_cave"],\
	weight: 3\
}

## 012e: tuff
data modify storage fetchr:registries items append value {\
	id: "fetchr:tuff",\
	item: {id: "minecraft:tuff"},\
	translation: "block.minecraft.tuff",\
	icon: "012e",\
	categories: ["fetchr:deepslate"],\
	weight: 3\
}

## 0131: amethyst_block
data modify storage fetchr:registries items append value {\
	id: "fetchr:amethyst_block",\
	item: {id: "minecraft:amethyst_block"},\
	translation: "block.minecraft.amethyst_block",\
	icon: "0131",\
	categories: ["fetchr:amethyst"],\
	weight: 2\
}

## 0132: calcite
data modify storage fetchr:registries items append value {\
	id: "fetchr:calcite",\
	item: {id: "minecraft:calcite"},\
	translation: "block.minecraft.calcite",\
	icon: "0132",\
	categories: ["fetchr:amethyst"],\
	weight: 2\
}

# structures
data modify storage fetchr:registries structures append value "fetchr:credits"
data modify storage fetchr:registries structures append value "fetchr:card_generation"
data modify storage fetchr:registries structures append value "fetchr:tutorial"

# hud components
data modify storage fetchr:registries hud_components append value {\
	id: "fetchr:timer",\
	addByDefault: true,\
	preferredColumn: 0,\
	name: '{"translate": "fetchr.custom_hud.components.timer"}',\
	iconWidth: '"\\u0008"',\
	iconSeparator: '" "',\
	iconFont: [\
		'{"text":"", "font": "fetchr:clock/line0"}',\
		'{"text":"", "font": "fetchr:clock/line1"}',\
		'{"text":"", "font": "fetchr:clock/line2"}',\
		'{"text":"", "font": "fetchr:clock/line3"}',\
		'{"text":"", "font": "fetchr:clock/line4"}',\
		'{"text":"", "font": "fetchr:clock/line5"}',\
		'{"text":"", "font": "fetchr:clock/line6"}',\
		'{"text":"", "font": "fetchr:clock/line7"}',\
		'{"text":"", "font": "fetchr:clock/line8"}',\
		'{"text":"", "font": "fetchr:clock/line9"}',\
		'{"text":"", "font": "fetchr:clock/line10"}'\
	]\
}
data modify storage fetchr:registries hud_components append value {\
	id: "fetchr:y_position",\
	addByDefault: true,\
	preferredColumn: 1,\
	name: '{"translate": "fetchr.custom_hud.components.y_position"}'\
}
data modify storage fetchr:registries hud_components append value {\
	id: "fetchr:player_chunk_position",\
	addByDefault: true,\
	preferredColumn: 1,\
	name: '{"translate": "fetchr.custom_hud.components.player_chunk_position"}',\
	settingsClickEvent: '{"text":"", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 70"}}',\
	iconWidth: '"\\u0008"',\
	iconSeparator: '" "',\
	iconFont: [\
		'{"text":"", "font": "fetchr:position/line0"}',\
		'{"text":"", "font": "fetchr:position/line1"}',\
		'{"text":"", "font": "fetchr:position/line2"}',\
		'{"text":"", "font": "fetchr:position/line3"}',\
		'{"text":"", "font": "fetchr:position/line4"}',\
		'{"text":"", "font": "fetchr:position/line5"}',\
		'{"text":"", "font": "fetchr:position/line6"}',\
		'{"text":"", "font": "fetchr:position/line7"}',\
		'{"text":"", "font": "fetchr:position/line8"}',\
		'{"text":"", "font": "fetchr:position/line9"}',\
		'{"text":"", "font": "fetchr:position/line10"}'\
	],\
	icon:'"c"'\
}
data modify storage fetchr:registries hud_components append value {\
	id: "fetchr:player_position",\
	addByDefault: true,\
	preferredColumn: 1,\
	name: '{"translate": "fetchr.custom_hud.components.player_position"}',\
	settingsClickEvent: '{"text":"", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 72"}}',\
	iconWidth: '"\\u000a"',\
	iconSeparator: '" "',\
	iconFont: [\
		'{"text":"", "font": "fetchr:position/line0"}',\
		'{"text":"", "font": "fetchr:position/line1"}',\
		'{"text":"", "font": "fetchr:position/line2"}',\
		'{"text":"", "font": "fetchr:position/line3"}',\
		'{"text":"", "font": "fetchr:position/line4"}',\
		'{"text":"", "font": "fetchr:position/line5"}',\
		'{"text":"", "font": "fetchr:position/line6"}',\
		'{"text":"", "font": "fetchr:position/line7"}',\
		'{"text":"", "font": "fetchr:position/line8"}',\
		'{"text":"", "font": "fetchr:position/line9"}',\
		'{"text":"", "font": "fetchr:position/line10"}'\
	]\
}
data modify storage fetchr:registries hud_components append value {\
	id: "fetchr:seed",\
	addByDefault: true,\
	preferredColumn: 1,\
	icon: '"s"',\
	iconWidth: '"\\u0009"',\
	iconSeparator: '" "',\
	name: '{"translate": "fetchr.custom_hud.components.seed"}',\
	settingsClickEvent: '{"text":"", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 74"}}',\
	iconFont: [\
		'{"text":"", "font": "fetchr:seed/line0"}',\
		'{"text":"", "font": "fetchr:seed/line1"}',\
		'{"text":"", "font": "fetchr:seed/line2"}',\
		'{"text":"", "font": "fetchr:seed/line3"}',\
		'{"text":"", "font": "fetchr:seed/line4"}',\
		'{"text":"", "font": "fetchr:seed/line5"}',\
		'{"text":"", "font": "fetchr:seed/line6"}',\
		'{"text":"", "font": "fetchr:seed/line7"}',\
		'{"text":"", "font": "fetchr:seed/line8"}',\
		'{"text":"", "font": "fetchr:seed/line9"}',\
		'{"text":"", "font": "fetchr:seed/line10"}'\
	]\
}

# preference pages
data modify storage fetchr:registries preferences.main append value {\
	id: "fetchr:spectator_mode",\
	textComponent: '[{"translate": "fetchr.preferences.spectator_mode.title"}, ": ", {"translate": "fetchr.preferences.spectator_mode.enabled"}]',\
	hoverText: '{"translate": "fetchr.preferences.spectator_mode.description"}',\
	clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 2"}}'\
}
data modify storage fetchr:registries preferences.main append value {\
	id: "fetchr:custom_hud",\
	textComponent: '{"translate": "fetchr.preferences.custom_hud.title"}',\
	hoverText: '{"translate": "fetchr.preferences.custom_hud.description"}',\
	clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 5"}}'\
}
data modify storage fetchr:registries preferences.custom_hud append value {\
	id: "fetchr:custom_hud/add_disabled",\
	textComponent: '{"translate": "fetchr.preferences.custom_hud.add_disabled.title"}',\
	hoverText: '{"translate": "fetchr.preferences.custom_hud.add_disabled.description"}',\
	disabledHoverText: '{"translate": "fetchr.preferences.custom_hud.add_disabled.disabled"}',\
	clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 6"}}'\
}
data modify storage fetchr:registries preferences.custom_hud append value {\
	id: "fetchr:custom_hud/adjust_col0",\
	textComponent: '{"translate": "fetchr.preferences.custom_hud.adjust_col0.title"}',\
	hoverText: '{"translate": "fetchr.preferences.custom_hud.adjust_col.description"}',\
	disabledHoverText: '{"translate": "fetchr.preferences.custom_hud.adjust_col.disabled"}',\
	clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 9"}}'\
}
data modify storage fetchr:registries preferences.custom_hud append value {\
	id: "fetchr:custom_hud/adjust_col1",\
	textComponent: '{"translate": "fetchr.preferences.custom_hud.adjust_col1.title"}',\
	hoverText: '{"translate": "fetchr.preferences.custom_hud.adjust_col.description"}',\
	disabledHoverText: '{"translate": "fetchr.preferences.custom_hud.adjust_col.disabled"}',\
	clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 10"}}'\
}
data modify storage fetchr:registries preferences.custom_hud append value {\
	id: "fetchr:custom_hud/adjust_card",\
	textComponent: '{"translate": "fetchr.preferences.custom_hud.adjust_card.title"}',\
	hoverText: '{"translate": "fetchr.preferences.custom_hud.adjust_card.description"}',\
	clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 11"}}'\
}
data modify storage fetchr:registries preferences.adjust_card append value {\
	id: "fetchr:custom_hud/adjust_card/left_of_hotbar",\
	textComponent: '{"translate": "fetchr.preferences.custom_hud.adjust_card.left_of_hotbar.title"}',\
	hoverText: '{"translate": "fetchr.preferences.custom_hud.adjust_card.left_of_hotbar.description"}',\
	clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 67"}}'\
}
data modify storage fetchr:registries preferences.adjust_card append value {\
	id: "fetchr:custom_hud/adjust_card/right_of_hotbar_no_attack",\
	textComponent: '{"translate": "fetchr.preferences.custom_hud.adjust_card.right_of_hotbar_no_attack.title"}',\
	hoverText: '{"translate": "fetchr.preferences.custom_hud.adjust_card.right_of_hotbar_no_attack.description"}',\
	clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 68"}}'\
}
data modify storage fetchr:registries preferences.adjust_card append value {\
	id: "fetchr:custom_hud/adjust_card/right_of_hotbar_with_attack",\
	textComponent: '{"translate": "fetchr.preferences.custom_hud.adjust_card.right_of_hotbar_with_attack.title"}',\
	hoverText: '{"translate": "fetchr.preferences.custom_hud.adjust_card.right_of_hotbar_with_attack.description"}',\
	clickEvent: '{"text": "", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.pref set 69"}}'\
}
