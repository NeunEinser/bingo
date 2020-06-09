scoreboard players operation Seed bingo_stats = $seed random_main

tellraw @a "#################################################################"
tellraw @a ["seed: ", {"score": {"objective": "random_main", "name": "$seed"}}]

data modify storage bingo:tmp categories set from storage bingo:main categories
data remove storage bingo:card_generation usedItems
data remove storage bingo:card_generation forbiddenItems
data remove storage bingo:card slots

scoreboard players set $i bingo_tmp 0
function bingo:card_generation/generate_slot