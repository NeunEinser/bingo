#> bingo:preferences/exec
#
# Shows the preferences page the player just selected.
#
# @within function bingo:tick/tick
# @context entity Player who triggered bingo.pref
# @user

#>
# This storage contains the menuOptions nbt, which can be modified in functions
# referenced in #bingo:preferences/* function tags to set disabled and hidden
# attributes on specific entries.
#
# @api
#declare storage io.bingo:preferences
#>
# @within bingo:preferences/*
#declare storage tmp.bingo:preferences

#>
# @api
#declare tag/function bingo:preferences/main

execute if score @s bingo.pref matches 1 run data modify storage io.bingo:preferences menuOptions set from storage bingo:registries preferences.main
execute if score @s bingo.pref matches 1 run function #bingo:preferences/main
execute if score @s bingo.pref matches 1 run tellraw @s ["\n\n\n=== ", {"translate": "bingo.preferences.title", "bold": true, "color": "green"}, " ===\n\n", {"translate": "bingo.preferences.description", "color": "gray"}, "\n"]

execute if score @s bingo.pref matches 5..9 run function bingo:preferences/custom_hud

function bingo:preferences/print_menu_items
scoreboard players reset @s bingo.pref