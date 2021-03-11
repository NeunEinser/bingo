#> bingo:item_detection/items/blast_furnace
#
# Triggered when the player obtains a minecraft:blast_furnace
#
# @within advancement bingo:item_detection/blast_furnace
# @handles advancement bingo:item_detection/blast_furnace

#>
# @private
#declare score_holder $item_detect/blast_furnace.success

execute store success score $item_detect/blast_furnace.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:blast_furnace"}}]
execute if score $item_detect/blast_furnace.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce