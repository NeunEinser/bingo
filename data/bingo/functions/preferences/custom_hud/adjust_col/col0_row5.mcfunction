#> bingo:preferences/custom_hud/adjust_col/col0_row5
#
# Executes the selected action for row 5
#
# @within function bingo:preferences/custom_hud/adjust_col/col0
# @context entity Player who triggered bingo.pref
#
# @reads score @s bingo.pref
# @writes storage bingo:custom_hud currentPlayer.components

execute if score @s bingo.pref matches 32 run data modify storage tmp.bingo:preferences/hud swap set from storage bingo:custom_hud currentPlayer.components[5]
execute if score @s bingo.pref matches 32 run data modify storage bingo:custom_hud currentPlayer.components[5] set from storage bingo:custom_hud currentPlayer.components[4]
execute if score @s bingo.pref matches 32 run data modify storage bingo:custom_hud currentPlayer.components[4] set from storage tmp.bingo:preferences/hud swap

execute if score @s bingo.pref matches 33 run data modify storage tmp.bingo:preferences/hud toBeAdded set from storage bingo:custom_hud currentPlayer.components[5]
execute if score @s bingo.pref matches 33 run function bingo:preferences/custom_hud/add_to_col1
execute if score @s bingo.pref matches 33..34 run data modify storage bingo:custom_hud currentPlayer.components[5] set value {id: "bingo:blank", padding: '{"translate": "space.91"}'}