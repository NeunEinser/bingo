#> bingo:lobby/chest_generation/initialize_chests
#
# This function removes all chests and sets the initial two.
#
# @within function bingo:lobby/chest_generation/generate_item_chests

fill ~ ~ ~ ~1 255 ~ minecraft:air replace minecraft:chest

setblock ~ ~ ~ minecraft:chest[type=left]
setblock ~1 ~ ~ minecraft:chest[type=right]

function bingo:lobby/chest_generation/category_iter