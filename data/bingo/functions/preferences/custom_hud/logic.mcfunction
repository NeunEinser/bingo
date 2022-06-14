#> bingo:preferences/custom_hud/logic
#
# @within tag/function bingo:preferences/custom_hud
# @handles #bingo:preferences/custom_hud
# @context entity Player who triggered bingo.pref
# @reads
# 	storage bingo:custom_hud components
# 	storage bingo:custom_hud currentPlayer.components

#> 
# @private
#declare score_holder $preferences/hud.total_count
execute store result score $preferences/hud.total_count bingo.tmp run data get storage bingo:custom_hud components
#> 
# @private
#declare score_holder $preferences/hud.enabled_count

# Workaround for https://bugs.mojang.com/browse/MC-236889 :mad_neun:
data modify storage tmp.bingo:preferences/hud activeComponents set from storage bingo:custom_hud currentPlayer.components
data remove storage tmp.bingo:preferences/hud activeComponents[{id: "bingo:empty"}]
data remove storage tmp.bingo:preferences/hud activeComponents[{id: "bingo:spacer"}]

execute store result score $preferences/hud.enabled_count bingo.tmp run data get storage tmp.bingo:preferences/hud activeComponents
execute if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}].custom.bingo{chunkCoordinatesOnTreasureMap: true} run scoreboard players add $preferences/hud.enabled_count bingo.tmp 1

execute if score $preferences/hud.enabled_count bingo.tmp = $preferences/hud.total_count bingo.tmp run data modify storage io.bingo:preferences menuOptions[{id: "bingo:custom_hud/add_disabled"}].disabled set value true

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.bingo:preferences/hud hudComponent set from storage bingo:custom_hud currentPlayer.components[0]
execute if data storage tmp.bingo:preferences/hud hudComponent{id: "bingo:empty"} run data modify storage io.bingo:preferences menuOptions[{id: "bingo:custom_hud/adjust_col0"}].disabled set value true

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.bingo:preferences/hud hudComponent set from storage bingo:custom_hud currentPlayer.components[5]
execute if data storage tmp.bingo:preferences/hud hudComponent{id: "bingo:empty"} run data modify storage io.bingo:preferences menuOptions[{id: "bingo:custom_hud/adjust_col1"}].disabled set value true