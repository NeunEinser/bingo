execute if score $item bingo_tmp matches 0 run scoreboard players operation $id bingo_tmp = @e[type=minecraft:area_effect_cloud, tag=bingo_in_category, tag=!bingo_skipped, scores={bingo_tmp_2=1..}, limit=1] bingo_id
tag @e[type=minecraft:area_effect_cloud, tag=bingo_in_category, tag=!bingo_skipped, scores={bingo_tmp_2=1..}, limit=1] add bingo_skipped
scoreboard players remove $item bingo_tmp 1

execute if score $item bingo_tmp matches 0.. run function bingo:card_generation/find_item