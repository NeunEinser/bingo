#> fetchr:preferences/custom_hud/adjust_col/col0_row0
#
# Executes the selected action for row 0
#
# @within function fetchr:preferences/custom_hud/adjust_col/col0
# @context entity Player who triggered fetchr.pref
#
# @reads score @s fetchr.pref
# @writes storage fetchr:custom_hud currentPlayer.components

execute if score @s fetchr.pref matches 44 run data modify storage tmp.fetchr:preferences/hud toBeAdded set from storage fetchr:custom_hud currentPlayer.components[0]
execute if score @s fetchr.pref matches 44 run function fetchr:preferences/custom_hud/add_to_col1
data modify storage fetchr:custom_hud currentPlayer.components[0] set from storage fetchr:custom_hud currentPlayer.components[1]
data modify storage fetchr:custom_hud currentPlayer.components[1] set from storage fetchr:custom_hud currentPlayer.components[2]
data modify storage fetchr:custom_hud currentPlayer.components[2] set from storage fetchr:custom_hud currentPlayer.components[3]
data modify storage fetchr:custom_hud currentPlayer.components[3] set from storage fetchr:custom_hud currentPlayer.components[4]
data modify storage fetchr:custom_hud currentPlayer.components[4] set value {id: "fetchr:empty", padding: '{"translate": "space.91"}'}