#> fetchr:init/command_block_check
#
# This function checks if command blocks are enabled and waits for the overworld
# to be loaded.
#
# @within
# 	function fetchr:init/init
# 	function fetchr:init/command_block_check

setblock 0 4 0 minecraft:air
setblock 0 4 0 minecraft:command_block{auto: true, Command: "scoreboard players set $commandblocks_enabled fetchr.state 1"}
execute unless loaded 0 0 0 run schedule function fetchr:init/command_block_check 1t