#> bingo:item_detection/items/beetroot_soup
#
# Triggered when the player obtains a minecraft:beetroot_soup
#
# @within advancement bingo:item_detection/beetroot_soup
# @handles advancement bingo:item_detection/beetroot_soup

#>
# @private
#declare score_holder $item_detect/beetroot_soup.success

execute store success score $item_detect/beetroot_soup.success bingo.tmp run data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[{item:{id:"bingo:beetroot_soup"}}]
execute if score $item_detect/beetroot_soup.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce