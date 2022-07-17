#> fetchr:preferences/custom_hud/add_to_col0
#
# Adds the given component to the current player's 0th column
#
# @within function fetchr:preferences/custom_hud/**
#
# @input storage tmp.fetchr:preferences/hud toBeAdded
# @writes storage fetchr:custom_hud currentPlayer.components

#region Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
#>
# @private
#declare score_holder $preferences/hud/add.slot
data modify storage tmp.fetchr:preferences/hud filledComponets set value []
data modify storage tmp.fetchr:preferences/hud filledComponets append from storage fetchr:custom_hud currentPlayer.components[0]
data modify storage tmp.fetchr:preferences/hud filledComponets append from storage fetchr:custom_hud currentPlayer.components[1]
data modify storage tmp.fetchr:preferences/hud filledComponets append from storage fetchr:custom_hud currentPlayer.components[2]
data modify storage tmp.fetchr:preferences/hud filledComponets append from storage fetchr:custom_hud currentPlayer.components[3]
data modify storage tmp.fetchr:preferences/hud filledComponets append from storage fetchr:custom_hud currentPlayer.components[4]

data remove storage tmp.fetchr:preferences/hud filledComponets[{id: "fetchr:empty"}]

# At least this makes it a little bit better, but still :mad_neun:
execute store result score $preferences/hud/add.slot fetchr.tmp run data get storage tmp.fetchr:preferences/hud filledComponets
#endregion

execute store result storage tmp.fetchr:preferences/hud toBeAdded.slot_id byte 1 run scoreboard players get $preferences/hud/add.slot fetchr.tmp
execute if score $preferences/hud/add.slot fetchr.tmp matches 0 run data modify storage fetchr:custom_hud currentPlayer.components[0] set from storage tmp.fetchr:preferences/hud toBeAdded
execute if score $preferences/hud/add.slot fetchr.tmp matches 1 run data modify storage fetchr:custom_hud currentPlayer.components[1] set from storage tmp.fetchr:preferences/hud toBeAdded
execute if score $preferences/hud/add.slot fetchr.tmp matches 2 run data modify storage fetchr:custom_hud currentPlayer.components[2] set from storage tmp.fetchr:preferences/hud toBeAdded
execute if score $preferences/hud/add.slot fetchr.tmp matches 3 run data modify storage fetchr:custom_hud currentPlayer.components[3] set from storage tmp.fetchr:preferences/hud toBeAdded
execute if score $preferences/hud/add.slot fetchr.tmp matches 4 run data modify storage fetchr:custom_hud currentPlayer.components[4] set from storage tmp.fetchr:preferences/hud toBeAdded