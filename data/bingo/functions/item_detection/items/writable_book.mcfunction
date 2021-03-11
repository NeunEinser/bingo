#> bingo:item_detection/items/writable_book
#
# Triggered when the player obtains a minecraft:writable_book
#
# @within advancement bingo:item_detection/writable_book
# @handles advancement bingo:item_detection/writable_book

#>
# @private
#declare score_holder $item_detect/writable_book.success

execute store success score $item_detect/writable_book.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:writable_book"}}]
execute if score $item_detect/writable_book.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce