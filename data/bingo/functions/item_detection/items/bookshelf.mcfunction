#> bingo:item_detection/items/bookshelf
#
# Triggered when the player obtains a minecraft:bookshelf
#
# @within advancement bingo:item_detection/bookshelf
# @handles advancement bingo:item_detection/bookshelf

#>
# @private
#declare score_holder $item_detect/bookshelf.success

execute store success score $item_detect/bookshelf.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:bookshelf"}}]
execute if score $item_detect/bookshelf.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce