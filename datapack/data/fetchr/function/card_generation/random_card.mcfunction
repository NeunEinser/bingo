#> fetchr:card_generation/random_card
#
# Starts the generation of a random bingo card.
#
# @within function fetchr:lobby/settings/random_seed

execute if score $operator_only fetchr.settings matches 1 unless score @s fetchr.operator matches 1 run function fetchr:util/show_confirm_operator_status_prompt
execute if score $operator_only fetchr.settings matches 1 unless score @s fetchr.operator matches 1 run return 0

function neun_einser.math:random/set_random_seed
execute in fetchr:lobby run function fetchr:card_generation/generate_card