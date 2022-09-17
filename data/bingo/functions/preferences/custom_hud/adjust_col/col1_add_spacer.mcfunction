#> bingo:preferences/custom_hud/adjust_col/col1_add_spacer
#
# Adds a spacer in col 1
#
# @within function bingo:preferences/custom_hud/adjust_col/col1
# @context entity Player who triggered bingo.pref
#
# @reads score @s bingo.pref
# @writes storage bingo:custom_hud currentPlayer.components

data modify storage tmp.bingo:preferences/hud toBeAdded set value {id: "bingo:spacer", name: '{"translate": "bingo.custom_hud.components.spacer"}'}
function bingo:preferences/custom_hud/add_to_col1

scoreboard players set $preferences.next_page bingo.tmp 10