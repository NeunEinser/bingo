#> bingo:preferences/custom_hud
#
# @within function bingo:preferences/exec
# @context entity Player who triggered bingo.pref

data modify storage tmp.bingo:preferences playerHuds set from storage bingo:custom_hud players
data modify storage tmp.bingo:preferences skippedHuds set value []
function bingo:preferences/find_player
data modify storage bingo:custom_hud currentPlayer set from storage tmp.bingo:preferences skippedHuds[0]

execute if score @s bingo.pref matches 5 run data modify storage io.bingo:preferences menuOptions set from storage bingo:registries preferences.custom_hud
execute if score @s bingo.pref matches 5 run function #bingo:preferences/custom_hud
execute if score @s bingo.pref matches 5 run tellraw @s ["\n\n\n=== ", {"translate": "bingo.preferences.custom_hud.title", "bold": true, "color": "green"}, " ===\n\n", {"translate": "bingo.preferences.custom_hud.description", "color": "gray"}, "\n"]

#>
# @api
#declare tag/function bingo:preferences/custom_hud/adjust_card
execute if score @s bingo.pref matches 9 run data modify storage io.bingo:preferences menuOptions set from storage bingo:registries preferences.adjust_card
execute if score @s bingo.pref matches 9 run function #bingo:preferences/custom_hud/adjust_card
execute if score @s bingo.pref matches 9 run tellraw @s ["\n\n\n=== ", {"translate": "bingo.preferences.custom_hud.adjust_card.title", "bold": true, "color": "green"}, " ===\n\n", {"translate": "bingo.preferences.custom_hud.adjust_card.description", "color": "gray"}, "\n"]