#> bingo:init/setup_lobby
#
# This function places relevant structures in the lobby.
#
# @within function bingo:init/init
# @context
# 	dimension bingo:lobby

#Temporary forceload to make sure all needed chunks are actually loaded.
#This forceload is undone at the end of the function
forceload add -8 -8 7 7

# card generation
setblock -5 64 -14 minecraft:structure_block[mode=load]{mode:"LOAD", name:"bingo:lobby/card_generation"}
setblock -5 65 -14 minecraft:redstone_block

# settings
setblock 9 64 -8 minecraft:structure_block[mode=load]{mode:"LOAD", name:"bingo:lobby/settings"}
setblock 9 65 -8 minecraft:redstone_block
#setblock 5 62 0 minecraft:barrier
#setblock 5 0 0 minecraft:chiseled_quartz_block

# Team selection
setblock -18 64 -3 minecraft:structure_block[mode=load]{mode:"LOAD", name:"bingo:lobby/team_selection"}
setblock -18 65 -3 minecraft:redstone_block

# card frames
function bingo:card_frames/spawn

forceload remove -8 -8 7 7

# setup command blocks for item detection

#>
# This tag marks a player who is in a team that obtained the item in slot 0.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot0
#>
# This tag marks a player who is in a team that obtained the item in slot 1.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot1
#>
# This tag marks a player who is in a team that obtained the item in slot 2.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot2
#>
# This tag marks a player who is in a team that obtained the item in slot 3.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot3
#>
# This tag marks a player who is in a team that obtained the item in slot 4.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot4
#>
# This tag marks a player who is in a team that obtained the item in slot 5.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot5
#>
# This tag marks a player who is in a team that obtained the item in slot 6.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot6
#>
# This tag marks a player who is in a team that obtained the item in slot 7.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot7
#>
# This tag marks a player who is in a team that obtained the item in slot 8.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot8
#>
# This tag marks a player who is in a team that obtained the item in slot 9.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot9
#>
# This tag marks a player who is in a team that obtained the item in slot 10.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot10
#>
# This tag marks a player who is in a team that obtained the item in slot 11.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot11
#>
# This tag marks a player who is in a team that obtained the item in slot 12.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot12
#>
# This tag marks a player who is in a team that obtained the item in slot 13.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot13
#>
# This tag marks a player who is in a team that obtained the item in slot 14.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot14
#>
# This tag marks a player who is in a team that obtained the item in slot 15.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot15
#>
# This tag marks a player who is in a team that obtained the item in slot 16.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot16
#>
# This tag marks a player who is in a team that obtained the item in slot 17.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot17
#>
# This tag marks a player who is in a team that obtained the item in slot 18.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot18
#>
# This tag marks a player who is in a team that obtained the item in slot 19.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot19
#>
# This tag marks a player who is in a team that obtained the item in slot 20.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot20
#>
# This tag marks a player who is in a team that obtained the item in slot 21.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot21
#>
# This tag marks a player who is in a team that obtained the item in slot 22.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot22
#>
# This tag marks a player who is in a team that obtained the item in slot 23.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot23
#>
# This tag marks a player who is in a team that obtained the item in slot 24.
#
# @within
# 	function bingo:init/setup_lobby
# 	function bingo:card_generation/generate_card
#declare tag bingo.has_slot24

forceload add 0 0
## Slot 0
setblock 0 0 0 minecraft:repeating_command_block[facing=east]{auto: false, Command: "function bingo:item_detection/remove_tags"}
setblock 1 0 0 minecraft:chain_command_block[facing=east]{auto: true}
setblock 2 0 0 minecraft:chain_command_block[facing=east]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[0]"}
setblock 3 0 0 minecraft:chain_command_block[facing=east]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot0] run function bingo:item_detection/announce"}
setblock 4 0 0 minecraft:chain_command_block[facing=east]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot0"}
setblock 5 0 0 minecraft:chain_command_block[facing=east]{auto: true}

## Slot 1
setblock 6 0 0 minecraft:chain_command_block[facing=east]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 7 0 0 minecraft:chain_command_block[facing=east]{auto: true}
setblock 8 0 0 minecraft:chain_command_block[facing=east]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[1]"}
setblock 9 0 0 minecraft:chain_command_block[facing=east]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot1] run function bingo:item_detection/announce"}
setblock 10 0 0 minecraft:chain_command_block[facing=east]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot1"}
setblock 11 0 0 minecraft:chain_command_block[facing=east]{auto: true}

