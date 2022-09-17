#> bingo:preferences/custom_hud/adjust_col/col0_add_spacer
#
# Adds a spacer in col 0
#
# @within function bingo:preferences/custom_hud/adjust_col/col0
# @context entity Player who triggered bingo.pref
#
# @reads score @s bingo.pref
# @writes storage bingo:custom_hud currentPlayer.components

data modify storage tmp.bingo:preferences/hud toBeAdded set value {id: "bingo:spacer", name: '{"translate": "bingo.custom_hud.components.spacer"}'}
function bingo:preferences/custom_hud/add_to_col0

scoreboard players set $preferences.next_page bingo.tmp 9