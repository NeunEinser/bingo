#> bingo:item_detection/items/cod_bucket
#
# Triggered when the player obtains a minecraft:cod_bucket
#
# @within advancement bingo:item_detection/cod_bucket
# @handles advancement bingo:item_detection/cod_bucket

#>
# @private
#declare score_holder $item_detect/cod_bucket.success

execute store success score $item_detect/cod_bucket.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:cod_bucket"}}]
execute if score $item_detect/cod_bucket.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce