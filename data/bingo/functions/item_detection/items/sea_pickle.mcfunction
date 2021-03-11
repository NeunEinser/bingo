#> bingo:item_detection/items/sea_pickle
#
# Triggered when the player obtains a minecraft:sea_pickle
#
# @within advancement bingo:item_detection/sea_pickle
# @handles advancement bingo:item_detection/sea_pickle

#>
# @private
#declare score_holder $item_detect/sea_pickle.success

execute store success score $item_detect/sea_pickle.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:sea_pickle"}}] run data modify storage bingo:card slots[{item:{id:"bingo:sea_pickle"}}].selected set value true
execute if score $item_detect/sea_pickle.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce