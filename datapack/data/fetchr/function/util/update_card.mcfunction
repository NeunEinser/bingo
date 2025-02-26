#> fetchr:util/update_card
#
# Updates the card for all teams
#
# @internal

#>
# @within
# 	function fetchr:util/update_card
# 	function fetchr:util/update_card_iter
#declare storage tmp.fetchr:item_detect/update_card

data modify storage tmp.fetchr:item_detect/update_card handledTeams set value []
function fetchr:util/update_card_iter

data modify storage fetchr:card teams set from storage tmp.fetchr:item_detect/update_card handledTeams