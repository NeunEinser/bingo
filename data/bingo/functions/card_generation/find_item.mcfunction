execute unless entity @e[tag=bingo_selectable, tag=!bingo_skipped] run function bingo:card_generation/next_weight

execute if score $item bingo_tmp matches 0 run tag @e[tag=bingo_selectable, tag=!bingo_skipped, limit=1] add bingo_selected
tag @e[tag=bingo_selectable, tag=!bingo_skipped, limit=1] add bingo_skipped
scoreboard players remove $item bingo_tmp 1

execute if score $item bingo_tmp matches 0.. run function bingo:card_generation/find_item