## Slot 2
setblock 12 0 0 minecraft:chain_command_block[facing=east]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 13 0 0 minecraft:chain_command_block[facing=east]{auto: true}
setblock 14 0 0 minecraft:chain_command_block[facing=east]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[2]"}
setblock 15 0 0 minecraft:chain_command_block[facing=south]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot2] run function bingo:item_detection/announce"}
setblock 15 0 1 minecraft:chain_command_block[facing=west]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot2"}
setblock 14 0 1 minecraft:chain_command_block[facing=west]{auto: true}

## Slot 3
setblock 13 0 1 minecraft:chain_command_block[facing=west]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 12 0 1 minecraft:chain_command_block[facing=west]{auto: true}
setblock 11 0 1 minecraft:chain_command_block[facing=west]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[3]"}
setblock 10 0 1 minecraft:chain_command_block[facing=west]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot3] run function bingo:item_detection/announce"}
setblock 9 0 1 minecraft:chain_command_block[facing=west]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot3"}
setblock 8 0 1 minecraft:chain_command_block[facing=west]{auto: true}

## Slot 4
setblock 7 0 1 minecraft:chain_command_block[facing=west]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 6 0 1 minecraft:chain_command_block[facing=west]{auto: true}
setblock 5 0 1 minecraft:chain_command_block[facing=west]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[4]"}
setblock 4 0 1 minecraft:chain_command_block[facing=west]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot4] run function bingo:item_detection/announce"}
setblock 3 0 1 minecraft:chain_command_block[facing=west]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot4"}
setblock 2 0 1 minecraft:chain_command_block[facing=west]{auto: true}

## Slot 5
setblock 1 0 1 minecraft:chain_command_block[facing=west]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 0 0 1 minecraft:chain_command_block[facing=south]{auto: true}
setblock 0 0 2 minecraft:chain_command_block[facing=east]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[5]"}
setblock 1 0 2 minecraft:chain_command_block[facing=east]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot5] run function bingo:item_detection/announce"}
setblock 2 0 2 minecraft:chain_command_block[facing=east]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot5"}
setblock 3 0 2 minecraft:chain_command_block[facing=east]{auto: true}

## Slot 6
setblock 4 0 2 minecraft:chain_command_block[facing=east]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 5 0 2 minecraft:chain_command_block[facing=east]{auto: true}
setblock 6 0 2 minecraft:chain_command_block[facing=east]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[6]"}
setblock 7 0 2 minecraft:chain_command_block[facing=east]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot6] run function bingo:item_detection/announce"}
setblock 8 0 2 minecraft:chain_command_block[facing=east]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot6"}
setblock 9 0 2 minecraft:chain_command_block[facing=east]{auto: true}

## Slot 7
setblock 10 0 2 minecraft:chain_command_block[facing=east]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 11 0 2 minecraft:chain_command_block[facing=east]{auto: true}
setblock 12 0 2 minecraft:chain_command_block[facing=east]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[7]"}
setblock 13 0 2 minecraft:chain_command_block[facing=east]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot7] run function bingo:item_detection/announce"}
setblock 14 0 2 minecraft:chain_command_block[facing=east]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot7"}
setblock 15 0 2 minecraft:chain_command_block[facing=south]{auto: true}

## Slot 8
setblock 15 0 3 minecraft:chain_command_block[facing=west]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 14 0 3 minecraft:chain_command_block[facing=west]{auto: true}
setblock 13 0 3 minecraft:chain_command_block[facing=west]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[8]"}
setblock 12 0 3 minecraft:chain_command_block[facing=west]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot8] run function bingo:item_detection/announce"}
setblock 11 0 3 minecraft:chain_command_block[facing=west]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot8"}
setblock 10 0 3 minecraft:chain_command_block[facing=west]{auto: true}

## Slot 9
setblock 9 0 3 minecraft:chain_command_block[facing=west]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 8 0 3 minecraft:chain_command_block[facing=west]{auto: true}
setblock 7 0 3 minecraft:chain_command_block[facing=west]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[9]"}
setblock 6 0 3 minecraft:chain_command_block[facing=west]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot9] run function bingo:item_detection/announce"}
setblock 5 0 3 minecraft:chain_command_block[facing=west]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot9"}
setblock 4 0 3 minecraft:chain_command_block[facing=west]{auto: true}

