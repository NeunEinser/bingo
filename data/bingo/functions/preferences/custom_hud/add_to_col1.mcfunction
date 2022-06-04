#> bingo:preferences/custom_hud/add_to_col1
#
# Adds the given component to the current player's 1st column
#
# @within function bingo:preferences/custom_hud/**
#
# @input storage tmp.bingo:preferences/hud toBeAdded
# @writes storage bingo:custom_hud currentPlayer.components

#region Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
#>
# @private
#declare score_holder $preferences/hud/add.slot

data modify storage tmp.bingo:preferences/hud filledComponets set value []
data modify storage tmp.bingo:preferences/hud filledComponets append from storage bingo:custom_hud currentPlayer.components[5]
data modify storage tmp.bingo:preferences/hud filledComponets append from storage bingo:custom_hud currentPlayer.components[6]
data modify storage tmp.bingo:preferences/hud filledComponets append from storage bingo:custom_hud currentPlayer.components[7]
data modify storage tmp.bingo:preferences/hud filledComponets append from storage bingo:custom_hud currentPlayer.components[8]
data modify storage tmp.bingo:preferences/hud filledComponets append from storage bingo:custom_hud currentPlayer.components[9]
data modify storage tmp.bingo:preferences/hud filledComponets append from storage bingo:custom_hud currentPlayer.components[10]

data remove storage tmp.bingo:preferences/hud filledComponets[{id: "bingo:empty"}]

# At least this makes it a little bit better, but still :mad_neun:
execute store result score $preferences/hud/add.slot bingo.tmp run data get storage tmp.bingo:preferences/hud filledComponets
scoreboard players add $preferences/hud/add.slot bingo.tmp 5
#endregion

execute store result storage tmp.bingo:preferences/hud toBeAdded.slot_id byte 1 run scoreboard players get $preferences/hud/add.slot bingo.tmp
execute if score $preferences/hud/add.slot bingo.tmp matches 5 run data modify storage bingo:custom_hud currentPlayer.components[5] set from storage tmp.bingo:preferences/hud toBeAdded
execute if score $preferences/hud/add.slot bingo.tmp matches 6 run data modify storage bingo:custom_hud currentPlayer.components[6] set from storage tmp.bingo:preferences/hud toBeAdded
execute if score $preferences/hud/add.slot bingo.tmp matches 7 run data modify storage bingo:custom_hud currentPlayer.components[7] set from storage tmp.bingo:preferences/hud toBeAdded
execute if score $preferences/hud/add.slot bingo.tmp matches 8 run data modify storage bingo:custom_hud currentPlayer.components[8] set from storage tmp.bingo:preferences/hud toBeAdded
execute if score $preferences/hud/add.slot bingo.tmp matches 9 run data modify storage bingo:custom_hud currentPlayer.components[9] set from storage tmp.bingo:preferences/hud toBeAdded
execute if score $preferences/hud/add.slot bingo.tmp matches 10 run data modify storage bingo:custom_hud currentPlayer.components[10] set from storage tmp.bingo:preferences/hud toBeAdded