#> bingo:card_generation/generate_from_seed
#
# Generates a card using the seed in the player's seed trigger scoreboard
#
# @within function bingo:lobby/player_tick

scoreboard players operation $seed nn.math.rand = @s bingo.seed
scoreboard players reset @s bingo.seed

function nope_name.math:rand/set_seed
function bingo:card_generation/generate_card