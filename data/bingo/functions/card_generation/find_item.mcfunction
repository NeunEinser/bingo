execute unless entity @e[type=minecraft:area_effect_cloud, tag=bingo_selectable, tag=!bingo_skipped, limit=1] run function bingo:card_generation/next_weight

execute if score $item bingo_tmp matches 0 run tag @e[type=minecraft:area_effect_cloud, tag=bingo_selectable, tag=!bingo_skipped, limit=1] add bingo_selected
tag @e[type=minecraft:area_effect_cloud, tag=bingo_selectable, tag=!bingo_skipped, limit=1] add bingo_skipped
scoreboard players remove $item bingo_tmp 1

execute if score $item bingo_tmp matches 0.. run function bingo:card_generation/find_item