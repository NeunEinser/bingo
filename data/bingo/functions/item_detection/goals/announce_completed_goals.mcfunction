execute if entity @s[tag=bingo_new_bingo] run tellraw @a {"translate": "bingo.got_bingo", "with": [{"selector": "@a[tag=bingo_in_current_team]"}]}
execute if entity @s[tag=bingo_got_blackout] run tellraw @a {"translate": "bingo.got_blackout", "with": [{"selector": "@a[tag=bingo_in_current_team]"}]}
execute if entity @s[tag=bingo_got_20_no_bingo, scores={bingo_item_count=20}] run tellraw @a {"translate": "bingo.got_20_no_bingo", "with": [{"selector": "@a[tag=bingo_in_current_team]"}]}

tag @s remove bingo_new_bingo
tag @s remove bingo_cur_item
tag @s remove bingo_current_team