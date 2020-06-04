function bingo:find_player_team
tag @s add bingo_got_item
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_sweet_berries, scores={bingo_slot_id=0..}, limit=1] run function bingo:item_detection/find_slot/main

execute if entity @s[tag=bingo_successful_got_item] run function bingo:item_detection/award_item/sweet_berries

tag @s remove bingo_got_item
tag @s remove bingo_successful_got_item
tag @a remove bingo_in_current_team