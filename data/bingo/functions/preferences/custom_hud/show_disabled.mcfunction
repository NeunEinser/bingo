#> bingo:preferences/custom_hud/show_disabled
#
# Shows the dialog for enableing disabled hud components
#
# @within
# 	function bingo:preferences/custom_hud/show
# 	function bingo:preferences/custom_hud/add_disabled/exec
# @context entity Player who triggered bingo.pref
# @reads
# 	storage bingo:custom_hud currentPlayer.components
# 	storage bingo:custom_hud components

execute if score @s bingo.pref matches 6 run scoreboard players set @s bingo.menu_page 0
execute if score @s bingo.pref matches 7 run scoreboard players remove @s bingo.menu_page 1
execute if score @s bingo.pref matches 8 run scoreboard players add @s bingo.menu_page 1

scoreboard players set $preferences/hud.page bingo.tmp 0
scoreboard players set $preferences/hud.element bingo.tmp 0
data modify storage io.bingo:preferences components set from storage bingo:custom_hud components
function #bingo:preferences/custom_hud/filter_disabled
data modify storage tmp.bingo:preferences/hud pageElements set value []
data modify storage tmp.bingo:preferences/hud playerComponents set from storage bingo:custom_hud currentPlayer.components
data remove storage tmp.bingo:preferences/hud playerComponents[{id: "bingo:empty"}]
function bingo:preferences/custom_hud/select_page

tellraw @s ["\n\n\n\n\n=== ", {"translate": "bingo.preferences.custom_hud.add_disabled.title", "bold": true, "color": "green"}, " ===\n\n", {"translate": "bingo.preferences.custom_hud.add_disabled.description", "color": "gray"}, "\n"]

data modify storage tmp.bingo:preferences/hud addCol0 set value '""'
data modify storage tmp.bingo:preferences/hud addCol1 set value '""'
data modify storage tmp.bingo:preferences/hud col01Space set value '""'

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.bingo:preferences/hud hudComponent set from storage bingo:custom_hud currentPlayer.components[4]
execute if data storage tmp.bingo:preferences/hud hudComponent{id: "bingo:empty"} run data modify storage tmp.bingo:preferences/hud addCol0 set value '["[", {"translate": "bingo.preferences.custom_hud.add_disabled.add_col0.title", "color": "#00c3ff", "hoverEvent": {"action": "show_text", "contents": {"translate": "bingo.preferences.custom_hud.add_disabled.add.description", "color": "gold"}}}, "]"]'
# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.bingo:preferences/hud hudComponent set from storage bingo:custom_hud currentPlayer.components[10]
execute if data storage tmp.bingo:preferences/hud hudComponent{id: "bingo:empty"} run data modify storage tmp.bingo:preferences/hud addCol1 set value '["[", {"translate": "bingo.preferences.custom_hud.add_disabled.add_col1.title", "color": "#00c3ff", "hoverEvent": {"action": "show_text", "contents": {"translate": "bingo.preferences.custom_hud.add_disabled.add.description", "color": "gold"}}}, "]"]'
execute unless data storage tmp.bingo:preferences/hud {addCol0: '""'} unless data storage tmp.bingo:preferences/hud {addCol1: '""'} run data modify storage tmp.bingo:preferences/hud col01Space set value '" "'

