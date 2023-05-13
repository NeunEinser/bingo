#> fetchr:init/initialize_hud_components/add_defaults
#
# @within
# 	function fetchr:init/init
# 	function fetchr:init/initialize_hud_components/add_defaults

# Need to copy because you can't combine indexed access with conditions like
# hud_components[0]{preferredColum:1} for checking if index 0 specifically
# matches preferedColumn of 1
data modify storage tmp.fetchr:init/hud cur set from storage fetchr:registries hud_components[0]
data remove storage fetchr:registries hud_components[0]

execute unless data storage tmp.fetchr:init/hud cur.iconSeparatorAlignLeft run data modify storage tmp.fetchr:init/hud cur.iconSeparatorAlignLeft set from storage tmp.fetchr:init/hud cur.iconSeparator
execute unless data storage tmp.fetchr:init/hud cur.iconSeparatorAlignRight run data modify storage tmp.fetchr:init/hud cur.iconSeparatorAlignRight set from storage tmp.fetchr:init/hud cur.iconSeparator
data remove storage tmp.fetchr:init/hud cur.iconSeparator

setblock 0 15 0 minecraft:oak_sign{front_text: {messages: ['["[", {"storage": "tmp.fetchr:init/hud", "nbt": "cur.settingsClickEvent", "interpret": true, "color": "#00c3ff", "bold": true, "hoverEvent": {"action": "show_text", "contents": {"translate": "fetchr.preferences.custom_hud.adjust_col.settings.hover_text", "color": "gold"}}, "extra": ["⚙"]}, "] "]']}}
execute if data storage tmp.fetchr:init/hud cur.settingsClickEvent run data modify storage tmp.fetchr:init/hud cur.settingsTextComponent set from block 0 15 0 front_text.messages[0]
setblock 0 15 0 minecraft:air
data remove storage tmp.fetchr:init/hud cur.settingsClickEvent

execute if data storage tmp.fetchr:init/hud cur{addByDefault: true, preferredColumn: 0} if data storage tmp.fetchr:init/hud columns[0][4] run function fetchr:init/initialize_hud_components/add_unpreferred
execute if data storage tmp.fetchr:init/hud cur{addByDefault: true, preferredColumn: 0} unless data storage tmp.fetchr:init/hud columns[0][4] run function fetchr:init/initialize_hud_components/add_to_0

execute if data storage tmp.fetchr:init/hud cur{addByDefault: true, preferredColumn: 1} if data storage tmp.fetchr:init/hud columns[1][5] run function fetchr:init/initialize_hud_components/add_unpreferred
execute if data storage tmp.fetchr:init/hud cur{addByDefault: true, preferredColumn: 1} unless data storage tmp.fetchr:init/hud columns[1][5] run function fetchr:init/initialize_hud_components/add_to_1

execute if data storage tmp.fetchr:init/hud cur{addByDefault: true} unless data storage tmp.fetchr:init/hud cur.preferredColumn run data modify storage tmp.fetchr:init/hud whereSpace append from storage tmp.fetchr:init/hud cur
execute unless data storage tmp.fetchr:init/hud cur{addByDefault: true} run data modify storage tmp.fetchr:init/hud dontAdd append from storage tmp.fetchr:init/hud cur

execute if data storage fetchr:registries hud_components[0] run function fetchr:init/initialize_hud_components/add_defaults