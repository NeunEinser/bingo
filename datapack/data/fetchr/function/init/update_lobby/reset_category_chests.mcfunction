#> fetchr:init/update_lobby/reset_category_chests
#
# Resets category chest area
#
# @within function fetchr:init/update_lobby/update_structure_callback

fill ~ ~ ~ ~1 63 ~ minecraft:air replace minecraft:chest
#NEUN_SCRIPT until 62
#fill ~-2 ~2 ~-2 ~3 63 ~-2 minecraft:glass replace minecraft:scaffolding
#fill ~-2 ~2 ~-2 ~3 63 ~-2 minecraft:air replace minecraft:glass
#NEUN_SCRIPT end
#NEUN_SCRIPT since 62
fill ~-2 ~2 ~-2 ~3 63 ~-2 minecraft:air replace minecraft:scaffolding strict
#NEUN_SCRIPT end
fill ~-3 ~3 ~-3 ~4 63 ~2 minecraft:air replace #fetchr:chest_room_ceiling_blocks
setblock ~-3 ~2 ~-3 minecraft:structure_block[mode=load]{ name: "fetchr:chest_ceiling", ignoreEntities: false, posY: 0, mode: "LOAD" }
setblock ~-3 ~3 ~-3 minecraft:redstone_block
setblock ~-3 ~2 ~-3 minecraft:gray_concrete