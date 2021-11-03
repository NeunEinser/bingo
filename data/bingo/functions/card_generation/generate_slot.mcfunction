# select category
execute store result score $max nn.math.rand run data get storage bingo:tmp categories

function nope_name.math:rand/exe
scoreboard players operation $cat bingo.tmp = $out nn.math.rand
scoreboard players set $weight_multiplier bingo.tmp 1
scoreboard players set $total_weight bingo.tmp 0
data remove storage bingo:tmp items
function bingo:card_generation/category/find_category


# select item
scoreboard players operation $max nn.math.rand = $total_weight bingo.tmp
function nope_name.math:rand/exe

scoreboard players set $position bingo.tmp 0
function bingo:card_generation/item/find_item

data modify storage bingo:tmp item set from storage bingo:tmp items[0]
data remove storage bingo:tmp items[0]

execute if data storage bingo:tmp item.categories[].id run data modify storage bingo:card_generation forbiddenCategories append from storage bingo:tmp item.categories[].id
execute unless data storage bingo:tmp item.categories[].id run data modify storage bingo:card_generation forbiddenCategories append from storage bingo:tmp item.categories[]

# copy to slot
data modify storage bingo:card slots append value {}

setblock 0 0 0 minecraft:oak_sign{Text1: '["", {"translate": "space.2", "font": "space:default"}, {"storage": "bingo:tmp", "nbt":"item.icon", "interpret": true}, {"translate": "space.2", "font": "space:default"}]'}
data modify storage bingo:card slots[-1].display set from block 0 0 0 Text1
setblock 0 0 0 minecraft:barrier

data modify storage bingo:card slots[-1].item set from storage bingo:tmp item
execute store result storage bingo:card slots[-1].id int 1 run scoreboard players get $i bingo.tmp

# set item to frame
execute as @e[type=minecraft:item_frame, tag=bingo.card_frame] if score @s bingo.frame_id = $i bingo.tmp run data modify entity @s Item set from storage bingo:tmp item.item

# Set item detection command blocks
## detection command
scoreboard players set $command_index bingo.tmp 8
scoreboard players operation $command_index bingo.tmp *= $i bingo.tmp
scoreboard players add $command_index bingo.tmp 2

scoreboard players operation $y bingo.tmp = $command_index bingo.tmp
scoreboard players operation $y bingo.tmp %= 8 bingo.const
scoreboard players operation $x bingo.tmp = $command_index bingo.tmp
scoreboard players operation $x bingo.tmp /= 8 bingo.const
scoreboard players operation $x bingo.tmp %= 5 bingo.const
scoreboard players operation $z bingo.tmp = $command_index bingo.tmp
scoreboard players operation $z bingo.tmp /= 40 bingo.const

scoreboard players operation $xmod bingo.tmp = $x bingo.tmp
scoreboard players operation $xmod bingo.tmp %= 2 bingo.const
scoreboard players operation $zmod bingo.tmp = $z bingo.tmp
scoreboard players operation $zmod bingo.tmp %= 2 bingo.const
execute unless score $xmod bingo.tmp = $zmod bingo.tmp run scoreboard players remove $y bingo.tmp 7
execute if score $y bingo.tmp matches ..-1 run scoreboard players operation $y bingo.tmp *= -1 bingo.const
execute if score $zmod bingo.tmp matches 1 run scoreboard players remove $x bingo.tmp 4
execute if score $zmod bingo.tmp matches 1 run scoreboard players operation $x bingo.tmp *= -1 bingo.const

scoreboard players add $y bingo.tmp 3
scoreboard players add $x bingo.tmp 5
scoreboard players add $z bingo.tmp 5

execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.command_cloud, limit=1] Pos[0] double 1 run scoreboard players get $x bingo.tmp
execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.command_cloud, limit=1] Pos[1] double 1 run scoreboard players get $y bingo.tmp
execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.command_cloud, limit=1] Pos[2] double 1 run scoreboard players get $z bingo.tmp
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.command_cloud, limit=1] run data modify block ~ ~ ~ Command set from storage bingo:tmp item.detectCommand

## clear command
scoreboard players add $command_index bingo.tmp 5

scoreboard players operation $y bingo.tmp = $command_index bingo.tmp
scoreboard players operation $y bingo.tmp %= 8 bingo.const
scoreboard players operation $x bingo.tmp = $command_index bingo.tmp
scoreboard players operation $x bingo.tmp /= 8 bingo.const
scoreboard players operation $x bingo.tmp %= 5 bingo.const
scoreboard players operation $z bingo.tmp = $command_index bingo.tmp
scoreboard players operation $z bingo.tmp /= 40 bingo.const

scoreboard players operation $xmod bingo.tmp = $x bingo.tmp
scoreboard players operation $xmod bingo.tmp %= 2 bingo.const
scoreboard players operation $zmod bingo.tmp = $z bingo.tmp
scoreboard players operation $zmod bingo.tmp %= 2 bingo.const
execute unless score $xmod bingo.tmp = $zmod bingo.tmp run scoreboard players remove $y bingo.tmp 7
execute if score $y bingo.tmp matches ..-1 run scoreboard players operation $y bingo.tmp *= -1 bingo.const
execute if score $zmod bingo.tmp matches 1 run scoreboard players remove $x bingo.tmp 4
execute if score $zmod bingo.tmp matches 1 run scoreboard players operation $x bingo.tmp *= -1 bingo.const

scoreboard players add $y bingo.tmp 3
scoreboard players add $x bingo.tmp 5
scoreboard players add $z bingo.tmp 5

execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.command_cloud, limit=1] Pos[0] double 1 run scoreboard players get $x bingo.tmp
execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.command_cloud, limit=1] Pos[1] double 1 run scoreboard players get $y bingo.tmp
execute store result entity @e[type=minecraft:area_effect_cloud, tag=bingo.command_cloud, limit=1] Pos[2] double 1 run scoreboard players get $z bingo.tmp
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.command_cloud, limit=1] run data modify block ~ ~ ~ Command set from storage bingo:tmp item.clearCommand

# next slot
scoreboard players add $i bingo.tmp 1
execute if score $i bingo.tmp matches ..24 run function bingo:card_generation/generate_slot