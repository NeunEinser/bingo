#> bingo:item_detection/update_card
#
# Updates the card for all teams
#
# @within structure bingo:machinery

#>
# @within
# 	function bingo:item_detection/update_card
# 	function bingo:item_detection/update_card_iter
#declare storage tmp.bingo:item_detect/update_card

data modify storage tmp.bingo:item_detect/update_card handledTeams set value []
setblock 0 0 0 minecraft:oak_sign
function bingo:item_detection/update_card_iter
setblock 0 0 0 minecraft:barrier

data modify storage bingo:card teams set from storage tmp.bingo:item_detect/update_card handledTeams