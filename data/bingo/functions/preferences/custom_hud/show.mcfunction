#> bingo:preferences/custom_hud/show
#
# Shows the currently selected custom hud menu page
#
# @within function bingo:preferences/show
# @context entity Player who triggered bingo.pref
# @reads
# 	storage bingo:custom_hud players
# 	storage bingo:registries preferences.custom_hud
# @writes torage bingo:custom_hud currentPlayer

#>
# @within function bingo:preferences/custom_hud/*
#declare storage tmp.bingo:preferences/hud

data modify storage tmp.bingo:preferences/hud playerHuds set from storage bingo:custom_hud players
data modify storage tmp.bingo:preferences/hud skippedHuds set value []
function bingo:preferences/custom_hud/find_player
data modify storage bingo:custom_hud currentPlayer set from storage tmp.bingo:preferences/hud skippedHuds[0]

execute if score @s bingo.pref matches 5 run data modify storage io.bingo:preferences menuOptions set from storage bingo:registries preferences.custom_hud
execute if score @s bingo.pref matches 5 run function #bingo:preferences/custom_hud
execute if score @s bingo.pref matches 5 run tellraw @s ["\n\n\n=== ", {"translate": "bingo.preferences.custom_hud.title", "bold": true, "color": "green"}, " ===\n\n", {"translate": "bingo.preferences.custom_hud.description", "color": "gray"}, "\n"]

execute if score @s bingo.pref matches 6..8 run function bingo:preferences/custom_hud/show_disabled
execute if score @s bingo.pref matches 9 run function bingo:preferences/custom_hud/show_col0
execute if score @s bingo.pref matches 10 run function bingo:preferences/custom_hud/show_col1

#>
# @api
#declare tag/function bingo:preferences/custom_hud/adjust_card
execute if score @s bingo.pref matches 11 run data modify storage io.bingo:preferences menuOptions set from storage bingo:registries preferences.adjust_card
execute if score @s bingo.pref matches 11 run function #bingo:preferences/custom_hud/adjust_card
execute if score @s bingo.pref matches 11 run tellraw @s ["\n\n\n=== ", {"translate": "bingo.preferences.custom_hud.adjust_card.title", "bold": true, "color": "green"}, " ===\n\n", {"translate": "bingo.preferences.custom_hud.adjust_card.description", "color": "gray"}, "\n"]