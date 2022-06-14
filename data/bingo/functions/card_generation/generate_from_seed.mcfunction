#> bingo:card_generation/generate_from_seed
#
# Generates a card using the seed in the player's seed trigger scoreboard
#
# @within function bingo:lobby/player_tick

scoreboard players operation $rand.seed 91.math.io = @s bingo.seed
scoreboard players reset @s bingo.seed

function bingo:card_generation/generate_card