#> bingo:command_queue/run
#
# This function runs the command queue.
# The command queue can execute a list of provided commands in the next tick.
#
# @internal
# @input storage temp:bingo.input/command_queue queue

#>
# This storage is used as input by the command queue.
# It may only be read by related functions.
#
# It holds a list of commands to execute in the next tick. The field queue
# is used for that.
#
# @internal
#declare storage temp:bingo.input/command_queue

#>
# This score holder holds the current x coordinate
#
# @within function bingo:command_queue/**
#declare score_holder $command_queue.x
#>
# This score holder holds the current y coordinate
#
# @within function bingo:command_queue/**
#declare score_holder $command_queue.y
#>
# This score holder holds the current z coordinate
#
# @within function bingo:command_queue/**
#declare score_holder $command_queue.z

execute at @e[type=minecraft:area_effect_cloud, tag=bingo.command, limit=1] run data modify storage temp:bingo.input/command_queue queue prepend from block ~ ~ ~ Command
execute unless entity @e[type=minecraft:area_effect_cloud, tag=bingo.command, limit=1] in bingo:lobby run function bingo:command_queue/init_for_new_tick
execute as @e[type=minecraft:area_effect_cloud, tag=bingo.command, limit=1] at @s run function bingo:command_queue/iter