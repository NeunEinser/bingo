#> bingo:command_queue/init_for_new_tick
#
# This function initializes some values and entities needed for a run.
# It will only be executed once per tick.
#
# The area effect cloud spawned can be used as an indicator whether this
# function was already run in the current tick.
#
# The area effect cloud can be identified by the tag "bingp.command".
#
# @within function bingo:command_queue/run

#>
# This tag identifies the area effect cloud used to set the command blocks.
#
# @within function bingo:command_queue/**
#declare tag bingo.command

summon minecraft:area_effect_cloud 1 0 0 {Tags: ["bingo.command"]}
data merge block 0 0 0 {auto: true}
scoreboard players set $command_queue.x bingo.tmp 1
scoreboard players set $command_queue.y bingo.tmp 0
scoreboard players set $command_queue.z bingo.tmp 0