summon minecraft:item_frame ~ ~ ~ {Facing: 3b, Tags: ["bingo_card_frame", "bingo_new"], Item:{id:"minecraft:barrier", Count: 1b}, ItemDropChance: 0.0f}
scoreboard players operation @e[type=minecraft:item_frame, tag=bingo_card_frame, tag=bingo_new] bingo.frame_id = $i bingo.tmp

tag @e[type=minecraft:item_frame, tag=bingo_card_frame] remove bingo_new

scoreboard players add $i bingo.tmp 1
scoreboard players operation $mod bingo.tmp = $i bingo.tmp
scoreboard players operation $mod bingo.tmp %= 5 bingo.const

execute if score $i bingo.tmp matches ..24 if score $mod bingo.tmp matches 1.. positioned ~1 ~ ~ run function bingo:init/spawn_card_preview_frames
execute if score $i bingo.tmp matches ..24 if score $mod bingo.tmp matches 0 positioned ~-4 ~-1 ~ run function bingo:init/spawn_card_preview_frames