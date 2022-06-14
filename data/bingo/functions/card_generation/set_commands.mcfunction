#> bingo:card_generation/set_commands
#
# Sets the detect and clear commands to the command blocks for item detection
#
# @within function bingo:card_generation/generate_slot
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
scoreboard players set $card_gen/slot.command_index bingo.tmp 8
scoreboard players operation $card_gen/slot.command_index bingo.tmp *= $card_gen.slot bingo.tmp
scoreboard players add $card_gen/slot.command_index bingo.tmp 2

scoreboard players operation $card_gen/slot.y bingo.tmp = $card_gen/slot.command_index bingo.tmp
scoreboard players operation $card_gen/slot.y bingo.tmp %= 8 bingo.const
scoreboard players operation $card_gen/slot.x bingo.tmp = $card_gen/slot.command_index bingo.tmp
scoreboard players operation $card_gen/slot.x bingo.tmp /= 8 bingo.const
scoreboard players operation $card_gen/slot.x bingo.tmp %= 5 bingo.const
scoreboard players operation $card_gen/slot.z bingo.tmp = $card_gen/slot.command_index bingo.tmp
scoreboard players operation $card_gen/slot.z bingo.tmp /= 40 bingo.const

scoreboard players operation $card_gen/slot.xmod bingo.tmp = $card_gen/slot.x bingo.tmp
scoreboard players operation $card_gen/slot.xmod bingo.tmp %= 2 bingo.const
scoreboard players operation $card_gen/slot.zmod bingo.tmp = $card_gen/slot.z bingo.tmp
scoreboard players operation $card_gen/slot.zmod bingo.tmp %= 2 bingo.const
execute unless score $card_gen/slot.xmod bingo.tmp = $card_gen/slot.zmod bingo.tmp run scoreboard players remove $card_gen/slot.y bingo.tmp 7
execute if score $card_gen/slot.y bingo.tmp matches ..-1 run scoreboard players operation $card_gen/slot.y bingo.tmp *= -1 bingo.const
execute if score $card_gen/slot.zmod bingo.tmp matches 1 run scoreboard players remove $card_gen/slot.x bingo.tmp 4
execute if score $card_gen/slot.zmod bingo.tmp matches 1 run scoreboard players operation $card_gen/slot.x bingo.tmp *= -1 bingo.const

scoreboard players add $card_gen/slot.y bingo.tmp 3
scoreboard players add $card_gen/slot.x bingo.tmp 5
scoreboard players add $card_gen/slot.z bingo.tmp 5

execute store result entity @s Pos[0] double 1 run scoreboard players get $card_gen/slot.x bingo.tmp
execute store result entity @s Pos[1] double 1 run scoreboard players get $card_gen/slot.y bingo.tmp
execute store result entity @s Pos[2] double 1 run scoreboard players get $card_gen/slot.z bingo.tmp
execute at @s run data modify block ~ ~ ~ Command set from storage tmp.bingo:card_generation items[-1].detectCommand
#endregion

#region clear command
scoreboard players add $card_gen/slot.command_index bingo.tmp 5

scoreboard players operation $card_gen/slot.y bingo.tmp = $card_gen/slot.command_index bingo.tmp
scoreboard players operation $card_gen/slot.y bingo.tmp %= 8 bingo.const
scoreboard players operation $card_gen/slot.x bingo.tmp = $card_gen/slot.command_index bingo.tmp
scoreboard players operation $card_gen/slot.x bingo.tmp /= 8 bingo.const
scoreboard players operation $card_gen/slot.x bingo.tmp %= 5 bingo.const
scoreboard players operation $card_gen/slot.z bingo.tmp = $card_gen/slot.command_index bingo.tmp
scoreboard players operation $card_gen/slot.z bingo.tmp /= 40 bingo.const

scoreboard players operation $card_gen/slot.xmod bingo.tmp = $card_gen/slot.x bingo.tmp
scoreboard players operation $card_gen/slot.xmod bingo.tmp %= 2 bingo.const
scoreboard players operation $card_gen/slot.zmod bingo.tmp = $card_gen/slot.z bingo.tmp
scoreboard players operation $card_gen/slot.zmod bingo.tmp %= 2 bingo.const
execute unless score $card_gen/slot.xmod bingo.tmp = $card_gen/slot.zmod bingo.tmp run scoreboard players remove $card_gen/slot.y bingo.tmp 7
execute if score $card_gen/slot.y bingo.tmp matches ..-1 run scoreboard players operation $card_gen/slot.y bingo.tmp *= -1 bingo.const
execute if score $card_gen/slot.zmod bingo.tmp matches 1 run scoreboard players remove $card_gen/slot.x bingo.tmp 4
execute if score $card_gen/slot.zmod bingo.tmp matches 1 run scoreboard players operation $card_gen/slot.x bingo.tmp *= -1 bingo.const

scoreboard players add $card_gen/slot.y bingo.tmp 3
scoreboard players add $card_gen/slot.x bingo.tmp 5
scoreboard players add $card_gen/slot.z bingo.tmp 5

execute store result entity @s Pos[0] double 1 run scoreboard players get $card_gen/slot.x bingo.tmp
execute store result entity @s Pos[1] double 1 run scoreboard players get $card_gen/slot.y bingo.tmp
execute store result entity @s Pos[2] double 1 run scoreboard players get $card_gen/slot.z bingo.tmp
execute at @s run data modify block ~ ~ ~ Command set from storage tmp.bingo:card_generation items[-1].clearCommand
#endregion
