#> fetchr:card_generation/random_card
#
# Starts the generation of a random bingo card.
#
# @within function fetchr:lobby/settings/random_seed_strict_mode_check

function neun_einser.math:random/set_random_seed
execute in fetchr:lobby run function fetchr:card_generation/generate_card