#> bingo:init/initialize_hud_components/add_defaults
#
# @within
# 	function bingo:init/init
# 	function bingo:init/initialize_hud_components/add_defaults

# Need to copy because you can't combine indexed access with conditions like
# hud_components[0]{preferredColum:1} for checking if index 0 specifically
# matches preferedColumn of 1
data modify storage tmp.bingo:init/hud cur set from storage bingo:registries hud_components[0]
data remove storage bingo:registries hud_components[0]

execute unless data storage tmp.bingo:init/hud cur.iconSeparatorAlignLeft run data modify storage tmp.bingo:init/hud cur.iconSeparatorAlignLeft set from storage tmp.bingo:init/hud cur.iconSeparator
execute unless data storage tmp.bingo:init/hud cur.iconSeparatorAlignRight run data modify storage tmp.bingo:init/hud cur.iconSeparatorAlignRight set from storage tmp.bingo:init/hud cur.iconSeparator
data remove storage tmp.bingo:init/hud cur.iconSeparator

setblock 0 255 0 minecraft:oak_sign{Text1: '["[", {"storage": "tmp.bingo:init/hud", "nbt": "cur.settingsClickEvent", "interpret": true, "color": "#00c3ff", "bold": true, "hoverEvent": {"action": "show_text", "contents": {"translate": "bingo.preferences.custom_hud.adjust_col.settings.hover_text", "color": "gold"}}, "extra": ["⚙"]}, "] "]'}
execute if data storage tmp.bingo:init/hud cur.settingsClickEvent run data modify storage tmp.bingo:init/hud cur.settingsTextComponent set from block 0 255 0 Text1
setblock 0 255 0 minecraft:air
data remove storage tmp.bingo:init/hud cur.settingsClickEvent

execute if data storage tmp.bingo:init/hud cur{addByDefault: true, preferredColumn: 0} if data storage tmp.bingo:init/hud columns[0][4] run function bingo:init/initialize_hud_components/add_unpreferred
execute if data storage tmp.bingo:init/hud cur{addByDefault: true, preferredColumn: 0} unless data storage tmp.bingo:init/hud columns[0][4] run function bingo:init/initialize_hud_components/add_to_0

execute if data storage tmp.bingo:init/hud cur{addByDefault: true, preferredColumn: 1} if data storage tmp.bingo:init/hud columns[1][5] run function bingo:init/initialize_hud_components/add_unpreferred
execute if data storage tmp.bingo:init/hud cur{addByDefault: true, preferredColumn: 1} unless data storage tmp.bingo:init/hud columns[1][5] run function bingo:init/initialize_hud_components/add_to_1

execute if data storage tmp.bingo:init/hud cur{addByDefault: true} unless data storage tmp.bingo:init/hud cur.preferredColumn run data modify storage tmp.bingo:init/hud whereSpace append from storage tmp.bingo:init/hud cur
execute unless data storage tmp.bingo:init/hud cur{addByDefault: true} run data modify storage tmp.bingo:init/hud dontAdd append from storage tmp.bingo:init/hud cur

execute if data storage bingo:registries hud_components[0] run function bingo:init/initialize_hud_components/add_defaults