tellraw @s [{"storage": "tmp.bingo:preferences/hud", "nbt": "pageElements[0].name", "interpret": true}, " ", {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol0", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 12"}}, {"storage": "tmp.bingo:preferences/hud", "nbt": "col01Space", "interpret": true}, {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol1", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 13"}}]
execute if data storage tmp.bingo:preferences/hud pageElements[1] run tellraw @s [{"storage": "tmp.bingo:preferences/hud", "nbt": "pageElements[1].name", "interpret": true}, " ", {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol0", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 14"}}, {"storage": "tmp.bingo:preferences/hud", "nbt": "col01Space", "interpret": true}, {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol1", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 15"}}]
execute if data storage tmp.bingo:preferences/hud pageElements[2] run tellraw @s [{"storage": "tmp.bingo:preferences/hud", "nbt": "pageElements[2].name", "interpret": true}, " ", {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol0", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 16"}}, {"storage": "tmp.bingo:preferences/hud", "nbt": "col01Space", "interpret": true}, {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol1", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 17"}}]
execute if data storage tmp.bingo:preferences/hud pageElements[3] run tellraw @s [{"storage": "tmp.bingo:preferences/hud", "nbt": "pageElements[3].name", "interpret": true}, " ", {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol0", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 18"}}, {"storage": "tmp.bingo:preferences/hud", "nbt": "col01Space", "interpret": true}, {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol1", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 19"}}]
execute if data storage tmp.bingo:preferences/hud pageElements[4] run tellraw @s [{"storage": "tmp.bingo:preferences/hud", "nbt": "pageElements[4].name", "interpret": true}, " ", {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol0", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 20"}}, {"storage": "tmp.bingo:preferences/hud", "nbt": "col01Space", "interpret": true}, {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol1", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 21"}}]
execute if data storage tmp.bingo:preferences/hud pageElements[5] run tellraw @s [{"storage": "tmp.bingo:preferences/hud", "nbt": "pageElements[5].name", "interpret": true}, " ", {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol0", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 22"}}, {"storage": "tmp.bingo:preferences/hud", "nbt": "col01Space", "interpret": true}, {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol1", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 23"}}]
execute if data storage tmp.bingo:preferences/hud pageElements[6] run tellraw @s [{"storage": "tmp.bingo:preferences/hud", "nbt": "pageElements[6].name", "interpret": true}, " ", {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol0", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 24"}}, {"storage": "tmp.bingo:preferences/hud", "nbt": "col01Space", "interpret": true}, {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol1", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 25"}}]
execute if data storage tmp.bingo:preferences/hud pageElements[7] run tellraw @s [{"storage": "tmp.bingo:preferences/hud", "nbt": "pageElements[7].name", "interpret": true}, " ", {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol0", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 26"}}, {"storage": "tmp.bingo:preferences/hud", "nbt": "col01Space", "interpret": true}, {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol1", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 27"}}]
execute if data storage tmp.bingo:preferences/hud pageElements[8] run tellraw @s [{"storage": "tmp.bingo:preferences/hud", "nbt": "pageElements[8].name", "interpret": true}, " ", {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol0", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 28"}}, {"storage": "tmp.bingo:preferences/hud", "nbt": "col01Space", "interpret": true}, {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol1", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 29"}}]
execute if data storage tmp.bingo:preferences/hud pageElements[9] run tellraw @s [{"storage": "tmp.bingo:preferences/hud", "nbt": "pageElements[9].name", "interpret": true}, " ", {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol0", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 30"}}, {"storage": "tmp.bingo:preferences/hud", "nbt": "col01Space", "interpret": true}, {"storage": "tmp.bingo:preferences/hud", "nbt": "addCol1", "interpret": true, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 31"}}]

#> 
# @private
#declare score_holder $preferences/hud.enabled_count
execute store result score $preferences/hud.enabled_count bingo.tmp run data get storage tmp.bingo:preferences/hud playerComponents
#> 
# @private
#declare score_holder $preferences/hud.page_count
execute store result score $preferences/hud.page_count bingo.tmp run data get storage bingo:custom_hud components
scoreboard players operation $preferences/hud.page_count bingo.tmp -= $preferences/hud.enabled_count bingo.tmp
scoreboard players remove $preferences/hud.page_count bingo.tmp 1
scoreboard players operation $preferences/hud.page_count bingo.tmp /= 10 bingo.const

data modify storage tmp.bingo:preferences/hud prev set value '["[", {"translate": "bingo.preferences.previous", "color": "gray"}, "]"]'
data modify storage tmp.bingo:preferences/hud next set value '["[", {"translate": "bingo.preferences.next", "color": "gray"}, "]"]'

execute if score @s bingo.menu_page matches 1.. run data modify storage tmp.bingo:preferences/hud prev set value '["[", {"translate": "bingo.preferences.previous", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 7"}}, "]"]'
execute if score @s bingo.menu_page < $preferences/hud.page_count bingo.tmp run data modify storage tmp.bingo:preferences/hud next set value '["[", {"translate": "bingo.preferences.next", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 8"}}, "]"]'

scoreboard players add $preferences/hud.page_count bingo.tmp 1
scoreboard players operation $preferences/hud.page bingo.tmp = @s bingo.menu_page
scoreboard players add $preferences/hud.page bingo.tmp 1
execute unless data storage tmp.bingo:preferences/hud {prev: '["[", {"translate": "bingo.preferences.previous", "color": "gray"}, "]"]', next: '["[", {"translate": "bingo.preferences.next", "color": "gray"}, "]"]'} run tellraw @s ["\n", {"storage": "tmp.bingo:preferences/hud", "nbt": "prev", "interpret": true}, " ", {"storage": "tmp.bingo:preferences/hud", "nbt": "next", "interpret": true}, " ", {"translate": "bingo.preferences.page", "with": [{"score": {"name": "$preferences/hud.page", "objective": "bingo.tmp"}}, {"score": {"name": "$preferences/hud.page_count", "objective": "bingo.tmp"}}]}]

tellraw @s ["\n[", {"translate": "bingo.preferences.back", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 5"}}, "]"]