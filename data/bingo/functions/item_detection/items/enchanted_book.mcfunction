#> bingo:item_detection/items/enchanted_book
#
# Triggered when the player obtains a minecraft:enchanted_book
#
# @within advancement bingo:item_detection/enchanted_book
# @handles advancement bingo:item_detection/enchanted_book

#>
# @private
#declare score_holder $item_detect/enchanted_book.success

execute store success score $item_detect/enchanted_book.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:enchanted_book"}}] run data modify storage bingo:card slots[{item:{id:"bingo:enchanted_book"}}].selected set value true
execute if score $item_detect/enchanted_book.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce