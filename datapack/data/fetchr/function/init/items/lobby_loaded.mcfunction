#> fetchr:init/items/lobby_loaded
#
# This function is called after the lobby loaded. The lobby is required for
# properly initializing everything.
#
# @within
# 	function fetchr:init/items/exec
# 	function fetchr:init/setup_lobby/end

data modify storage tmp.fetchr:init items set from storage fetchr:registries items
data modify storage fetchr:items categories set from storage fetchr:registries categories
data remove storage fetchr:items items

function fetchr:init/items/first_pass
schedule function fetchr:init/items/second_pass 1t

execute unless data storage fetchr:items activeTags run data modify storage fetchr:items activeTags set value ["fetchr:default"]
# Schedule to avoid maxCommandChainLength being hit (setting it in init doesn't work the first time)
schedule function fetchr:util/apply_active_item_tags 2t