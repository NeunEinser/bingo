#> fetchr:game/skybox/player_tick
#
# This function is executed for every player in the skybox
#
# @within function fetchr:game/skybox/tick

# generate card from seed
execute \
	if score @s fetchr.seed matches -2147483648.. \
	unless score @s fetchr.seed matches 0 \
	run function fetchr:card_generation/generate_from_seed
scoreboard players reset @s fetchr.seed
execute \
	unless score $game_state fetchr.state matches 4 \
	unless score $operator_only fetchr.setting_values matches 1 \
	run scoreboard players enable @s fetchr.seed
execute \
	unless score $game_state fetchr.state matches 4 \
	if score @s fetchr.operator matches 1 \
	run scoreboard players enable @s fetchr.seed