## Slot 10
setblock 3 0 3 minecraft:chain_command_block[facing=west]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 2 0 3 minecraft:chain_command_block[facing=west]{auto: true}
setblock 1 0 3 minecraft:chain_command_block[facing=west]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[10]"}
setblock 0 0 3 minecraft:chain_command_block[facing=south]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot10] run function bingo:item_detection/announce"}
setblock 0 0 4 minecraft:chain_command_block[facing=east]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot10"}
setblock 1 0 4 minecraft:chain_command_block[facing=east]{auto: true}

## Slot 11
setblock 2 0 4 minecraft:chain_command_block[facing=east]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 3 0 4 minecraft:chain_command_block[facing=east]{auto: true}
setblock 4 0 4 minecraft:chain_command_block[facing=east]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[11]"}
setblock 5 0 4 minecraft:chain_command_block[facing=east]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot11] run function bingo:item_detection/announce"}
setblock 6 0 4 minecraft:chain_command_block[facing=east]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot11"}
setblock 7 0 4 minecraft:chain_command_block[facing=east]{auto: true}

## Slot 12
setblock 8 0 4 minecraft:chain_command_block[facing=east]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 9 0 4 minecraft:chain_command_block[facing=east]{auto: true}
setblock 10 0 4 minecraft:chain_command_block[facing=east]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[12]"}
setblock 11 0 4 minecraft:chain_command_block[facing=east]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot12] run function bingo:item_detection/announce"}
setblock 12 0 4 minecraft:chain_command_block[facing=east]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot12"}
setblock 13 0 4 minecraft:chain_command_block[facing=east]{auto: true}

## Slot 13
setblock 14 0 4 minecraft:chain_command_block[facing=east]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 15 0 4 minecraft:chain_command_block[facing=south]{auto: true}
setblock 15 0 5 minecraft:chain_command_block[facing=west]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[13]"}
setblock 14 0 5 minecraft:chain_command_block[facing=west]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot13] run function bingo:item_detection/announce"}
setblock 13 0 5 minecraft:chain_command_block[facing=west]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot13"}
setblock 12 0 5 minecraft:chain_command_block[facing=west]{auto: true}

## Slot 14
setblock 11 0 5 minecraft:chain_command_block[facing=west]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 10 0 5 minecraft:chain_command_block[facing=west]{auto: true}
setblock 9 0 5 minecraft:chain_command_block[facing=west]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[14]"}
setblock 8 0 5 minecraft:chain_command_block[facing=west]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot14] run function bingo:item_detection/announce"}
setblock 7 0 5 minecraft:chain_command_block[facing=west]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot14"}
setblock 6 0 5 minecraft:chain_command_block[facing=west]{auto: true}

## Slot 15
setblock 5 0 5 minecraft:chain_command_block[facing=west]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 4 0 5 minecraft:chain_command_block[facing=west]{auto: true}
setblock 3 0 5 minecraft:chain_command_block[facing=west]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[15]"}
setblock 2 0 5 minecraft:chain_command_block[facing=west]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot15] run function bingo:item_detection/announce"}
setblock 1 0 5 minecraft:chain_command_block[facing=west]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot15"}
setblock 0 0 5 minecraft:chain_command_block[facing=south]{auto: true}

## Slot 16
setblock 0 0 6 minecraft:chain_command_block[facing=east]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 1 0 6 minecraft:chain_command_block[facing=east]{auto: true}
setblock 2 0 6 minecraft:chain_command_block[facing=east]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[16]"}
setblock 3 0 6 minecraft:chain_command_block[facing=east]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot16] run function bingo:item_detection/announce"}
setblock 4 0 6 minecraft:chain_command_block[facing=east]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot16"}
setblock 5 0 6 minecraft:chain_command_block[facing=east]{auto: true}

## Slot 17
setblock 6 0 6 minecraft:chain_command_block[facing=east]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 7 0 6 minecraft:chain_command_block[facing=east]{auto: true}
setblock 8 0 6 minecraft:chain_command_block[facing=east]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[17]"}
setblock 9 0 6 minecraft:chain_command_block[facing=east]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot17] run function bingo:item_detection/announce"}
setblock 10 0 6 minecraft:chain_command_block[facing=east]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot17"}
setblock 11 0 6 minecraft:chain_command_block[facing=east]{auto: true}

