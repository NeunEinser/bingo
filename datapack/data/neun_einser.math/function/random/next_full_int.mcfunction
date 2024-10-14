#> neun_einser.math:random/next_full_int
#
# Retrieves the next integer in the full int range
#
# @api
# @output score $rand.out 91.math.io return value
# @params sequence: #[id] string

# For some reason /random can only return a max of 2^31-1 different results,
# which means to get full 32 bits, we need to generate the first to differently.
$execute store result score $rand.out 91.math.io run random value 0..3 $(sequence)
scoreboard players operation $rand.out 91.math.io *= 1073741824 91.math.private
$execute store result score $rand.roll 91.math.private run random value 0..1073741823 $(sequence)
scoreboard players operation $rand.out 91.math.io += $rand.roll 91.math.private