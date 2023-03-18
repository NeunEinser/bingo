#> fetchr:card_generation/generate_from_seed
#
# Generates a card using the seed in the player's seed trigger scoreboard
#
# @within function fetchr:lobby/player_tick

scoreboard players operation $rand.seed 91.math.io = @s fetchr.seed
scoreboard players reset @s fetchr.seed

execute in fetchr:lobby run function fetchr:card_generation/generate_card