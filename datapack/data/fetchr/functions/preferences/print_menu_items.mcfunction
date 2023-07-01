#> fetchr:preferences/print_menu_items
#
# This function prints all entries for menu items within the menuOptions array
#
# @within
# 	fetchr:preferences/show
# 	fetchr:preferences/print_menu_items
# @context entity Player who triggered fetchr.pref
# @input storage io.fetchr:preferences menuOptions

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.fetchr:preferences menuOption set from storage io.fetchr:preferences menuOptions[0]

execute unless data storage tmp.fetchr:preferences menuOption{disabled: true} unless data storage tmp.fetchr:preferences menuOption{hidden: true} run tellraw @s ["[", {"storage": "tmp.fetchr:preferences", "nbt": "menuOption.clickEvent", "interpret": true, "color": "#00c3ff", "extra": [{"storage": "tmp.fetchr:preferences", "nbt": "menuOption.textComponent", "interpret": true, "hoverEvent": {"action": "show_text", "contents": {"storage": "tmp.fetchr:preferences", "nbt": "menuOption.hoverText", "interpret": true, "color": "gold"}}}]}, "]"]

execute if data storage tmp.fetchr:preferences menuOption{disabled: true} unless data storage tmp.fetchr:preferences menuOption{hidden: true} run tellraw @s ["[", {"storage": "tmp.fetchr:preferences", "nbt": "menuOption.textComponent", "interpret": true, "color": "gray", "hoverEvent": {"action": "show_text", "contents": {"storage": "tmp.fetchr:preferences", "nbt": "menuOption.disabledHoverText", "interpret": true, "color": "yellow"}}}, "]"]

data remove storage io.fetchr:preferences menuOptions[0]
execute if data storage io.fetchr:preferences menuOptions[0] run function fetchr:preferences/print_menu_items