# setup objectives
scoreboard objectives remove bingo_seed
scoreboard objectives remove bingo_item_count
scoreboard objectives remove bingo_slot_id
scoreboard objectives remove bingo_weight
scoreboard objectives remove bingo_id
scoreboard objectives remove bingo_category
scoreboard objectives remove bingo_category_1
scoreboard objectives remove bingo_category_2
scoreboard objectives remove bingo_tmp
scoreboard objectives remove bingo_tmp_2
scoreboard objectives remove bingo_const
#DONT reset stats
#scoreboard objectives remove bingo_stats

scoreboard objectives add bingo_seed trigger "Trigger for setting the seed value"
scoreboard objectives add bingo_item_count dummy "Amount of items a player has received"
scoreboard objectives add bingo_slot_id dummy "Id for the slot this item is currently in"
scoreboard objectives add bingo_weight dummy "Weight for the rng to pick this item"
scoreboard objectives add bingo_id dummy
scoreboard objectives add bingo_category dummy "Category id of this item"
scoreboard objectives add bingo_tmp dummy "Temporary values"
scoreboard objectives add bingo_tmp_2 dummy "Temporary values #2"
scoreboard objectives add bingo_stats dummy "Minecraft Bingo"
scoreboard objectives setdisplay sidebar bingo_stats

# setup teams
## add
team add bingo_aqua
team add bingo_black
team add bingo_blue
team add bingo_dark_aqua
team add bingo_dark_blue
team add bingo_dark_gray
team add bingo_dark_green
team add bingo_dark_purple
team add bingo_dark_red
team add bingo_gold
team add bingo_gray
team add bingo_green
team add bingo_light_purple
team add bingo_red
team add bingo_white
team add bingo_yellow

## set colors
team modify bingo_aqua color aqua
team modify bingo_black color black
team modify bingo_blue color blue
team modify bingo_dark_aqua color dark_aqua
team modify bingo_dark_blue color dark_blue
team modify bingo_dark_gray color dark_gray
team modify bingo_dark_green color dark_green
team modify bingo_dark_purple color dark_purple
team modify bingo_dark_red color dark_red
team modify bingo_gold color gold
team modify bingo_gray color gray
team modify bingo_green color green
team modify bingo_light_purple color light_purple
team modify bingo_red color red
team modify bingo_white color white
team modify bingo_yellow color yellow

## spawn aecs
kill @e[type=minecraft:area_effect_cloud, tag=bingo_item_border]

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "aqua"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_aqua"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "black"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_black"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "blue"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_blue"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "dark_aqua"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_dark_aqua"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "dark_blue"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_dark_blue"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "dark_gray"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_dark_gray"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "dark_green"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_dark_green"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "dark_purple"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_dark_purple"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "dark_red"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_dark_red"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "gold"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_gold"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "gray"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_gray"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "green"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_green"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "light_purple"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_light_purple"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "red"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_red"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "white"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_white"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '{"text": "\\uFFFE", "color": "yellow"}', Tags: ["bingo_item_border", "bingo_completed_item", "bingo_yellow"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\uFFFF"', Tags: ["bingo_item_border", "bingo_current_team", "bingo_uncompleted_item", "bingo_got_slot0", "bingo_got_slot1", "bingo_got_slot2", "bingo_got_slot3", "bingo_got_slot4", "bingo_got_slot5", "bingo_got_slot6", "bingo_got_slot7", "bingo_got_slot8", "bingo_got_slot9", "bingo_got_slot10", "bingo_got_slot11", "bingo_got_slot12", "bingo_got_slot13", "bingo_got_slot14", "bingo_got_slot15", "bingo_got_slot16", "bingo_got_slot17", "bingo_got_slot18", "bingo_got_slot19", "bingo_got_slot20", "bingo_got_slot21", "bingo_got_slot22", "bingo_got_slot23", "bingo_got_slot24"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}

# categories:
#00: pumpkin
#01: egg
#02: milk
#03: sapling
#04: jungle
#05: shearable
#06: rail (single)
#07: flint
#08: fish
#09: enderslime
#10: gunpowder
#11: glass
#12: chest_loot
#13: village
#14: wool
#15: leather
#16: diamond
#17: bricks
#18: mushrooms
#19: apple
#20: gold
#21: book
#22: spider
#23: chest iron
#24: compass
#25: redstone
#26: ink
#27: ink bone
#28: cactus green
#29: lapis
#30: furnace iron
#31: cactus bone
#32: simple iron
#33: warm ocean
#34: snow
#35: taiga
#36: bow
#37: heart of the sea (single)
#38: magma block (single)
#39: ominous banner (single)

