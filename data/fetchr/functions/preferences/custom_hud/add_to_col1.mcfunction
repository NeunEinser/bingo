#> fetchr:preferences/custom_hud/add_to_col1
#
# Adds the given component to the current player's 1st column
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
data modify storage tmp.fetchr:preferences/hud filledComponets append from storage fetchr:custom_hud currentPlayer.components[5]
data modify storage tmp.fetchr:preferences/hud filledComponets append from storage fetchr:custom_hud currentPlayer.components[6]
data modify storage tmp.fetchr:preferences/hud filledComponets append from storage fetchr:custom_hud currentPlayer.components[7]
data modify storage tmp.fetchr:preferences/hud filledComponets append from storage fetchr:custom_hud currentPlayer.components[8]
data modify storage tmp.fetchr:preferences/hud filledComponets append from storage fetchr:custom_hud currentPlayer.components[9]
data modify storage tmp.fetchr:preferences/hud filledComponets append from storage fetchr:custom_hud currentPlayer.components[10]

data remove storage tmp.fetchr:preferences/hud filledComponets[{id: "fetchr:empty"}]

# At least this makes it a little bit better, but still :mad_neun:
execute store result score $preferences/hud/add.slot fetchr.tmp run data get storage tmp.fetchr:preferences/hud filledComponets
scoreboard players add $preferences/hud/add.slot fetchr.tmp 5
#endregion

execute store result storage tmp.fetchr:preferences/hud toBeAdded.slot_id byte 1 run scoreboard players get $preferences/hud/add.slot fetchr.tmp
execute if score $preferences/hud/add.slot fetchr.tmp matches 5 run data modify storage fetchr:custom_hud currentPlayer.components[5] set from storage tmp.fetchr:preferences/hud toBeAdded
execute if score $preferences/hud/add.slot fetchr.tmp matches 6 run data modify storage fetchr:custom_hud currentPlayer.components[6] set from storage tmp.fetchr:preferences/hud toBeAdded
execute if score $preferences/hud/add.slot fetchr.tmp matches 7 run data modify storage fetchr:custom_hud currentPlayer.components[7] set from storage tmp.fetchr:preferences/hud toBeAdded
execute if score $preferences/hud/add.slot fetchr.tmp matches 8 run data modify storage fetchr:custom_hud currentPlayer.components[8] set from storage tmp.fetchr:preferences/hud toBeAdded
execute if score $preferences/hud/add.slot fetchr.tmp matches 9 run data modify storage fetchr:custom_hud currentPlayer.components[9] set from storage tmp.fetchr:preferences/hud toBeAdded
execute if score $preferences/hud/add.slot fetchr.tmp matches 10 run data modify storage fetchr:custom_hud currentPlayer.components[10] set from storage tmp.fetchr:preferences/hud toBeAdded