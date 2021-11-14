#> bingo:preferences/print_menu_items
#
# This function prints all entries for menu items within the menuOptions array
#
# @within
# 	bingo:preferences/show
# 	bingo:preferences/print_menu_items
# @context entity Player who triggered bingo.pref
# @input storage io.bingo:preferences menuOptions

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.bingo:preferences menuOption set from storage io.bingo:preferences menuOptions[0]

#tellraw @s {"storage": "tmp.bingo:preferences", "nbt": "menuOption"}

execute unless data storage tmp.bingo:preferences menuOption{disabled: true} unless data storage tmp.bingo:preferences menuOption{hidden: true} run tellraw @s ["[", {"storage": "tmp.bingo:preferences", "nbt": "menuOption.clickEvent", "interpret": true, "color": "#00c3ff", "extra": [{"storage": "tmp.bingo:preferences", "nbt": "menuOption.textComponent", "interpret": true, "hoverEvent": {"action": "show_text", "contents": {"storage": "tmp.bingo:preferences", "nbt": "menuOption.hoverText", "interpret": true, "color": "gold"}}}]}, "]"]

execute if data storage tmp.bingo:preferences menuOption{disabled: true} unless data storage tmp.bingo:preferences menuOption{hidden: true} run tellraw @s ["[", {"storage": "tmp.bingo:preferences", "nbt": "menuOption.textComponent", "interpret": true, "color": "gray", "hoverEvent": {"action": "show_text", "contents": {"storage": "tmp.bingo:preferences", "nbt": "menuOption.disabledHoverText", "interpret": true, "color": "yellow"}}}, "]"]

data remove storage io.bingo:preferences menuOptions[0]
execute if data storage io.bingo:preferences menuOptions[0] run function bingo:preferences/print_menu_items