# spawn aecs for item registry
kill @e[type=minecraft:area_effect_cloud, tag=bingo_item]

## pumpkin & milk & egg
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0001"', Tags: ["bingo_pumpkin_seeds", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_pumpkin_seeds] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_pumpkin_seeds] bingo_category 0

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u010f"', Tags: ["bingo_jack_o_lantern", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_jack_o_lantern] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_jack_o_lantern] bingo_category 0
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_jack_o_lantern] bingo_weight 2

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0002"', Tags: ["bingo_pumpkin_pie", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_pumpkin_pie] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_pumpkin_pie] bingo_category 0
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["bingo_pumpkin_pie", "bingo_item", "bingo_additional_category"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players operation @e[type=minecraft:area_effect_cloud, tag=bingo_pumpkin_pie, tag=bingo_additional_category] bingo_id = $current bingo_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_pumpkin_pie, tag=bingo_additional_category] bingo_category 1

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0003"', Tags: ["bingo_egg", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_egg] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_egg] bingo_category 1
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_egg] bingo_weight 2

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0016"', Tags: ["bingo_milk_bucket", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_milk_bucket] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_milk_bucket] bingo_category 2

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0004"', Tags: ["bingo_cake", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_cake] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_cake] bingo_category 1
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["bingo_cake", "bingo_item", "bingo_additional_category"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players operation @e[type=minecraft:area_effect_cloud, tag=bingo_cake, tag=bingo_additional_category] bingo_id = $current bingo_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_cake, tag=bingo_additional_category] bingo_category 2

## sapling & jungle
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0005"', Tags: ["bingo_acacia_sapling", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_acacia_sapling] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_acacia_sapling] bingo_category 3

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0006"', Tags: ["bingo_spruce_sapling", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_spruce_sapling] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_spruce_sapling] bingo_category 3

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0048"', Tags: ["bingo_birch_sapling", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_birch_sapling] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_birch_sapling] bingo_category 3

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0049"', Tags: ["bingo_dark_oak_sapling", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_dark_oak_sapling] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_dark_oak_sapling] bingo_category 3

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u004a"', Tags: ["bingo_jungle_sapling", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_jungle_sapling] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_jungle_sapling] bingo_category 3
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["bingo_jungle_sapling", "bingo_item", "bingo_additional_category"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players operation @e[type=minecraft:area_effect_cloud, tag=bingo_jungle_sapling, tag=bingo_additional_category] bingo_id = $current bingo_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_jungle_sapling, tag=bingo_additional_category] bingo_category 4

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0056"', Tags: ["bingo_bamboo", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_bamboo] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_bamboo] bingo_category 4

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0007"', Tags: ["bingo_cocoa_beans", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_cocoa_beans] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_cocoa_beans] bingo_category 4
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_cocoa_beans] bingo_weight 2

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0008"', Tags: ["bingo_cookie", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_cookie] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_cookie] bingo_category 4

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0009"', Tags: ["bingo_melon_slice", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_melon_slice] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_melon_slice] bingo_category 4
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_melon_slice] bingo_weight 2

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u000a"', Tags: ["bingo_glistering_melon_slice", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_glistering_melon_slice] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_glistering_melon_slice] bingo_category 4

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0104"', Tags: ["bingo_melon", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_melon] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_melon] bingo_category 4

## shearable & taiga
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u000b"', Tags: ["bingo_dead_bush", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_dead_bush] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_dead_bush] bingo_category 5

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u000d"', Tags: ["bingo_vine", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_vine] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_vine] bingo_category 5

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0012"', Tags: ["bingo_seagrass", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_seagrass] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_seagrass] bingo_category 5

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0105"', Tags: ["bingo_mossy_stone_bricks", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_mossy_stone_bricks] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_mossy_stone_bricks] bingo_category 5

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u000c"', Tags: ["bingo_fern", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_fern] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_fern] bingo_category 5
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["bingo_fern", "bingo_item", "bingo_additional_category"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players operation @e[type=minecraft:area_effect_cloud, tag=bingo_fern, tag=bingo_additional_category] bingo_id = $current bingo_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_fern, tag=bingo_additional_category] bingo_category 35

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u004f"', Tags: ["bingo_sweet_berries", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_sweet_berries] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_sweet_berries] bingo_category 35

## rails
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u000e"', Tags: ["bingo_rail", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_rail] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_rail] bingo_category 6

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u004b"', Tags: ["bingo_detector_rail", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_rail] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_rail] bingo_category 6

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u004c"', Tags: ["bingo_activator_rail", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_rail] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_rail] bingo_category 6

