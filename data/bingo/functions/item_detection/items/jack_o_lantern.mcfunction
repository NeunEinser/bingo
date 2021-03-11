#> bingo:item_detection/items/jack_o_lantern
#
# Triggered when the player obtains a minecraft:jack_o_lantern
#
# @within advancement bingo:item_detection/jack_o_lantern
# @handles advancement bingo:item_detection/jack_o_lantern

#>
# @private
#declare score_holder $item_detect/jack_o_lantern.success

execute store success score $item_detect/jack_o_lantern.success bingo.tmp if data storage bingo:card slots[{item:{id:"bingo:jack_o_lantern"}}] run data modify storage bingo:card slots[{item:{id:"bingo:jack_o_lantern"}}].selected set value true
execute if score $item_detect/jack_o_lantern.success bingo.tmp matches 1 run function bingo:item_detection/helper/check_and_announce