tag @a[tag=bingo_got_item, limit=1] add bingo_successful_got_item
scoreboard players add @s bingo_item_count 1

tag @s add bingo_got_slot1

# detect goals
execute unless entity @s[tag=bingo_got_bingo] run function bingo:award_item/detect_bingo
execute if entity @s[scores={bingo_item_count=25}] run tag @s add bingo_got_blackout
execute if entity @s[tag=!bingo_got_bingo, scores={bingo_item_count=20}] run tag @s add bingo_got_20_no_bingo