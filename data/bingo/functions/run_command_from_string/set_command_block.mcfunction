execute if score $size bingo.commands matches 2.. run function bingo:run_command_from_string/check_limits
execute if score $size bingo.commands matches 1 run setblock ~ ~ ~ minecraft:chain_command_block[facing=down]{auto: true}

data modify block ~ ~ ~ Command set from storage bingo:commands queue[0]
