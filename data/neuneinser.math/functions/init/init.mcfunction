#> neuneinser.math:init/init
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
# Temporary results
# @internal
scoreboard objectives add 91.math.tmp dummy
