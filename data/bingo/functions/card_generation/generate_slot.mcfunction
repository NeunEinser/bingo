#> bingo:card_generation/generate_slot
#
# Generates a slot per iteration for all 25 slots
#
# @within
# 	function bingo:card_generation/generate_card
# 	function bingo:card_generation/generate_slot 

#region select item
scoreboard players operation $max nn.math.rand = $card_gen.total_weight bingo.tmp

function nope_name.math:rand/exe

data modify storage tmp.bingo:card_generation skippedItems set value []
function bingo:card_generation/find_item

data modify storage tmp.bingo:card_generation items append from storage tmp.bingo:card_generation skippedItems[]
#endregion

#region copy to slot
data modify storage bingo:card slots append value {}

setblock 0 0 0 minecraft:oak_sign{Text1: '["", {"translate": "space.2", "font": "space:default"}, {"storage": "tmp.bingo:card_generation", "nbt":"items[-1].icon", "interpret": true}, {"translate": "space.2", "font": "space:default"}]'}
data modify storage bingo:card slots[-1].display set from block 0 0 0 Text1
setblock 0 0 0 minecraft:barrier

data modify storage bingo:card slots[-1].item set from storage tmp.bingo:card_generation items[-1]
execute store result storage bingo:card slots[-1].id int 1 run scoreboard players get $card_gen.slot bingo.tmp
#endregion

# set item to frame
execute as @e[type=minecraft:item_frame, tag=bingo.card_frame] if score @s bingo.frame_id = $card_gen.slot bingo.tmp run data modify entity @s Item set from storage tmp.bingo:card_generation items[-1].item

#region Set item detection command blocks
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

execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.command_cloud, limit=1] Pos[0] double 1 run scoreboard players get $card_gen/slot.x bingo.tmp
execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.command_cloud, limit=1] Pos[1] double 1 run scoreboard players get $card_gen/slot.y bingo.tmp
execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.command_cloud, limit=1] Pos[2] double 1 run scoreboard players get $card_gen/slot.z bingo.tmp
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.command_cloud, limit=1] run data modify block ~ ~ ~ Command set from storage tmp.bingo:card_generation items[-1].detectCommand
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

execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.command_cloud, limit=1] Pos[0] double 1 run scoreboard players get $card_gen/slot.x bingo.tmp
execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.command_cloud, limit=1] Pos[1] double 1 run scoreboard players get $card_gen/slot.y bingo.tmp
execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.command_cloud, limit=1] Pos[2] double 1 run scoreboard players get $card_gen/slot.z bingo.tmp
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.command_cloud, limit=1] run data modify block ~ ~ ~ Command set from storage tmp.bingo:card_generation items[-1].clearCommand
#endregion
#endregion

#region cleanup and next slot
data modify storage tmp.bingo:card_generation keptItems set value []
data modify storage tmp.bingo:card_generation categoriesForRemoval set value []
data modify storage tmp.bingo:card_generation categoriesForRemoval append from storage tmp.bingo:card_generation items[-1].activeCategories[].id
data modify storage tmp.bingo:card_generation categoriesWithRemovedItem set value []
function bingo:card_generation/remove_items

#>
# @within
# 	function bingo:card_generation/generate_slot
# 	function bingo:card_generation/update_category_total_weight
#declare score_holder $card_gen.required_category_weight
scoreboard players set $card_gen.required_category_weight bingo.tmp 1
execute unless data storage tmp.bingo:card_generation categoriesWithRemovedItem[0] run data modify storage tmp.bingo:card_generation items set from storage tmp.bingo:card_generation keptItems
execute if data storage tmp.bingo:card_generation categoriesWithRemovedItem[0] run function bingo:card_generation/update_category_total_weight

#>
# @private
#declare score_holder $card_gen.requires_item_recalc
scoreboard players operation $card_gen.requires_item_recalc bingo.tmp = $card_gen.available_category_weight bingo.tmp
scoreboard players operation $card_gen.requires_item_recalc bingo.tmp %= $card_gen.required_category_weight bingo.tmp

execute unless score $card_gen.requires_item_recalc bingo.tmp matches 0 run scoreboard players operation $card_gen.available_category_weight bingo.tmp = $card_gen.required_category_weight bingo.tmp
execute unless score $card_gen.requires_item_recalc bingo.tmp matches 0 run scoreboard players set $card_gen.total_weight bingo.tmp 0
execute unless score $card_gen.requires_item_recalc bingo.tmp matches 0 run data modify storage tmp.bingo:card_generation recalculateItems set from storage tmp.bingo:card_generation items
execute unless score $card_gen.requires_item_recalc bingo.tmp matches 0 run data modify storage tmp.bingo:card_generation items set value []
execute unless score $card_gen.requires_item_recalc bingo.tmp matches 0 run function bingo:card_generation/recalculate_item_weight

scoreboard players add $card_gen.slot bingo.tmp 1
execute if score $card_gen.slot bingo.tmp matches ..24 run function bingo:card_generation/generate_slot
#endregion