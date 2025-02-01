#> neun_einser.math:random/set_random_seed
#
# Sets the current seed to a random seed.
#
# @api
# @output score $rand.seed 91.math.io seed
# @params
# 	sequence: #[id] string

scoreboard players set $rand.seed 91.math.io 0

# For some reason /random can only return a max of 2^31-1 different results,
# which means to get full 32 bits, we need to generate the first to differently.
execute \
	store result score $rand.seed 91.math.io \
	run random value 0..3
scoreboard players operation $rand.seed 91.math.io *= 1073741824 91.math.private
execute \
	store result score $rand.roll 91.math.private \
	run random value 0..1073741823
execute \
	store result storage tmp.neun_einser.math:rand seed int 1 \
	run scoreboard players operation $rand.seed 91.math.io += $rand.roll 91.math.private

$data \
	modify storage tmp.neun_einser.math:rand sequence \
	set value "$(sequence)"

data remove storage io.neun_einser.math:rand sequence

function neun_einser.math:random/set_seed with storage tmp.neun_einser.math:rand