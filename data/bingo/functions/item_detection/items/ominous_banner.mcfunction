#> bingo:item_detection/items/ominous_banner
#
# Triggered when the player obtains a minecraft:ominous_banner
#
# @within advancement bingo:item_detection/ominous_banner
# @handles advancement bingo:item_detection/ominous_banner

#>
# @private
#declare score_holder $item_detect/ominous_banner.success

execute store success score $item_detect/ominous_banner.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:ominous_banner"}}]
execute if score $item_detect/ominous_banner.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce