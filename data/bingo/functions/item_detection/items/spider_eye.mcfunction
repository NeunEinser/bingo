#> bingo:item_detection/items/spider_eye
#
# Triggered when the player obtains a minecraft:spider_eye
#
# @within advancement bingo:item_detection/spider_eye
# @handles advancement bingo:item_detection/spider_eye

#>
# @private
#declare score_holder $item_detect/spider_eye.success

execute store success score $item_detect/spider_eye.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:spider_eye"}}]
execute if score $item_detect/spider_eye.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce