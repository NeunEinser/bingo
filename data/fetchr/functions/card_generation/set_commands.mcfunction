#> fetchr:card_generation/set_commands
#
# Sets the detect and clear commands to the command blocks for item detection
#
# @within function fetchr:card_generation/generate_slot
# @context entity command block marker

#>
# The calculated index of the current slot's command block in the chain
#
# @private
#declare score_holder $card_gen/slot.command_index
#>
# The calculated x coordinate of the current slot's command block in the chain
#
# @private
#declare score_holder $card_gen/slot.x
#>
# The calculated y coordinate of the current slot's command block in the chain
#
# @private
#declare score_holder $card_gen/slot.y
#>
# The calculated z coordinate of the current slot's command block in the chain
#
# @private
#declare score_holder $card_gen/slot.z
#>
# The x coordinate modlus 2
#
# @private
#declare score_holder $card_gen/slot.xmod
#>
# The z coordinate modlus 2
#
# @private
#declare score_holder $card_gen/slot.zmod

#region detection command
scoreboard players set $card_gen/slot.command_index fetchr.tmp 10
scoreboard players operation $card_gen/slot.command_index fetchr.tmp *= $card_gen.slot fetchr.tmp
scoreboard players add $card_gen/slot.command_index fetchr.tmp 4

scoreboard players operation $card_gen/slot.y fetchr.tmp = $card_gen/slot.command_index fetchr.tmp
scoreboard players operation $card_gen/slot.y fetchr.tmp %= 10 fetchr.const
scoreboard players operation $card_gen/slot.x fetchr.tmp = $card_gen/slot.command_index fetchr.tmp
scoreboard players operation $card_gen/slot.x fetchr.tmp /= 10 fetchr.const
scoreboard players operation $card_gen/slot.x fetchr.tmp %= 5 fetchr.const
scoreboard players operation $card_gen/slot.z fetchr.tmp = $card_gen/slot.command_index fetchr.tmp
scoreboard players operation $card_gen/slot.z fetchr.tmp /= 50 fetchr.const

scoreboard players operation $card_gen/slot.xmod fetchr.tmp = $card_gen/slot.x fetchr.tmp
scoreboard players operation $card_gen/slot.xmod fetchr.tmp %= 2 fetchr.const
scoreboard players operation $card_gen/slot.zmod fetchr.tmp = $card_gen/slot.z fetchr.tmp
scoreboard players operation $card_gen/slot.zmod fetchr.tmp %= 2 fetchr.const
execute unless score $card_gen/slot.xmod fetchr.tmp = $card_gen/slot.zmod fetchr.tmp run scoreboard players remove $card_gen/slot.y fetchr.tmp 9
execute if score $card_gen/slot.y fetchr.tmp matches ..-1 run scoreboard players operation $card_gen/slot.y fetchr.tmp *= -1 fetchr.const
execute if score $card_gen/slot.zmod fetchr.tmp matches 1 run scoreboard players remove $card_gen/slot.x fetchr.tmp 4
execute if score $card_gen/slot.zmod fetchr.tmp matches 1 run scoreboard players operation $card_gen/slot.x fetchr.tmp *= -1 fetchr.const

scoreboard players add $card_gen/slot.y fetchr.tmp 3
scoreboard players add $card_gen/slot.x fetchr.tmp 5
scoreboard players add $card_gen/slot.z fetchr.tmp 5

execute store result entity @s Pos[0] double 1 run scoreboard players get $card_gen/slot.x fetchr.tmp
execute store result entity @s Pos[1] double 1 run scoreboard players get $card_gen/slot.y fetchr.tmp
execute store result entity @s Pos[2] double 1 run scoreboard players get $card_gen/slot.z fetchr.tmp
execute at @s run data modify block ~ ~ ~ Command set from storage tmp.fetchr:card_generation items[-1].detectCommand
#endregion

#region clear command
scoreboard players add $card_gen/slot.command_index fetchr.tmp 5

scoreboard players operation $card_gen/slot.y fetchr.tmp = $card_gen/slot.command_index fetchr.tmp
scoreboard players operation $card_gen/slot.y fetchr.tmp %= 10 fetchr.const
scoreboard players operation $card_gen/slot.x fetchr.tmp = $card_gen/slot.command_index fetchr.tmp
scoreboard players operation $card_gen/slot.x fetchr.tmp /= 10 fetchr.const
scoreboard players operation $card_gen/slot.x fetchr.tmp %= 5 fetchr.const
scoreboard players operation $card_gen/slot.z fetchr.tmp = $card_gen/slot.command_index fetchr.tmp
scoreboard players operation $card_gen/slot.z fetchr.tmp /= 50 fetchr.const

scoreboard players operation $card_gen/slot.xmod fetchr.tmp = $card_gen/slot.x fetchr.tmp
scoreboard players operation $card_gen/slot.xmod fetchr.tmp %= 2 fetchr.const
scoreboard players operation $card_gen/slot.zmod fetchr.tmp = $card_gen/slot.z fetchr.tmp
scoreboard players operation $card_gen/slot.zmod fetchr.tmp %= 2 fetchr.const
execute unless score $card_gen/slot.xmod fetchr.tmp = $card_gen/slot.zmod fetchr.tmp run scoreboard players remove $card_gen/slot.y fetchr.tmp 9
execute if score $card_gen/slot.y fetchr.tmp matches ..-1 run scoreboard players operation $card_gen/slot.y fetchr.tmp *= -1 fetchr.const
execute if score $card_gen/slot.zmod fetchr.tmp matches 1 run scoreboard players remove $card_gen/slot.x fetchr.tmp 4
execute if score $card_gen/slot.zmod fetchr.tmp matches 1 run scoreboard players operation $card_gen/slot.x fetchr.tmp *= -1 fetchr.const

scoreboard players add $card_gen/slot.y fetchr.tmp 3
scoreboard players add $card_gen/slot.x fetchr.tmp 5
scoreboard players add $card_gen/slot.z fetchr.tmp 5

execute store result entity @s Pos[0] double 1 run scoreboard players get $card_gen/slot.x fetchr.tmp
execute store result entity @s Pos[1] double 1 run scoreboard players get $card_gen/slot.y fetchr.tmp
execute store result entity @s Pos[2] double 1 run scoreboard players get $card_gen/slot.z fetchr.tmp
execute at @s run data modify block ~ ~ ~ Command set from storage tmp.fetchr:card_generation items[-1].clearCommand
#endregion
