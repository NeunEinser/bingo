effect clear @s
clear @s

scoreboard players set $allow_fixed bingo.tmp 1
scoreboard players set $first bingo.tmp 14
function bingo:lobby/player_settings/find_config

setblock 0 63 0 minecraft:shulker_box{Items:[{Slot:0b, id: "minecraft:barrier",  Count:1b}]}
execute if data storage bingo:tmp playerConfigs[0].inventory[0] run function bingo:lobby/player_settings/load/copy_inventory
setblock 0 63 0 minecraft:barrier

execute if data storage bingo:tmp playerConfigs[0].effects[0] at @s run summon minecraft:potion ~ ~2.1 ~ {Tags:["bingo_potion_applier", "bingo_new"], Item:{id: "minecraft:splash_potion", Count: 1b, tag:{CustomPotionEffects: []}}}
data modify entity @e[type=minecraft:potion, tag=bingo_potion_applier, tag=bingo_new, limit=1] Item.tag.CustomPotionEffects set from storage bingo:tmp playerConfigs[0].effects

tag @e[type=minecraft:potion, tag=bingo_potion_applier, tag=bingo_new, limit=1] remove bingo_new