## Slot 18
setblock 12 0 6 minecraft:chain_command_block[facing=east]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 13 0 6 minecraft:chain_command_block[facing=east]{auto: true}
setblock 14 0 6 minecraft:chain_command_block[facing=east]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[18]"}
setblock 15 0 6 minecraft:chain_command_block[facing=south]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot18] run function bingo:item_detection/announce"}
setblock 15 0 7 minecraft:chain_command_block[facing=west]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot18"}
setblock 14 0 7 minecraft:chain_command_block[facing=west]{auto: true}

## Slot 19
setblock 13 0 7 minecraft:chain_command_block[facing=west]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 12 0 7 minecraft:chain_command_block[facing=west]{auto: true}
setblock 11 0 7 minecraft:chain_command_block[facing=west]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[19]"}
setblock 10 0 7 minecraft:chain_command_block[facing=west]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot19] run function bingo:item_detection/announce"}
setblock 9 0 7 minecraft:chain_command_block[facing=west]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot19"}
setblock 8 0 7 minecraft:chain_command_block[facing=west]{auto: true}

## Slot 20
setblock 7 0 7 minecraft:chain_command_block[facing=west]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 6 0 7 minecraft:chain_command_block[facing=west]{auto: true}
setblock 5 0 7 minecraft:chain_command_block[facing=west]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[20]"}
setblock 4 0 7 minecraft:chain_command_block[facing=west]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot20] run function bingo:item_detection/announce"}
setblock 3 0 7 minecraft:chain_command_block[facing=west]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot20"}
setblock 2 0 7 minecraft:chain_command_block[facing=west]{auto: true}

## Slot 21
setblock 1 0 7 minecraft:chain_command_block[facing=west]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 0 0 7 minecraft:chain_command_block[facing=south]{auto: true}
setblock 0 0 8 minecraft:chain_command_block[facing=east]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[21]"}
setblock 1 0 8 minecraft:chain_command_block[facing=east]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot21] run function bingo:item_detection/announce"}
setblock 2 0 8 minecraft:chain_command_block[facing=east]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot21"}
setblock 3 0 8 minecraft:chain_command_block[facing=east]{auto: true}

## Slot 22
setblock 4 0 8 minecraft:chain_command_block[facing=east]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 5 0 8 minecraft:chain_command_block[facing=east]{auto: true}
setblock 6 0 8 minecraft:chain_command_block[facing=east]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[22]"}
setblock 7 0 8 minecraft:chain_command_block[facing=east]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot22] run function bingo:item_detection/announce"}
setblock 8 0 8 minecraft:chain_command_block[facing=east]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot22"}
setblock 9 0 8 minecraft:chain_command_block[facing=east]{auto: true}

## Slot 23
setblock 10 0 8 minecraft:chain_command_block[facing=east]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 11 0 8 minecraft:chain_command_block[facing=east]{auto: true}
setblock 12 0 8 minecraft:chain_command_block[facing=east]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[23]"}
setblock 13 0 8 minecraft:chain_command_block[facing=east]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot23] run function bingo:item_detection/announce"}
setblock 14 0 8 minecraft:chain_command_block[facing=east]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot23"}
setblock 15 0 8 minecraft:chain_command_block[facing=south]{auto: true}

## Slot 24
setblock 15 0 9 minecraft:chain_command_block[facing=west]{auto: true, Command: "function bingo:item_detection/remove_tags"}
setblock 14 0 9 minecraft:chain_command_block[facing=west]{auto: true}
setblock 13 0 9 minecraft:chain_command_block[facing=west]{auto: true, Command: "data modify storage temp:bingo.input/item_detection slot set from storage bingo:card slots[24]"}
setblock 12 0 9 minecraft:chain_command_block[facing=west]{auto: true, Command: "execute as @a[predicate=!bingo:is_in_lobby, scores={bingo.has_item=1}, tag=!bingo.has_slot24] run function bingo:item_detection/announce"}
setblock 11 0 9 minecraft:chain_command_block[facing=west]{auto: true, Command: "tag @a[tag=bingo.in_current_team] add bingo.has_slot24"}
setblock 10 0 9 minecraft:chain_command_block[facing=west]{auto: true}