execute if score @e[type=minecraft:area_effect_cloud, tag=random_boolean,sort=random,limit=1] random_main matches 1 run scoreboard players operation $seed random_main += $tmp random_main
scoreboard players operation $tmp random_main *= 2 random_main

execute if score $tmp random_main matches 1.. run function random:calc/generate_random_seed