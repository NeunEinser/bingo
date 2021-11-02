#> bingo:preferences/custom_hud/adjust_col/col1_row0
#
# Executes the selected action for row 0
#
# @within function bingo:preferences/custom_hud/adjust_col/col1
# @context entity Player who triggered bingo.pref
#
# @reads score @s bingo.pref
# @writes storage bingo:custom_hud currentPlayer.components

execute if score @s bingo.pref matches 64 run data modify storage tmp.bingo:preferences/hud toBeAdded set from storage bingo:custom_hud currentPlayer.components[5]
execute if score @s bingo.pref matches 64 run function bingo:preferences/custom_hud/add_to_col0
data modify storage bingo:custom_hud currentPlayer.components[5] set from storage bingo:custom_hud currentPlayer.components[6]
data modify storage bingo:custom_hud currentPlayer.components[6] set from storage bingo:custom_hud currentPlayer.components[7]
data modify storage bingo:custom_hud currentPlayer.components[7] set from storage bingo:custom_hud currentPlayer.components[8]
data modify storage bingo:custom_hud currentPlayer.components[8] set from storage bingo:custom_hud currentPlayer.components[9]
data modify storage bingo:custom_hud currentPlayer.components[9] set from storage bingo:custom_hud currentPlayer.components[10]
data modify storage bingo:custom_hud currentPlayer.components[10] set value {id: "bingo:empty", padding: '{"translate": "space.91"}'}