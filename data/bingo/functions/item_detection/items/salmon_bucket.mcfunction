#> bingo:item_detection/items/salmon_bucket
#
# Triggered when the player obtains a minecraft:salmon_bucket
#
# @within advancement bingo:item_detection/salmon_bucket
# @handles advancement bingo:item_detection/salmon_bucket

#>
# @private
#declare score_holder $item_detect/salmon_bucket.success

execute store success score $item_detect/salmon_bucket.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:salmon_bucket"}}]
execute if score $item_detect/salmon_bucket.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce