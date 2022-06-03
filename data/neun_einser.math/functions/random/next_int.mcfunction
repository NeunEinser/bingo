#> neun_einser.math:random/next_int
#
# Retrieves the next integer in sequence for the lcg
#
# @api
# @input score $rand.max 91.math.io max value
# @output score $rand.out 91.math.io return value
#>
# The max value for the rng
#
# @api
#declare score_holder $rand.max
#>
# The return value of the rng
#
# @api
#declare score_holder $rand.out
#>
# The seed. If not set, uses continues seed from last iteration.
#
# @api
#declare score_holder $rand.seed

scoreboard players operation $rand.seed 91.math.io *= -1403630843 91.math.private
scoreboard players add $rand.seed 91.math.private 1

scoreboard players operation $rand.out 91.math.io = $rand.seed 91.math.io
scoreboard players operation $rand.out 91.math.io %= $rand.max 91.math.io