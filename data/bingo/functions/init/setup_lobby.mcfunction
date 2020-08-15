forceload add -8 -8 7 7

# card generation
setblock -3 64 -12 minecraft:structure_block[mode=load]{mode:"LOAD",name:"bingo:lobby/card_generation"}
setblock -3 65 -12 minecraft:redstone_block

# settings
setblock 8 64 -8 minecraft:structure_block[mode=load]{mode:"LOAD",name:"bingo:lobby/settings"}
setblock 8 65 -8 minecraft:redstone_block
setblock 4 62 4 minecraft:barrier
setblock 4 63 4 minecraft:chiseled_quartz_block

kill @e[type=minecraft:item_frame, tag=bingo_card_frame]
scoreboard players set $i bingo_tmp 0
execute positioned -2 68 -11 run function bingo:init/spawn_card_preview_frames

forceload remove -8 -8 7 7

# setup for executing commands from string
forceload add ~ ~
setblock ~ ~ ~ minecraft:command_block[facing=east]{Command: "data merge block ~ ~ ~ {auto: false}"}