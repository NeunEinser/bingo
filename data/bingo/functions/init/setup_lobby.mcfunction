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
#setblock 5 63 0 minecraft:chiseled_quartz_block

# Team selection
setblock -18 64 -3 minecraft:structure_block[mode=load]{mode:"LOAD", name:"bingo:lobby/team_selection"}
setblock -18 65 -3 minecraft:redstone_block

# card frames
function bingo:card_frames/spawn

forceload remove -8 -8 7 7

# setup for executing commands from string
forceload add 0 0
setblock 0 0 0 minecraft:command_block[facing=east]{Command: "data merge block ~ ~ ~ {auto: false}"}