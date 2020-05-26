tag @e[tag=bingo_item] add bingo_selectable

scoreboard players reset @e[tag=bingo_item] bingo_slot_id
scoreboard players set $i bingo_tmp 0
function bingo:card_generation/generate_slot

scoreboard players operation Seed bingo_stats = $seed random_main