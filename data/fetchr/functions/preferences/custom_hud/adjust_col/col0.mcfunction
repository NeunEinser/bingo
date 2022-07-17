#> fetchr:preferences/custom_hud/adjust_col/col0
#
# Executes the selected action for column 0
#
# @within function fetchr:preferences/custom_hud/show
# @context entity Player who triggered fetchr.pref
#
# @reads score @s fetchr.pref

execute if score @s fetchr.pref matches 32..34 run function fetchr:preferences/custom_hud/adjust_col/col0_row4
execute if score @s fetchr.pref matches 35..37 run function fetchr:preferences/custom_hud/adjust_col/col0_row3
execute if score @s fetchr.pref matches 38..40 run function fetchr:preferences/custom_hud/adjust_col/col0_row2
execute if score @s fetchr.pref matches 41..43 run function fetchr:preferences/custom_hud/adjust_col/col0_row1
execute if score @s fetchr.pref matches 44..45 run function fetchr:preferences/custom_hud/adjust_col/col0_row0

execute if score @s fetchr.pref matches 46 run function fetchr:preferences/custom_hud/adjust_col/col0_add_spacer
data modify storage fetchr:custom_hud currentPlayer.components[0].slot_id set value 0b
data modify storage fetchr:custom_hud currentPlayer.components[1].slot_id set value 1b
data modify storage fetchr:custom_hud currentPlayer.components[2].slot_id set value 2b
data modify storage fetchr:custom_hud currentPlayer.components[3].slot_id set value 3b
data modify storage fetchr:custom_hud currentPlayer.components[4].slot_id set value 4b

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.fetchr:preferences/hud firstComponent set from storage fetchr:custom_hud currentPlayer.components[0]
execute unless data storage tmp.fetchr:preferences/hud firstComponent{id: "fetchr:empty"} run scoreboard players set $preferences.next_page fetchr.tmp 9
execute if data storage tmp.fetchr:preferences/hud firstComponent{id: "fetchr:empty"} run scoreboard players set $preferences.next_page fetchr.tmp 5