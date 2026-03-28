#> fetchr:card_generation/random_card
#
# Starts the generation of a random bingo card.
#
# @within function fetchr:lobby/settings/random_seed


data modify storage tmp.fetchr:rand_data sequence set value "fetchr:card"
execute in fetchr:resourcepack_check run function fetchr:card_generation/generate_card