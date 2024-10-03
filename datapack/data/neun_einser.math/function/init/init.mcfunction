#> neun_einser.math:init/init
#
# Adds necessary scoreboards
#
# @within tag/function minecraft:load
# @handles #minecraft:load

scoreboard objectives remove 91.math.io

#>
# This scoreboard is used for input and output of mathematical operations
# @api
scoreboard objectives add 91.math.io dummy
#>
# Private temporary results, state, and constants
# @internal
scoreboard objectives add 91.math.private dummy
#>
# Used as multiplier for the lcg. This is the singed version of 2891336453
# which is a good value for m=2^32, according to
#
# Tables of linear congruential generators of different sizes and good lattice
# structure
# by Pierre L’Ecuyer
# https://www.ams.org/journals/mcom/1999-68-225/S0025-5718-99-00996-5/S0025-5718-99-00996-5.pdf
# Page 10
#
# @internal
#declare score_holder -1403630843
scoreboard players set -1403630843 91.math.private -1403630843
#>
# @internal
#declare score_holder 2
scoreboard players set 2 91.math.private 2
