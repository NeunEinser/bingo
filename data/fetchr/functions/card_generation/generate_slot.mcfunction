#> fetchr:card_generation/generate_slot
#
# Generates a slot per iteration for all 25 slots
#
# @within
# 	function fetchr:card_generation/generate_card
# 	function fetchr:card_generation/cleanup_and_next_slot

#region select item
scoreboard players operation $rand.max 91.math.io = $card_gen.total_weight fetchr.tmp

function neun_einser.math:random/next_int

data modify storage tmp.fetchr:card_generation skippedItems set value []
function fetchr:card_generation/find_item

data modify storage tmp.fetchr:card_generation items append from storage tmp.fetchr:card_generation skippedItems[]
#endregion

#region copy to slot
data modify storage fetchr:card slots append value {}

setblock 0 0 0 minecraft:oak_sign{Text1: '["", {"translate": "space.2", "font": "space:default"}, {"storage": "tmp.fetchr:card_generation", "nbt":"items[-1].icon", "interpret": true}, {"translate": "space.2", "font": "space:default"}]'}
data modify storage fetchr:card slots[-1].display set from block 0 0 0 Text1
setblock 0 0 0 minecraft:barrier

data modify storage fetchr:card slots[-1].item set from storage tmp.fetchr:card_generation items[-1]
execute store result storage fetchr:card slots[-1].id int 1 run scoreboard players get $card_gen.slot fetchr.tmp
#endregion

# set item to frame
execute as @e[type=minecraft:item_frame, tag=fetchr.card_frame] if score @s fetchr.lobby_card_frame_id = $card_gen.slot fetchr.tmp run data modify entity @s Item set from storage tmp.fetchr:card_generation items[-1].item

execute as @e[type=minecraft:marker, tag=fetchr.command_cloud, limit=1] run function fetchr:card_generation/set_commands

execute if score $card_gen.slot fetchr.tmp matches ..23 run function fetchr:card_generation/cleanup_and_next_slot