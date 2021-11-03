#> bingo:preferences/custom_hud/adjust_col/col1_row1
#
# Executes the selected action for row 1
#
# @within function bingo:preferences/custom_hud/adjust_col/col1
# @context entity Player who triggered bingo.pref
#
# @reads score @s bingo.pref
# @writes storage bingo:custom_hud currentPlayer.components

execute if score @s bingo.pref matches 61 run data modify storage tmp.bingo:preferences/hud swap set from storage bingo:custom_hud currentPlayer.components[6]
execute if score @s bingo.pref matches 61 run data modify storage bingo:custom_hud currentPlayer.components[6] set from storage bingo:custom_hud currentPlayer.components[5]
execute if score @s bingo.pref matches 61 run data modify storage bingo:custom_hud currentPlayer.components[5] set from storage tmp.bingo:preferences/hud swap

execute if score @s bingo.pref matches 62 run data modify storage tmp.bingo:preferences/hud toBeAdded set from storage bingo:custom_hud currentPlayer.components[6]
execute if score @s bingo.pref matches 62 run function bingo:preferences/custom_hud/add_to_col0
execute if score @s bingo.pref matches 62..63 run data modify storage bingo:custom_hud currentPlayer.components[6] set from storage bingo:custom_hud currentPlayer.components[7]
execute if score @s bingo.pref matches 62..63 run data modify storage bingo:custom_hud currentPlayer.components[7] set from storage bingo:custom_hud currentPlayer.components[8]
execute if score @s bingo.pref matches 62..63 run data modify storage bingo:custom_hud currentPlayer.components[8] set from storage bingo:custom_hud currentPlayer.components[9]
execute if score @s bingo.pref matches 62..63 run data modify storage bingo:custom_hud currentPlayer.components[9] set from storage bingo:custom_hud currentPlayer.components[10]
execute if score @s bingo.pref matches 62..63 run data modify storage bingo:custom_hud currentPlayer.components[10] set value {id: "bingo:empty", padding: '{"translate": "space.91"}'}