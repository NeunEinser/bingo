#> bingo:item_detection/items/book
#
# Triggered when the player obtains a minecraft:book
#
# @within advancement bingo:item_detection/book
# @handles advancement bingo:item_detection/book

#>
# @private
#declare score_holder $item_detect/book.success

execute store success score $item_detect/book.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:book"}}] run data modify storage bingo:card slots[{item:{id:"bingo:book"}}].selected set value true
execute if score $item_detect/book.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce