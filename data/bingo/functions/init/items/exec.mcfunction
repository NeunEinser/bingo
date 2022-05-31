#> bingo:init/items/exec
#
# Initializes everything related to items
#
# @within
# 	function bingo:init/init
# 	function bingo:init/items/exec

data modify storage tmp.bingo:init items set from storage bingo:registries items
data modify storage bingo:items categories set from storage bingo:registries categories
data remove storage bingo:items items

function bingo:init/items/first_pass
function bingo:init/items/second_pass

execute unless data storage bingo:items activeTags run data modify storage bingo:items activeTags set value ["bingo:default"]
# Schedule to avoid maxCommandChainLength being hit (setting it in init doesn't work the first time)
schedule function bingo:util/apply_active_item_tags 1t
