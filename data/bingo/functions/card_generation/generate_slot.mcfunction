#> bingo:card_generation/generate_slot
#
# Generates a slot per iteration for all 25 slots
#
# @within
# 	function bingo:card_generation/generate_card
# 	function bingo:card_generation/cleanup_and_next_slot

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

execute if score $card_gen.slot bingo.tmp matches ..24 run function bingo:card_generation/cleanup_and_next_slot