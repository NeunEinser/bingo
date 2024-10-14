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

scoreboard players set 1073741824 91.math.private 1073741824
