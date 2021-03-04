#> bingo:command_queue/iter
#
# One iteration of the command queue. Places one command and is executed again
# automatically until there are no more commands in the given command queue.
#
# @within
# 	function bingo:command_queue/iter
# 	function bingo:command_queue/run

#>
# Score holder to store the size of the current command queue.
#
# @private
#declare score_holder $command_queue/iter.size

execute store result score $command_queue/iter.size bingo.tmp run data get storage temp:bingo.input/command_queue queue
execute if score $command_queue/iter.size bingo.tmp matches 2.. run function bingo:command_queue/claculate_next_position_and_set_command_block/run
execute if score $command_queue/iter.size bingo.tmp matches 1 run setblock ~ ~ ~ minecraft:chain_command_block[facing=down]{auto: true}

data modify block ~ ~ ~ Command set from storage temp:bingo.input/command_queue queue[0]
data remove storage temp:bingo.input/command_queue queue[0]

execute if score $command_queue/iter.size bingo.tmp matches 2.. at @s run function bingo:command_queue/iter