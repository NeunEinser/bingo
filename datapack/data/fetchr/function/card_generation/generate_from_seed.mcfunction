#> fetchr:card_generation/generate_from_seed
#
# Generates a card using the seed in the player's seed trigger scoreboard
#
# @within function fetchr:lobby/player_tick

data modify storage tmp.fetchr:rand_data sequence set value "fetchr:card"
execute \
	store result storage tmp.fetchr:rand_data \
	seed int 1 \
	run scoreboard players operation $seed fetchr.state = @s fetchr.seed
scoreboard players reset @s fetchr.seed
function neun_einser.math:random/set_seed with storage tmp.fetchr:rand_data

execute \
	in fetchr:lobby \
	run function fetchr:card_generation/generate_card