#> neun_einser.math:random/next_int
#
# Retrieves the next integer in the sequence
#
# @api
# @output score $rand.out 91.math.io return value
# @params
# 	sequence: #[id] string
# 	min: int
# 	max: int

$execute \
	store result score $rand.out 91.math.io \
	run random value $(min)..$(max) $(sequence)