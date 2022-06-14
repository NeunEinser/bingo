#> bingo:preferences/custom_hud/adjust_col/col1
#
# Executes the selected action for column 1
#
# @within function bingo:preferences/custom_hud/show
# @context entity Player who triggered bingo.pref
#
# @reads score @s bingo.pref

execute if score @s bingo.pref matches 49..51 run function bingo:preferences/custom_hud/adjust_col/col1_row5
execute if score @s bingo.pref matches 52..54 run function bingo:preferences/custom_hud/adjust_col/col1_row4
execute if score @s bingo.pref matches 55..57 run function bingo:preferences/custom_hud/adjust_col/col1_row3
execute if score @s bingo.pref matches 58..60 run function bingo:preferences/custom_hud/adjust_col/col1_row2
execute if score @s bingo.pref matches 61..63 run function bingo:preferences/custom_hud/adjust_col/col1_row1
execute if score @s bingo.pref matches 64..65 run function bingo:preferences/custom_hud/adjust_col/col1_row0

execute if score @s bingo.pref matches 66 run function bingo:preferences/custom_hud/adjust_col/col1_add_spacer
data modify storage bingo:custom_hud currentPlayer.components[5].slot_id set value 5b
data modify storage bingo:custom_hud currentPlayer.components[6].slot_id set value 6b
data modify storage bingo:custom_hud currentPlayer.components[7].slot_id set value 7b
data modify storage bingo:custom_hud currentPlayer.components[8].slot_id set value 8b
data modify storage bingo:custom_hud currentPlayer.components[9].slot_id set value 9b
data modify storage bingo:custom_hud currentPlayer.components[10].slot_id set value 10b

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.bingo:preferences/hud firstComponent set from storage bingo:custom_hud currentPlayer.components[5]
execute unless data storage tmp.bingo:preferences/hud firstComponent{id: "bingo:empty"} run scoreboard players set $preferences.next_page bingo.tmp 10
execute if data storage tmp.bingo:preferences/hud firstComponent{id: "bingo:empty"} run scoreboard players set $preferences.next_page bingo.tmp 5