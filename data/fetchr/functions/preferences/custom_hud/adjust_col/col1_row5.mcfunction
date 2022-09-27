#> fetchr:preferences/custom_hud/adjust_col/col1_row5
#
# Executes the selected action for row 5
#
# @within function fetchr:preferences/custom_hud/adjust_col/col1
# @context entity Player who triggered fetchr.pref
#
# @reads score @s fetchr.pref
# @writes storage fetchr:custom_hud currentPlayer.components

execute if score @s fetchr.pref matches 49 run data modify storage tmp.fetchr:preferences/hud swap set from storage fetchr:custom_hud currentPlayer.components[10]
execute if score @s fetchr.pref matches 49 run data modify storage fetchr:custom_hud currentPlayer.components[10] set from storage fetchr:custom_hud currentPlayer.components[9]
execute if score @s fetchr.pref matches 49 run data modify storage fetchr:custom_hud currentPlayer.components[9] set from storage tmp.fetchr:preferences/hud swap

execute if score @s fetchr.pref matches 50 run data modify storage tmp.fetchr:preferences/hud toBeAdded set from storage fetchr:custom_hud currentPlayer.components[10]
execute if score @s fetchr.pref matches 50 run function fetchr:preferences/custom_hud/add_to_col0
execute if score @s fetchr.pref matches 50..51 run data modify storage fetchr:custom_hud currentPlayer.components[10] set value {id: "fetchr:empty"}