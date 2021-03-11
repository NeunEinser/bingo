#> bingo:item_detection/items/milk_bucket
#
# Triggered when the player obtains a minecraft:milk_bucket
#
# @within advancement bingo:item_detection/milk_bucket
# @handles advancement bingo:item_detection/milk_bucket

#>
# @private
#declare score_holder $item_detect/milk_bucket.success

execute store success score $item_detect/milk_bucket.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:milk_bucket"}}]
execute if score $item_detect/milk_bucket.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce