#> bingo:preferences/logic
#
# Adapts menu items based on context
#
# @within tag/function bingo:preferences/main
# @handles #bingo:preferences/main
# @context entity Player who triggered bingo.pref
# @reads
# 	storage bingo:custom_hud components
# 	storage bingo:custom_hud currentPlayer.components

execute if entity @s[tag=!bingo.enable_manual_gamemode_switch] run data modify storage io.bingo:preferences menuOptions[{id: "bingo:spectator_mode"}].textComponent set value '[{"translate": "bingo.preferences.spectator_mode.title"}, ": ", {"translate": "bingo.preferences.spectator_mode.enabled"}]'
execute if entity @s[tag=bingo.enable_manual_gamemode_switch] run data modify storage io.bingo:preferences menuOptions[{id: "bingo:spectator_mode"}].textComponent set value '[{"translate": "bingo.preferences.spectator_mode.title"}, ": ", {"translate": "bingo.preferences.spectator_mode.disabled"}]'