## flint
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0010"', Tags: ["bingo_flint", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_flint] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_flint] bingo_category 7

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0011"', Tags: ["bingo_flint_and_steel", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_flint_and_steel] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_flint_and_steel] bingo_category 7

## fish & warm ocean
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0042"', Tags: ["bingo_cod", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_cod] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_cod] bingo_category 8

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0043"', Tags: ["bingo_cod_bucket", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_cod_bucket] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_cod_bucket] bingo_category 8
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_cod_bucket] bingo_weight 2

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0044"', Tags: ["bingo_salmon", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_salmon] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_salmon] bingo_category 8

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0045"', Tags: ["bingo_salmon_bucket", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_salmon_bucket] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_salmon_bucket] bingo_category 8
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_salmon_bucket] bingo_weight 2

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0046"', Tags: ["bingo_tropical_fish", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_tropical_fish] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_tropical_fish] bingo_category 8
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["bingo_tropical_fish", "bingo_item", "bingo_additional_category"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players operation @e[type=minecraft:area_effect_cloud, tag=bingo_tropical_fish, tag=bingo_additional_category] bingo_id = $current bingo_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_tropical_fish, tag=bingo_additional_category] bingo_category 33

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0047"', Tags: ["bingo_tropical_fish_bucket", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_tropical_fish_bucket] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_tropical_fish_bucket] bingo_category 8
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_tropical_fish_bucket] bingo_weight 2
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["bingo_tropical_fish_bucket", "bingo_item", "bingo_additional_category"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players operation @e[type=minecraft:area_effect_cloud, tag=bingo_tropical_fish_bucket, tag=bingo_additional_category] bingo_id = $current bingo_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_tropical_fish_bucket, tag=bingo_additional_category] bingo_category 33

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0057"', Tags: ["bingo_sea_pickle", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_sea_pickle] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_sea_pickle] bingo_category 33
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_sea_pickle] bingo_weight 2

## enderslime
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0013"', Tags: ["bingo_ender_pearl", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_ender_pearl] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_ender_pearl] bingo_category 9
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_ender_pearl] bingo_weight 2

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0014"', Tags: ["bingo_slime_ball", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_slime_ball] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_slime_ball] bingo_category 9

## gunpowder & glass
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0015"', Tags: ["bingo_firework_rocket", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_firework_rocket] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_firework_rocket] bingo_category 10

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0032"', Tags: ["bingo_gunpowder", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_gunpowder] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_gunpowder] bingo_category 10

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0041"', Tags: ["bingo_glass_bottle", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_glass_bottle] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_glass_bottle] bingo_category 11

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0110"', Tags: ["bingo_tnt", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_tnt] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_tnt] bingo_category 10
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["bingo_tnt", "bingo_item", "bingo_additional_category"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players operation @e[type=minecraft:area_effect_cloud, tag=bingo_tnt, tag=bingo_additional_category] bingo_id = $current bingo_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_tnt, tag=bingo_additional_category] bingo_category 11

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0033"', Tags: ["bingo_tnt_minecart", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_tnt_minecart] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_tnt_minecart] bingo_category 10
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["bingo_tnt_minecart", "bingo_item", "bingo_additional_category"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players operation @e[type=minecraft:area_effect_cloud, tag=bingo_tnt_minecart, tag=bingo_additional_category] bingo_id = $current bingo_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_tnt_minecart, tag=bingo_additional_category] bingo_category 11

## chest loot & village
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0018"', Tags: ["bingo_saddle", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_saddle] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_saddle] bingo_category 12

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0019"', Tags: ["bingo_name_tag", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_name_tag] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_name_tag] bingo_category 12

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u002f"', Tags: ["bingo_enchanted_book", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_enchanted_book] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_enchanted_book] bingo_category 12
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_enchanted_book] bingo_weight 2

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0024"', Tags: ["bingo_beetroot_soup", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_beetroot_soup] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_beetroot_soup] bingo_category 12
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["bingo_beetroot_soup", "bingo_item", "bingo_additional_category"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players operation @e[type=minecraft:area_effect_cloud, tag=bingo_beetroot_soup, tag=bingo_additional_category] bingo_id = $current bingo_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_beetroot_soup, tag=bingo_additional_category] bingo_category 13

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u001c"', Tags: ["bingo_emerald", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_emerald] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_emerald] bingo_category 13

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u004e"', Tags: ["bingo_bell", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_bell] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_bell] bingo_category 13

## wool
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u001a"', Tags: ["bingo_painting", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_painting] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_painting] bingo_category 14

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u010b"', Tags: ["bingo_red_bed", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_red_bed] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_painting] bingo_category 14

