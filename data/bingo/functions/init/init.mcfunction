# setup objectives
scoreboard objectives remove bingo_seed
scoreboard objectives remove bingo_item_count
scoreboard objectives remove bingo_slot_id
scoreboard objectives remove bingo_weight
scoreboard objectives remove bingo_id
scoreboard objectives remove bingo_category
scoreboard objectives remove bingo_tmp
scoreboard objectives remove bingo_tmp_2
scoreboard objectives remove bingo_const
#DONT reset stats
#scoreboard objectives remove bingo_stats

scoreboard objectives add bingo_seed trigger "Trigger for setting the seed value"
scoreboard objectives add bingo_item_count dummy "Amount of items a player has received"
scoreboard objectives add bingo_slot_id dummy "Id for the slot this item is currently in"
scoreboard objectives add bingo_weight dummy "Weight for the rng to pick this item"
scoreboard objectives add bingo_id dummy
scoreboard objectives add bingo_category dummy "Category id of this item"
scoreboard objectives add bingo_tmp dummy "Temporary values"
scoreboard objectives add bingo_tmp_2 dummy "Temporary values #2"
scoreboard objectives add bingo_stats dummy "Minecraft Bingo"
scoreboard objectives setdisplay sidebar bingo_stats

execute in bingo:lobby positioned 0 0 0 run function bingo:init/setup_lobby

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
data modify storage bingo:tmp item set value {id: "minecraft:pumpkin_seeds", itemTextComponent: '{"translate": "item.minecraft.pumpkin_seeds", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:pumpkin_seeds"}}}', icon: '"\\u0001"', clearCommand: ["clear @a[tag=bingo_clear_pumpkin_seeds] minecraft:pumpkin_seeds 1", "tag remove @a bingo_clear_pumpkin_seeds"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"pumpkin"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:pumpkin_pie", itemTextComponent: '{"translate": "item.minecraft.pumpkin_pie", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:pumpkin_pie"}}}', icon: '"\\u0002"', clearCommand: ["clear @a[tag=bingo_clear_pumpkin_pie] minecraft:pumpkin_pie 1", "tag remove @a bingo_clear_pumpkin_pie"], categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"pumpkin"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"egg"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:egg", itemTextComponent: '{"translate": "item.minecraft.egg", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:egg"}}}', icon: '"\\u0003"', clearCommand: ["clear @a[tag=bingo_clear_egg] minecraft:egg 1", "tag remove @a bingo_clear_egg"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"egg"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:cake", itemTextComponent: '{"translate": "bingo.minecraft.cake", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cake"}}}', icon: '"\\u0004"', clearCommand: ["clear @a[tag=bingo_clear_cake] minecraft:cake 1", "tag remove @a bingo_clear_cake"], categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"egg"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"milk"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:acacia_sapling", itemTextComponent: '{"translate": "block.minecraft.acacia_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:acacia_sapling"}}}', icon: '"\\u0005"', clearCommand: ["clear @a[tag=bingo_clear_acacia_sapling] minecraft:acacia_sapling 1", "tag remove @a bingo_clear_acacia_sapling"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"sapling"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:spruce_sapling", itemTextComponent: '{"translate": "block.minecraft.spruce_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:spruce_sapling"}}}', icon: '"\\u0006"', clearCommand: ["clear @a[tag=bingo_clear_spruce_sapling] minecraft:spruce_sapling 1", "tag remove @a bingo_clear_spruce_sapling"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"sapling"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:cocoa_beans", itemTextComponent: '{"translate": "item.minecraft.cocoa_beans", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cocoa_beans"}}}', icon: '"\\u0007"', clearCommand: ["clear @a[tag=bingo_clear_cocoa_beans] minecraft:cocoa_beans 1", "tag remove @a bingo_clear_cocoa_beans"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"jungle"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:cookie", itemTextComponent: '{"translate": "item.minecraft.cookie", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cookie"}}}', icon: '"\\u0008"', clearCommand: ["clear @a[tag=bingo_clear_cookie] minecraft:cookie 1", "tag remove @a bingo_clear_cookie"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"jungle"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:melon_slice", itemTextComponent: '{"translate": "item.minecraft.melon_slice", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:melon_slice"}}}', icon: '"\\u0009"', clearCommand: ["clear @a[tag=bingo_clear_melon_slice] minecraft:melon_slice 1", "tag remove @a bingo_clear_melon_slice"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"jungle"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:glistering_melon_slice", itemTextComponent: '{"translate": "item.minecraft.glistering_melon_slice", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:glistering_melon_slice"}}}', icon: '"\\u000a"', clearCommand: ["clear @a[tag=bingo_clear_glistering_melon_slice] minecraft:glistering_melon_slice 1", "tag remove @a bingo_clear_glistering_melon_slice"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"jungle"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:dead_bush", itemTextComponent: '{"translate": "block.minecraft.dead_bush", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dead_bush"}}}', icon: '"\\u000b"', clearCommand: ["clear @a[tag=bingo_clear_dead_bush] minecraft:dead_bush 1", "tag remove @a bingo_clear_dead_bush"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"shearable"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:fern", itemTextComponent: '{"translate": "block.minecraft.fern", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:fern"}}}', icon: '"\\u000c"', clearCommand: ["clear @a[tag=bingo_clear_fern] minecraft:fern 1", "tag remove @a bingo_clear_fern"], categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"shearable"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"taiga"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:vine", itemTextComponent: '{"translate": "block.minecraft.vine", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:vine"}}}', icon: '"\\u000d"', clearCommand: ["clear @a[tag=bingo_clear_vine] minecraft:vine 1", "tag remove @a bingo_clear_vine"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"shearable"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:rail", itemTextComponent: '{"translate": "block.minecraft.rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:rail"}}}', icon: '"\\u000e"', clearCommand: ["clear @a[tag=bingo_clear_rail] minecraft:rail 1", "tag remove @a bingo_clear_rail"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"rail"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:powered_rail", itemTextComponent: '{"translate": "block.minecraft.powered_rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:powered_rail"}}}', icon: '"\\u000f"', clearCommand: ["clear @a[tag=bingo_clear_powered_rail] minecraft:powered_rail 1", "tag remove @a bingo_clear_powered_rail"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gold"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:flint", itemTextComponent: '{"translate": "item.minecraft.flint", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:flint"}}}', icon: '"\\u0010"', clearCommand: ["clear @a[tag=bingo_clear_flint] minecraft:flint 1", "tag remove @a bingo_clear_flint"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"flint"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:flint_and_steel", itemTextComponent: '{"translate": "item.minecraft.flint_and_steel", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:flint_and_steel"}}}', icon: '"\\u0011"', clearCommand: ["clear @a[tag=bingo_clear_flint_and_steel] minecraft:flint_and_steel 1", "tag remove @a bingo_clear_flint_and_steel"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"flint"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:arrow", itemTextComponent: '{"translate": "item.minecraft.arrow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:arrow"}}}', icon: '"\\u0012"', clearCommand: ["clear @a[tag=bingo_clear_arrow] minecraft:arrow 1", "tag remove @a bingo_clear_arrow"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"flint"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:ender_pearl", itemTextComponent: '{"translate": "item.minecraft.ender_pearl", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:ender_pearl"}}}', icon: '"\\u0013"', clearCommand: ["clear @a[tag=bingo_clear_ender_pearl] minecraft:ender_pearl 1", "tag remove @a bingo_clear_ender_pearl"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"enderslime"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:slime_ball", itemTextComponent: '{"translate": "item.minecraft.slime_ball", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:slime_ball"}}}', icon: '"\\u0014"', clearCommand: ["clear @a[tag=bingo_clear_slime_ball] minecraft:slime_ball 1", "tag remove @a bingo_clear_slime_ball"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"enderslime"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:firework_rocket", itemTextComponent: '{"translate": "item.minecraft.firework_rocket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:firework_rocket"}}}', icon: '"\\u0015"', clearCommand: ["clear @a[tag=bingo_clear_firework_rocket] minecraft:firework_rocket 1", "tag remove @a bingo_clear_firework_rocket"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gunpowder"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:milk_bucket", itemTextComponent: '{"translate": "item.minecraft.milk_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:milk_bucket"}}}', icon: '"\\u0016"', clearCommand: ["clear @a[tag=bingo_clear_milk_bucket] minecraft:milk_bucket 1", "tag remove @a bingo_clear_milk_bucket"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"milk"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:cauldron", itemTextComponent: '{"translate": "item.minecraft.cauldron", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cauldron"}}}', icon: '"\\u0017"', clearCommand: ["clear @a[tag=bingo_clear_cauldron] minecraft:cauldron 1", "tag remove @a bingo_clear_cauldron"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"simple_iron"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:saddle", itemTextComponent: '{"translate": "item.minecraft.saddle", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:saddle"}}}', icon: '"\\u0018"', clearCommand: ["clear @a[tag=bingo_clear_saddle] minecraft:saddle 1", "tag remove @a bingo_clear_saddle"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"chest_loot"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:name_tag", itemTextComponent: '{"translate": "item.minecraft.name_tag", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:name_tag"}}}', icon: '"\\u0019"', clearCommand: ["clear @a[tag=bingo_clear_name_tag] minecraft:name_tag 1", "tag remove @a bingo_clear_name_tag"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"chest_loot"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:painting", itemTextComponent: '{"translate": "item.minecraft.painting", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:painting"}}}', icon: '"\\u001a"', clearCommand: ["clear @a[tag=bingo_clear_painting] minecraft:painting 1", "tag remove @a bingo_clear_painting"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"wool"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:item_frame", itemTextComponent: '{"translate": "item.minecraft.item_frame", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:item_frame"}}}', icon: '"\\u001b"', clearCommand: ["clear @a[tag=bingo_clear_item_frame] minecraft:item_frame 1", "tag remove @a bingo_clear_item_frame"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"leather"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:emerald", itemTextComponent: '{"translate": "item.minecraft.emerald", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:emerald"}}}', icon: '"\\u001c"', clearCommand: ["clear @a[tag=bingo_clear_emerald] minecraft:emerald 1", "tag remove @a bingo_clear_emerald"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"village"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:diamond_shovel", itemTextComponent: '{"translate": "item.minecraft.diamond_shovel", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_shovel"}}}', icon: '"\\u001d"', clearCommand: ["clear @a[tag=bingo_clear_diamond_shovel] minecraft:diamond_shovel 1", "tag remove @a bingo_clear_diamond_shovel"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"diamond"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:diamond_hoe", itemTextComponent: '{"translate": "item.minecraft.diamond_hoe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_hoe"}}}', icon: '"\\u001e"', clearCommand: ["clear @a[tag=bingo_clear_diamond_hoe] minecraft:diamond_hoe 1", "tag remove @a bingo_clear_diamond_hoe"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"diamond"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:diamond_axe", itemTextComponent: '{"translate": "item.minecraft.diamond_axe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_axe"}}}', icon: '"\\u001f"', clearCommand: ["clear @a[tag=bingo_clear_diamond_axe] minecraft:diamond_axe 1", "tag remove @a bingo_clear_diamond_axe"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"diamond"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:flower_pot", itemTextComponent: '{"translate": "block.minecraft.flower_pot", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:flower_pot"}}}', icon: '"\\u0021"', clearCommand: ["clear @a[tag=bingo_clear_flower_pot] minecraft:flower_pot 1", "tag remove @a bingo_clear_flower_pot"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"brick"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:brick", itemTextComponent: '{"translate": "item.minecraft.brick", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:brick"}}}', icon: '"\\u0022"', clearCommand: ["clear @a[tag=bingo_clear_brick] minecraft:brick 1", "tag remove @a bingo_clear_brick"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"brick"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:mushroom_stew", itemTextComponent: '{"translate": "item.minecraft.mushroom_stew", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:mushroom_stew"}}}', icon: '"\\u0023"', clearCommand: ["clear @a[tag=bingo_clear_mushroom_stew] minecraft:mushroom_stew 1", "tag remove @a bingo_clear_mushroom_stew"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"mushroom"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:beetroot_soup", itemTextComponent: '{"translate": "item.minecraft.beetroot_soup", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:beetroot_soup"}}}', icon: '"\\u0024"', clearCommand: ["clear @a[tag=bingo_clear_beetroot_soup] minecraft:beetroot_soup 1", "tag remove @a bingo_clear_beetroot_soup"], categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"chest_loot"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"village"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:apple", itemTextComponent: '{"translate": "item.minecraft.apple", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:apple"}}}', icon: '"\\u0025"', clearCommand: ["clear @a[tag=bingo_clear_apple] minecraft:apple 1", "tag remove @a bingo_clear_apple"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"apple"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:golden_apple", itemTextComponent: '{"translate": "item.minecraft.golden_apple", "color": "aqua", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_apple"}}}', icon: '"\\u0026"', clearCommand: ["clear @a[tag=bingo_clear_golden_apple] minecraft:golden_apple 1", "tag remove @a bingo_clear_golden_apple"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"apple"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:golden_shovel", itemTextComponent: '{"translate": "item.minecraft.golden_shovel", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_shovel"}}}', icon: '"\\u0027"', clearCommand: ["clear @a[tag=bingo_clear_golden_shovel] minecraft:golden_shovel 1", "tag remove @a bingo_clear_golden_shovel"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gold"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:golden_sword", itemTextComponent: '{"translate": "item.minecraft.golden_sword", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_sword"}}}', icon: '"\\u0028"', clearCommand: ["clear @a[tag=bingo_clear_golden_sword] minecraft:golden_sword 1", "tag remove @a bingo_clear_golden_sword"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gold"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:clock", itemTextComponent: '{"translate": "item.minecraft.clock", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:clock"}}}', icon: '"\\u0029"', clearCommand: ["clear @a[tag=bingo_clear_clock] minecraft:clock 1", "tag remove @a bingo_clear_clock"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gold"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:repeater", itemTextComponent: '{"translate": "block.minecraft.repeater", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:repeater"}}}', icon: '"\\u002a"', clearCommand: ["clear @a[tag=bingo_clear_repeater] minecraft:repeater 1", "tag remove @a bingo_clear_repeater"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"redstone"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:compass", itemTextComponent: '{"translate": "item.minecraft.compass", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:compass"}}}', icon: '"\\u002b"', clearCommand: ["clear @a[tag=bingo_clear_compass] minecraft:compass 1", "tag remove @a bingo_clear_compass"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"compass"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:map", itemTextComponent: '{"translate": "item.minecraft.map", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:map"}}}', icon: '"\\u002c"', clearCommand: ["clear @a[tag=bingo_clear_map] minecraft:map 1", "tag remove @a bingo_clear_map"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"compass"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:book", itemTextComponent: '{"translate": "item.minecraft.book", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:book"}}}', icon: '"\\u002d"', clearCommand: ["clear @a[tag=bingo_clear_book] minecraft:book 1", "tag remove @a bingo_clear_book"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"leather"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:writable_book", itemTextComponent: '{"translate": "item.minecraft.writable_book", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:writable_book"}}}', icon: '"\\u002e"', clearCommand: ["clear @a[tag=bingo_clear_writable_book] minecraft:writable_book 1", "tag remove @a bingo_clear_writable_book"], categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"leather"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"ink"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:enchanted_book", itemTextComponent: '{"translate": "item.minecraft.enchanted_book", "color": "yellow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:enchanted_book"}}}', icon: '"\\u002f"', clearCommand: ["clear @a[tag=bingo_clear_enchanted_book] minecraft:enchanted_book 1", "tag remove @a bingo_clear_enchanted_book"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"chest_loot"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:spider_eye", itemTextComponent: '{"translate": "item.minecraft.spider_eye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:spider_eye"}}}', icon: '"\\u0030"', clearCommand: ["clear @a[tag=bingo_clear_spider_eye] minecraft:spider_eye 1", "tag remove @a bingo_clear_spider_eye"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"spider"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:fermented_spider_eye", itemTextComponent: '{"translate": "item.minecraft.fermented_spider_eye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:fermented_spider_eye"}}}', icon: '"\\u0031"', clearCommand: ["clear @a[tag=bingo_clear_fermented_spider_eye] minecraft:fermented_spider_eye 1", "tag remove @a bingo_clear_fermented_spider_eye"], categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"spider"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"mushroom"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:gunpowder", itemTextComponent: '{"translate": "item.minecraft.gunpowder", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:gunpowder"}}}', icon: '"\\u0032"', clearCommand: ["clear @a[tag=bingo_clear_gunpowder] minecraft:gunpowder 1", "tag remove @a bingo_clear_gunpowder"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gunpowder"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:tnt_minecart", itemTextComponent: '{"translate": "item.minecraft.tnt_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tnt_minecart"}}}', icon: '"\\u0033"', clearCommand: ["clear @a[tag=bingo_clear_tnt_minecart] minecraft:tnt_minecart 1", "tag remove @a bingo_clear_tnt_minecart"], categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"gunpowder"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"sand"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:hopper", itemTextComponent: '{"translate": "block.minecraft.hopper", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:hopper"}}}', icon: '"\\u0034"', clearCommand: ["clear @a[tag=bingo_clear_hopper] minecraft:hopper 1", "tag remove @a bingo_clear_hopper"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"chest_iron"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:hopper_minecart", itemTextComponent: '{"translate": "item.minecraft.hopper_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:hopper_minecart"}}}', icon: '"\\u0035"', clearCommand: ["clear @a[tag=bingo_clear_hopper_minecart] minecraft:hopper_minecart 1", "tag remove @a bingo_clear_hopper_minecart"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"chest_iron"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:furnace_minecart", itemTextComponent: '{"translate": "item.minecraft.furnace_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:furnace_minecart"}}}', icon: '"\\u0036"', clearCommand: ["clear @a[tag=bingo_clear_furnace_minecart] minecraft:furnace_minecart 1", "tag remove @a bingo_clear_furnace_minecart"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"furnace_iron"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:chest_minecart", itemTextComponent: '{"translate": "item.minecraft.chest_minecart", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:chest_minecart"}}}', icon: '"\\u0037"', clearCommand: ["clear @a[tag=bingo_clear_chest_minecart] minecraft:chest_minecart 1", "tag remove @a bingo_clear_chest_minecart"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"chest_iron"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:bone", itemTextComponent: '{"translate": "item.minecraft.bone", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bone"}}}', icon: '"\\u0038"', clearCommand: ["clear @a[tag=bingo_clear_bone] minecraft:bone 1", "tag remove @a bingo_clear_bone"], categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"ink_bone"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"cactus_bone"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:ink_sac", itemTextComponent: '{"translate": "item.minecraft.ink_sac", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:ink_sac"}}}', icon: '"\\u0039"', clearCommand: ["clear @a[tag=bingo_clear_ink_sac] minecraft:ink_sac 1", "tag remove @a bingo_clear_ink_sac"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"ink"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:gray_dye", itemTextComponent: '{"translate": "item.minecraft.gray_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:gray_dye"}}}', icon: '"\\u003a"', clearCommand: ["clear @a[tag=bingo_clear_gray_dye] minecraft:gray_dye 1", "tag remove @a bingo_clear_gray_dye"], categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"ink"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"ink_bone"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:green_dye", itemTextComponent: '{"translate": "item.minecraft.green_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:green_dye"}}}', icon: '"\\u003b"', clearCommand: ["clear @a[tag=bingo_clear_green_dye] minecraft:green_dye 1", "tag remove @a bingo_clear_green_dye"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"cactus"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:lime_dye", itemTextComponent: '{"translate": "item.minecraft.lime_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lime_dye"}}}', icon: '"\\u003c"', clearCommand: ["clear @a[tag=bingo_clear_lime_dye] minecraft:lime_dye 1", "tag remove @a bingo_clear_lime_dye"], categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"cactus"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"cactus_bone"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:lapis_lazuli", itemTextComponent: '{"translate": "item.minecraft.lapis_lazuli", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lapis_lazuli"}}}', icon: '"\\u003d"', clearCommand: ["clear @a[tag=bingo_clear_lapis_lazuli] minecraft:lapis_lazuli 1", "tag remove @a bingo_clear_lapis_lazuli"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"lapis"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:cyan_dye", itemTextComponent: '{"translate": "item.minecraft.cyan_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cyan_dye"}}}', icon: '"\\u003e"', clearCommand: ["clear @a[tag=bingo_clear_cyan_dye] minecraft:cyan_dye 1", "tag remove @a bingo_clear_cyan_dye"], categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"lapis"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"cactus"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:purple_dye", itemTextComponent: '{"translate": "item.minecraft.purple_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:purple_dye"}}}', icon: '"\\u003f"', clearCommand: ["clear @a[tag=bingo_clear_purple_dye] minecraft:purple_dye 1", "tag remove @a bingo_clear_purple_dye"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"lapis"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:suspicious_stew", itemTextComponent: '{"translate": "item.minecraft.suspicious_stew", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:suspicious_stew"}}}', icon: '"\\u0040"', clearCommand: ["clear @a[tag=bingo_clear_suspicious_stew] minecraft:suspicious_stew 1", "tag remove @a bingo_clear_suspicious_stew"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"mushroom"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:glass_bottle", itemTextComponent: '{"translate": "item.minecraft.glass_bottle", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:glass_bottle"}}}', icon: '"\\u0041"', clearCommand: ["clear @a[tag=bingo_clear_glass_bottle] minecraft:glass_bottle 1", "tag remove @a bingo_clear_glass_bottle"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"sand"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:cod", itemTextComponent: '{"translate": "item.minecraft.cod", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cod"}}}', icon: '"\\u0042"', clearCommand: ["clear @a[tag=bingo_clear_cod] minecraft:cod 1", "tag remove @a bingo_clear_cod"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"fish"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:cod_bucket", itemTextComponent: '{"translate": "item.minecraft.cod_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:cod_bucket"}}}', icon: '"\\u0043"', clearCommand: ["clear @a[tag=bingo_clear_cod_bucket] minecraft:cod_bucket 1", "tag remove @a bingo_clear_cod_bucket"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"fish"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:salmon", itemTextComponent: '{"translate": "item.minecraft.salmon", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:salmon"}}}', icon: '"\\u0044"', clearCommand: ["clear @a[tag=bingo_clear_salmon] minecraft:salmon 1", "tag remove @a bingo_clear_salmon"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"fish"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:salmon_bucket", itemTextComponent: '{"translate": "item.minecraft.salmon_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:salmon_bucket"}}}', icon: '"\\u0045"', clearCommand: ["clear @a[tag=bingo_clear_salmon_bucket] minecraft:salmon_bucket 1", "tag remove @a bingo_clear_salmon_bucket"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"fish"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:tropical_fish", itemTextComponent: '{"translate": "item.minecraft.tropical_fish", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tropical_fish"}}}', icon: '"\\u0046"', clearCommand: ["clear @a[tag=bingo_clear_tropical_fish] minecraft:tropical_fish 1", "tag remove @a bingo_clear_tropical_fish"], categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"fish"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"warm_ocean"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:tropical_fish_bucket", itemTextComponent: '{"translate": "item.minecraft.tropical_fish_bucket", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tropical_fish_bucket"}}}', icon: '"\\u0047"', clearCommand: ["clear @a[tag=bingo_clear_tropical_fish_bucket] minecraft:tropical_fish_bucket 1", "tag remove @a bingo_clear_tropical_fish_bucket"], categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"fish"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"warm_ocean"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:birch_sapling", itemTextComponent: '{"translate": "block.minecraft.birch_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:birch_sapling"}}}', icon: '"\\u0048"', clearCommand: ["clear @a[tag=bingo_clear_birch_sapling] minecraft:birch_sapling 1", "tag remove @a bingo_clear_birch_sapling"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"sapling"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:dark_oak_sapling", itemTextComponent: '{"translate": "block.minecraft.dark_oak_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dark_oak_sapling"}}}', icon: '"\\u0049"', clearCommand: ["clear @a[tag=bingo_clear_dark_oak_sapling] minecraft:dark_oak_sapling 1", "tag remove @a bingo_clear_dark_oak_sapling"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"sapling"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:jungle_sapling", itemTextComponent: '{"translate": "block.minecraft.jungle_sapling", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:jungle_sapling"}}}', icon: '"\\u004a"', clearCommand: ["clear @a[tag=bingo_clear_jungle_sapling] minecraft:jungle_sapling 1", "tag remove @a bingo_clear_jungle_sapling"], categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"sapling"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"jungle"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:detector_rail", itemTextComponent: '{"translate": "block.minecraft.detector_rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:detector_rail"}}}', icon: '"\\u004b"', clearCommand: ["clear @a[tag=bingo_clear_detector_rail] minecraft:detector_rail 1", "tag remove @a bingo_clear_detector_rail"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"rail"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:activator_rail", itemTextComponent: '{"translate": "block.minecraft.activator_rail", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:activator_rail"}}}', icon: '"\\u004c"', clearCommand: ["clear @a[tag=bingo_clear_activator_rail] minecraft:activator_rail 1", "tag remove @a bingo_clear_activator_rail"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"rail"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:heart_of_the_sea", itemTextComponent: '{"translate": "item.minecraft.heart_of_the_sea", "color": "yellow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:heart_of_the_sea"}}}', icon: '"\\u004d"', clearCommand: ["clear @a[tag=bingo_clear_heart_of_the_sea] minecraft:heart_of_the_sea 1", "tag remove @a bingo_clear_heart_of_the_sea"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"heart_of_the_sea"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:bell", itemTextComponent: '{"translate": "block.minecraft.bell", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bell"}}}', icon: '"\\u004e"', clearCommand: ["clear @a[tag=bingo_clear_bell] minecraft:bell 1", "tag remove @a bingo_clear_bell"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"village"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:sweet_berries", itemTextComponent: '{"translate": "block.minecraft.sweet_berries", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:sweet_berries"}}}', icon: '"\\u004f"', clearCommand: ["clear @a[tag=bingo_clear_sweet_berries] minecraft:sweet_berries 1", "tag remove @a bingo_clear_sweet_berries"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"taiga"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:diamond_sword", itemTextComponent: '{"translate": "item.minecraft.diamond_sword", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_sword"}}}', icon: '"\\u0050"', clearCommand: ["clear @a[tag=bingo_clear_diamond_sword] minecraft:diamond_sword 1", "tag remove @a bingo_clear_diamond_sword"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"diamond"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:diamond_pickaxe", itemTextComponent: '{"translate": "item.minecraft.diamond_pickaxe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:diamond_pickaxe"}}}', icon: '"\\u0051"', clearCommand: ["clear @a[tag=bingo_clear_diamond_pickaxe] minecraft:diamond_pickaxe 1", "tag remove @a bingo_clear_diamond_pickaxe"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"diamond"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:golden_axe", itemTextComponent: '{"translate": "item.minecraft.golden_axe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_axe"}}}', icon: '"\\u0052"', clearCommand: ["clear @a[tag=bingo_clear_golden_axe] minecraft:golden_axe 1", "tag remove @a bingo_clear_golden_axe"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gold"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:golden_pickaxe", itemTextComponent: '{"translate": "item.minecraft.golden_pickaxe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_pickaxe"}}}', icon: '"\\u0053"', clearCommand: ["clear @a[tag=bingo_clear_golden_pickaxe] minecraft:golden_pickaxe 1", "tag remove @a bingo_clear_golden_pickaxe"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gold"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:golden_hoe", itemTextComponent: '{"translate": "item.minecraft.golden_hoe", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:golden_hoe"}}}', icon: '"\\u0054"', clearCommand: ["clear @a[tag=bingo_clear_golden_hoe] minecraft:golden_hoe 1", "tag remove @a bingo_clear_golden_hoe"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"gold"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:crossbow", itemTextComponent: '{"translate": "item.minecraft.crossbow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:crossbow"}}}', icon: '"\\u0055"', clearCommand: ["clear @a[tag=bingo_clear_crossbow] minecraft:crossbow 1", "tag remove @a bingo_clear_crossbow"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"bow"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:bamboo", itemTextComponent: '{"translate": "block.minecraft.bamboo", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bamboo"}}}', icon: '"\\u0056"', clearCommand: ["clear @a[tag=bingo_clear_bamboo] minecraft:bamboo 1", "tag remove @a bingo_clear_bamboo"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"jungle"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:sea_pickle", itemTextComponent: '{"translate": "item.minecraft.sea_pickle", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:sea_pickle"}}}', icon: '"\\u0057"', clearCommand: ["clear @a[tag=bingo_clear_sea_pickle] minecraft:sea_pickle 1", "tag remove @a bingo_clear_sea_pickle"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"warm_ocean"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:sea_grass", itemTextComponent: '{"translate": "block.minecraft.sea_grass", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:sea_grass"}}}', icon: '"\\u0058"', clearCommand: ["clear @a[tag=bingo_clear_sea_grass] minecraft:sea_grass 1", "tag remove @a bingo_clear_sea_grass"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"shearable"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:iron_block", itemTextComponent: '{"translate": "item.minecraft.iron_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:iron_block"}}}', icon: '"\\u0100"', clearCommand: ["clear @a[tag=bingo_clear_iron_block] minecraft:iron_block 1", "tag remove @a bingo_clear_iron_block"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"simple_iron"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:redstone_block", itemTextComponent: '{"translate": "block.minecraft.redstone_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:redstone_block"}}}', icon: '"\\u0101"', clearCommand: ["clear @a[tag=bingo_clear_redstone_block] minecraft:redstone_block 1", "tag remove @a bingo_clear_redstone_block"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"redstone"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:bookshelf", itemTextComponent: '{"translate": "block.minecraft.bookshelf", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bookshelf"}}}', icon: '"\\u0102"', clearCommand: ["clear @a[tag=bingo_clear_bookshelf] minecraft:bookshelf 1", "tag remove @a bingo_clear_bookshelf"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"leather"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:obsidian", itemTextComponent: '{"translate": "block.minecraft.obsidian", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:obsidian"}}}', icon: '"\\u0103"', clearCommand: ["clear @a[tag=bingo_clear_obsidian] minecraft:obsidian 1", "tag remove @a bingo_clear_obsidian"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"diamond"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:melon", itemTextComponent: '{"translate": "block.minecraft.melon", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:melon"}}}', icon: '"\\u0104"', clearCommand: ["clear @a[tag=bingo_clear_melon] minecraft:melon 1", "tag remove @a bingo_clear_melon"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"jungle"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:mossy_stone_bricks", itemTextComponent: '{"translate": "block.minecraft.mossy_stone_bricks", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:mossy_stone_bricks"}}}', icon: '"\\u0105"', clearCommand: ["clear @a[tag=bingo_clear_mossy_stone_bricks] minecraft:mossy_stone_bricks 1", "tag remove @a bingo_clear_mossy_stone_bricks"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"shearable"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:jukebox", itemTextComponent: '{"translate": "block.minecraft.jukebox", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:jukebox"}}}', icon: '"\\u0106"', clearCommand: ["clear @a[tag=bingo_clear_jukebox] minecraft:jukebox 1", "tag remove @a bingo_clear_jukebox"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"diamond"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:magma_block", itemTextComponent: '{"translate": "block.minecraft.magma_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:magma_block"}}}', icon: '"\\u0107"', clearCommand: ["clear @a[tag=bingo_clear_magma_block] minecraft:magma_block 1", "tag remove @a bingo_clear_magma_block"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"magma_block"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:bone_block", itemTextComponent: '{"translate": "block.minecraft.bone_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:bone_block"}}}', icon: '"\\u0108"', clearCommand: ["clear @a[tag=bingo_clear_bone_block] minecraft:bone_block 1", "tag remove @a bingo_clear_bone_block"], categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"ink_bone"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"cactus_bone"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:blast_furnace", itemTextComponent: '{"translate": "block.minecraft.blast_furnace", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:blast_furnace"}}}', icon: '"\\u0109"', clearCommand: ["clear @a[tag=bingo_clear_blast_furnace] minecraft:blast_furnace 1", "tag remove @a bingo_clear_blast_furnace"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"furnace_iron"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:ominous_banner", itemTextComponent: '{"translate": "block.minecraft.ominous_banner", "color": "gold", "italic": true, "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:white_banner", "tag": "{BlockEntityTag: {Patterns: [{Pattern: \'mr\', Color: 9}, {Pattern: \'bs\', Color: 8}, {Pattern: \'cs\', Color: 7}, {Pattern: \'bo\', Color: 8}, {Pattern: \'ms\', Color: 15}, {Pattern: \'hh\', Color: 8}, {Pattern: \'mc\', Color: 8}, {Pattern: \'bo\', Color: 15}]}, display: {Name: \'{\\"color\\":\\"gold\\",\\"translate\\":\\"block.minecraft.ominous_banner\\"}\'}}"}}}', icon: '"\\u010a"', clearCommand: ['clear @a[tag=bingo_clear_ominous_banner] minecraft:white_banner{BlockEntityTag: {Patterns: [{Pattern: "mr", Color: 9}, {Pattern: "bs", Color: 8}, {Pattern: "cs", Color: 7}, {Pattern: "bo", Color: 8}, {Pattern: "ms", Color: 15}, {Pattern: "hh", Color: 8}, {Pattern: "mc", Color: 8}, {Pattern: "bo", Color: 15}]}, display: {Name: \'{"color":"gold","translate":"block.minecraft.ominous_banner"}\'}} 1', "tag remove @a bingo_clear_ominous_banner"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"ominous_banner"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:red_bed", itemTextComponent: '{"translate": "item.minecraft.red_bed", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:red_bed"}}}', icon: '"\\u010b"', clearCommand: ["clear @a[tag=bingo_clear_red_bed] minecraft:red_bed 1", "tag remove @a bingo_clear_red_bed"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"wool"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:target", itemTextComponent: '{"translate": "block.minecraft.target", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:target"}}}', icon: '"\\u010c"', clearCommand: ["clear @a[tag=bingo_clear_target] minecraft:target 1", "tag remove @a bingo_clear_target"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"redstone"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:snow", itemTextComponent: '{"translate": "block.minecraft.snow", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:snow"}}}', icon: '"\\u010d"', clearCommand: ["clear @a[tag=bingo_clear_snow] minecraft:snow 1", "tag remove @a bingo_clear_snow"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"snow"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:snow_block", itemTextComponent: '{"translate": "block.minecraft.snow_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:snow_block"}}}', icon: '"\\u010e"', clearCommand: ["clear @a[tag=bingo_clear_snow_block] minecraft:snow_block 1", "tag remove @a bingo_clear_snow_block"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"snow"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:jack_o_lantern", itemTextComponent: '{"translate": "block.minecraft.jack_o_lantern", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:jack_o_lantern"}}}', icon: '"\\u010f"', clearCommand: ["clear @a[tag=bingo_clear_jack_o_lantern] minecraft:jack_o_lantern 1", "tag remove @a bingo_clear_jack_o_lantern"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"pumpkin"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:tnt", itemTextComponent: '{"translate": "block.minecraft.tnt", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:tnt"}}}', icon: '"\\u0110"', clearCommand: ["clear @a[tag=bingo_clear_tnt] minecraft:tnt 1", "tag remove @a bingo_clear_tnt"], categories: 2, weight: 1}
data modify storage bingo:main categories[{name:"gunpowder"}].items append from storage bingo:tmp item
data modify storage bingo:main categories[{name:"sand"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:lapis_block", itemTextComponent: '{"translate": "block.minecraft.lapis_block", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:lapis_block"}}}', icon: '"\\u0111"', clearCommand: ["clear @a[tag=bingo_clear_lapis_block] minecraft:lapis_block 1", "tag remove @a bingo_clear_lapis_block"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"lapis"}].items append from storage bingo:tmp item

data modify storage bingo:tmp item set value {id: "minecraft:dispenser", itemTextComponent: '{"translate": "block.minecraft.dispenser", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:dispenser"}}}', icon: '"\\u0112"', clearCommand: ["clear @a[tag=bingo_clear_dispenser] minecraft:dispenser 1", "tag remove @a bingo_clear_dispenser"], categories: 1, weight: 1}
data modify storage bingo:main categories[{name:"bow"}].items append from storage bingo:tmp item

# regenerate card
scoreboard players operation $seed random_main = Seed bingo_stats
function random:set_seed

function bingo:card_generation/generate_card