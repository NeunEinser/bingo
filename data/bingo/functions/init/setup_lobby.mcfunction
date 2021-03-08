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
setblock -9 64 -12 minecraft:structure_block[mode=load]{mode:"LOAD", name:"bingo:lobby/card_generation", posY: -1}
setblock -9 65 -12 minecraft:redstone_block

# settings
setblock 9 64 -12 minecraft:structure_block[mode=load]{mode:"LOAD", name:"bingo:lobby/settings"}
setblock 9 65 -12 minecraft:redstone_block
setblock 5 62 0 minecraft:barrier
setblock 5 63 0 minecraft:chiseled_quartz_block

kill @e[type=minecraft:item_frame, tag=bingo.card_frame]
scoreboard players set $card_frames/spawn.i bingo.tmp 0
execute positioned -2 68 -11 run function bingo:init/spawn_card_preview_frames

forceload remove -8 -8 7 7

# setup for executing commands from string
forceload add 0 0
setblock 0 0 0 minecraft:command_block[facing=east]{Command: "data merge block ~ ~ ~ {auto: false}"}