## leather & dyes
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u001b"', Tags: ["bingo_item_frame", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_item_frame] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_item_frame] bingo_category 15

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u002d"', Tags: ["bingo_book", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_book] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_book] bingo_category 15

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0102"', Tags: ["bingo_bookshelf", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_bookshelf] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_bookshelf] bingo_category 15

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0039"', Tags: ["bingo_ink_sac", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_ink_sac] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_ink_sac] bingo_category 26

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u002e"', Tags: ["bingo_writable_book", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_writable_book] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_writable_book] bingo_category 15
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["bingo_writable_book", "bingo_item", "bingo_additional_category"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players operation @e[type=minecraft:area_effect_cloud, tag=bingo_writable_book, tag=bingo_additional_category] bingo_id = $current bingo_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_writable_book, tag=bingo_additional_category] bingo_category 26

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0038"', Tags: ["bingo_bone", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_bone] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_bone] bingo_category 27
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["bingo_bone", "bingo_item", "bingo_additional_category"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players operation @e[type=minecraft:area_effect_cloud, tag=bingo_bone, tag=bingo_additional_category] bingo_id = $current bingo_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_bone, tag=bingo_additional_category] bingo_category 31

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0108"', Tags: ["bingo_bone_block", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_bone_block] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_bone_block] bingo_category 27
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["bingo_bone_block", "bingo_item", "bingo_additional_category"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players operation @e[type=minecraft:area_effect_cloud, tag=bingo_bone_block, tag=bingo_additional_category] bingo_id = $current bingo_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_bone_block, tag=bingo_additional_category] bingo_category 31

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u003a"', Tags: ["bingo_gray_dye", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_gray_dye] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_gray_dye] bingo_category 26
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["bingo_gray_dye", "bingo_item", "bingo_additional_category"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players operation @e[type=minecraft:area_effect_cloud, tag=bingo_gray_dye, tag=bingo_additional_category] bingo_id = $current bingo_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_gray_dye, tag=bingo_additional_category] bingo_category 27

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u003b"', Tags: ["bingo_green_dye", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_green_dye] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_green_dye] bingo_category 28

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u003c"', Tags: ["bingo_lime_dye", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_lime_dye] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_lime_dye] bingo_category 28
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["bingo_lime_dye", "bingo_item", "bingo_additional_category"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players operation @e[type=minecraft:area_effect_cloud, tag=bingo_lime_dye, tag=bingo_additional_category] bingo_id = $current bingo_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_lime_dye, tag=bingo_additional_category] bingo_category 31

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u003d"', Tags: ["bingo_lapis_lazuli", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_lapis_lazuli] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_lapis_lazuli] bingo_category 29

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0111"', Tags: ["bingo_lapis_block", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_lapis_block] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_lapis_block] bingo_category 29

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u003f"', Tags: ["bingo_purple_dye", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_purple_dye] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_purple_dye] bingo_category 29

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u003e"', Tags: ["bingo_cyan_dye", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_cyan_dye] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_cyan_dye] bingo_category 28
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["bingo_cyan_dye", "bingo_item", "bingo_additional_category"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players operation @e[type=minecraft:area_effect_cloud, tag=bingo_cyan_dye, tag=bingo_additional_category] bingo_id = $current bingo_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_cyan_dye, tag=bingo_additional_category] bingo_category 29

## diamond
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0050"', Tags: ["bingo_diamond_sword", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_diamond_sword] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_diamond_sword] bingo_category 16

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u001f"', Tags: ["bingo_diamond_axe", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_diamond_axe] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_diamond_axe] bingo_category 16

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0051"', Tags: ["bingo_diamond_pickaxe", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_diamond_pickaxe] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_diamond_pickaxe] bingo_category 16

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u001d"', Tags: ["bingo_diamond_shovel", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_diamond_shovel] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_diamond_shovel] bingo_category 16
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_diamond_shovel] bingo_weight 2

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u001e"', Tags: ["bingo_diamond_hoe", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_diamond_hoe] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_diamond_hoe] bingo_category 16

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0103"', Tags: ["bingo_obsidian", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_obsidian] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_obsidian] bingo_category 16

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0106"', Tags: ["bingo_jukebox", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_jukebox] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_jukebox] bingo_category 16
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_jukebox] bingo_weight 2

## bricks
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0021"', Tags: ["bingo_flower_pot", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_flower_pot] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_flower_pot] bingo_category 17

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0022"', Tags: ["bingo_brick", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_brick] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_brick] bingo_category 17

