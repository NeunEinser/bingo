scoreboard objectives remove random_main
scoreboard objectives add random_main dummy "Pseudo Random Number Generator"
scoreboard players set $a random_main 2147483629
scoreboard players set $m random_main 2147483647
scoreboard players set $c random_main 0
scoreboard players set 2 random_main 2

# setup entities for random boolean generator
kill @e[tag=random_boolean]

summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["random_boolean"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players set @e[tag=random_boolean] random_main 1
summon minecraft:area_effect_cloud ~ 0 ~ {Tags: ["random_boolean", "random_false"], Age: -2147483648, Duration: -1, WaitTime: -2147483648}
scoreboard players add @e[tag=random_boolean] random_main 0