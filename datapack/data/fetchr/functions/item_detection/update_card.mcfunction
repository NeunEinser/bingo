#> fetchr:item_detection/update_card
#
# Updates the card for all teams
#
# @within structure fetchr:machinery

#>
# @within
# 	function fetchr:item_detection/update_card
# 	function fetchr:item_detection/update_card_iter
#declare storage tmp.fetchr:item_detect/update_card

data modify storage tmp.fetchr:item_detect/update_card handledTeams set value []
setblock 0 0 0 minecraft:oak_sign
function fetchr:item_detection/update_card_iter
setblock 0 0 0 minecraft:barrier

data modify storage fetchr:card teams set from storage tmp.fetchr:item_detect/update_card handledTeams