## mushrooms & spider eyes
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0023"', Tags: ["bingo_mushroom_stew", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_mushroom_stew] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_mushroom_stew] bingo_category 18

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0040"', Tags: ["bingo_suspicious_stew", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_suspicious_stew] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_suspicious_stew] bingo_category 18
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_suspicious_stew] bingo_weight 2

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0030"', Tags: ["bingo_spider_eye", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_spider_eye] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_spider_eye] bingo_category 22

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0031"', Tags: ["bingo_fermented_spider_eye", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_fermented_spider_eye] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_fermented_spider_eye] bingo_category 18
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["bingo_fermented_spider_eye", "bingo_item", "bingo_additional_category"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players operation @e[type=minecraft:area_effect_cloud, tag=bingo_fermented_spider_eye, tag=bingo_additional_category] bingo_id = $current bingo_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_fermented_spider_eye, tag=bingo_additional_category] bingo_category 22

## apple
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0025"', Tags: ["bingo_apple", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_apple] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_apple] bingo_category 19

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0026"', Tags: ["bingo_golden_apple", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_golden_apple] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_golden_apple] bingo_category 19

## gold
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0028"', Tags: ["bingo_golden_sword", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_golden_sword] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_golden_sword] bingo_category 20

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0052"', Tags: ["bingo_golden_axe", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_golden_axe] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_golden_axe] bingo_category 20

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0053"', Tags: ["bingo_golden_pickaxe", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_golden_pickaxe] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_golden_pickaxe] bingo_category 20

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0027"', Tags: ["bingo_golden_shovel", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_golden_shovel] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_golden_shovel] bingo_category 20

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0054"', Tags: ["bingo_golden_hoe", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_golden_hoe] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_golden_hoe] bingo_category 20

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u000f"', Tags: ["bingo_powered_rail", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_powered_rail] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_powered_rail] bingo_category 20

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0029"', Tags: ["bingo_clock", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_clock] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_clock] bingo_category 20

## redstone
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u002a"', Tags: ["bingo_repeater", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_repeater] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_repeater] bingo_category 25

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0101"', Tags: ["bingo_redstone_block", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_redstone_block] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_redstone_block] bingo_category 25

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u010c"', Tags: ["bingo_target", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_target] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_target] bingo_category 25

## compass
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u002b"', Tags: ["bingo_compass", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_compass] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_compass] bingo_category 24

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u002c"', Tags: ["bingo_map", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_map] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_map] bingo_category 24

## chest iron
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0034"', Tags: ["bingo_hopper", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_hopper] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_hopper] bingo_category 23

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0035"', Tags: ["bingo_hopper_minecart", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_hopper_minecart] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_hopper_minecart] bingo_category 23

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0037"', Tags: ["bingo_chest_minecart", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_chest_minecart] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_chest_minecart] bingo_category 23

## furnace iron
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0036"', Tags: ["bingo_furnace_minecart", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_furnace_minecart] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_furnace_minecart] bingo_category 30

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0109"', Tags: ["bingo_blast_furnace", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_blast_furnace] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_blast_furnace] bingo_category 30

## simple iron
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0017"', Tags: ["bingo_cauldron", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_cauldron] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_cauldron] bingo_category 32

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0100"', Tags: ["bingo_iron_block", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_iron_block] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_iron_block] bingo_category 32

## snow
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u010d"', Tags: ["bingo_snow", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_snow] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_snow] bingo_category 34

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u010e"', Tags: ["bingo_snow_block", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_snow_block] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_snow_block] bingo_category 34

## bow
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0055"', Tags: ["bingo_crossbow", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_crossbow] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_crossbow] bingo_category 36

summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0112"', Tags: ["bingo_dispenser", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_dispenser] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_dispenser] bingo_category 36

## heart of the sea (single)
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u004d"', Tags: ["bingo_heart_of_the_sea", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_heart_of_the_sea] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_heart_of_the_sea] bingo_category 37

## Magma Block (single)
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u0107"', Tags: ["bingo_magma_block", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_magma_block] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_magma_block] bingo_category 38

## pillager banner (single)
summon minecraft:area_effect_cloud ~ 0 ~ {CustomName: '"\\u010a"', Tags: ["bingo_ominous_banner", "bingo_item"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_ominous_banner] run function bingo:init/set_id
scoreboard players set @e[type=minecraft:area_effect_cloud, tag=bingo_ominous_banner] bingo_category 39

# set default weight
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_item] unless score @s bingo_weight matches 1.. run scoreboard players set @s bingo_weight 1

# regenerate card
scoreboard players operation $seed random_main = Seed bingo_stats
function random:set_seed

function bingo:card_generation/generate_card