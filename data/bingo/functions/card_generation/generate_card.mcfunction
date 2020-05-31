execute as @e[type=minecraft:area_effect_cloud, tag=bingo_item] run function bingo:card_generation/setup_item

scoreboard players set $i bingo_tmp 0
function bingo:card_generation/generate_slot

scoreboard players operation Seed bingo_stats = $seed random_main