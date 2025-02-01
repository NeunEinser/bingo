#> fetchr:lobby/chest_generation/initialize_chests
#
# This function removes all chests and sets the initial two.
#
# @within function fetchr:lobby/chest_generation/generate_item_chests

fill ~ ~ ~ ~1 63 ~ minecraft:air replace minecraft:chest
fill ~-2 ~2 ~-2 ~3 63 ~-2 minecraft:air replace minecraft:scaffolding
fill ~-3 ~3 ~-3 ~4 63 ~2 minecraft:air replace #fetchr:chest_room_ceiling_blocks
setblock ~-3 ~2 ~-3 minecraft:structure_block[mode=load]{ name: "fetchr:chest_ceiling", mode: "LOAD" }
setblock ~-3 ~3 ~-3 minecraft:redstone_block
setblock ~-3 ~2 ~-3 minecraft:gray_concrete
setblock ~ ~ ~ minecraft:chest[type=left]
setblock ~1 ~ ~ minecraft:chest[type=right]

scoreboard players set $chest_generation.height fetchr.tmp 2

function fetchr:lobby/chest_generation/category_iter