#> bingo:card_generation/generate_slot
#
# Generates a slot per iteration for all 25 slots
#
# @within
# 	function bingo:card_generation/generate_card
# 	function bingo:card_generation/generate_slot

#region select item
scoreboard players operation $rand.max 91.math.io = $card_gen.total_weight bingo.tmp

function neun_einser.math:random/next_int

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

execute as @e[tag=bingo.command_cloud, limit=1] run function bingo:card_generation/set_commands

#region cleanup and next slot
data modify storage tmp.bingo:card_generation keptItems set value []
data modify storage tmp.bingo:card_generation stringTesterTagCache set value ["bingo.string_tester"]
data modify storage tmp.bingo:card_generation stringTesterTagCache append from storage tmp.bingo:card_generation items[-1].activeCategories[].id
data modify storage tmp.bingo:card_generation categoriesWithRemovedItem set value []
#>
# @within function bingo:card_generation/**
#declare score_holder $card_gen.aec_tag_count
execute store result score $card_gen.aec_tag_count bingo.tmp run data get storage tmp.bingo:card_generation stringTesterTagCache
function bingo:card_generation/remove_items/exec

#>
# @within
# 	function bingo:card_generation/generate_slot
# 	function bingo:card_generation/update_category_total_weight/*
# 	function bingo:card_generation/recalculate_item_weight/exec
#declare score_holder $card_gen.required_category_weight
execute unless data storage tmp.bingo:card_generation categoriesWithRemovedItem[0] run data modify storage tmp.bingo:card_generation items set from storage tmp.bingo:card_generation keptItems
execute if data storage tmp.bingo:card_generation categoriesWithRemovedItem[0] run function bingo:card_generation/update_category_total_weight/exec

scoreboard players add $card_gen.slot bingo.tmp 1
execute if score $card_gen.slot bingo.tmp matches ..24 run function bingo:card_generation/generate_slot
#endregion