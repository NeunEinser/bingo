summon minecraft:item_frame ~ ~ ~ {Facing: 3b, Invulnerable: true, Tags: ["bingo_card_frame", "bingo_new"]}
scoreboard players operation @e[type=minecraft:item_frame, tag=bingo_card_frame, tag=bingo_new] bingo_frame_id = $i bingo_tmp

tag @e[type=minecraft:item_frame, tag=bingo_card_frame] remove bingo_new

scoreboard players add $i bingo_tmp 1
scoreboard players operation $mod bingo_tmp = $i bingo_tmp
scoreboard players operation $mod bingo_tmp %= 5 bingo_const

execute if score $i bingo_tmp matches ..24 if score $mod bingo_tmp matches 1.. positioned ~1 ~ ~ run function bingo:init/spawn_card_preview_frames
execute if score $i bingo_tmp matches ..24 if score $mod bingo_tmp matches 0 positioned ~-4 ~-1 ~ run function bingo:init/spawn_card_preview_frames