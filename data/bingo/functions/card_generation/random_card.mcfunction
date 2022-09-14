#> bingo:card_generation/random_card
#
# Starts the generation of a random Bingo card.
#
# @within function bingo:lobby/settings/random_seed_strict_mode_check

function neun_einser.math:random/set_random_seed
execute in bingo:lobby run function bingo:card_generation/generate_card