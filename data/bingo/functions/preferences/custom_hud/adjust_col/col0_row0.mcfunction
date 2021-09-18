#> bingo:preferences/custom_hud/adjust_col/col0_row0
#
# Executes the selected action for row 0
#
# @within function bingo:preferences/custom_hud/adjust_col/col0
# @context entity Player who triggered bingo.pref
#
# @reads score @s bingo.pref
# @writes storage bingo:custom_hud currentPlayer.components

execute if score @s bingo.pref matches 47 run data modify storage tmp.bingo:preferences/hud toBeAdded set from storage bingo:custom_hud currentPlayer.components[0]
execute if score @s bingo.pref matches 47 run function bingo:preferences/custom_hud/add_to_col1
data modify storage bingo:custom_hud currentPlayer.components[0] set from storage bingo:custom_hud currentPlayer.components[1]
data modify storage bingo:custom_hud currentPlayer.components[1] set from storage bingo:custom_hud currentPlayer.components[2]
data modify storage bingo:custom_hud currentPlayer.components[2] set from storage bingo:custom_hud currentPlayer.components[3]
data modify storage bingo:custom_hud currentPlayer.components[3] set from storage bingo:custom_hud currentPlayer.components[4]
data modify storage bingo:custom_hud currentPlayer.components[4] set from storage bingo:custom_hud currentPlayer.components[5]
data modify storage bingo:custom_hud currentPlayer.components[5] set value {id: "bingo:blank", padding: '{"translate": "space.91"}'}