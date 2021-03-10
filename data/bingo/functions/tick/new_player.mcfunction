#> bingo:tick/new_player
#
# Function that is run for every new player
#
# @within bingo:tick/tick

team join bingo.dark_green
recipe give @s *
execute in bingo:lobby run teleport 0 64 0

# Set player ID
#>
# Score holder which holds the next id.
# This is part of the bingo.id objective
#
# @private
#declare score_holder $next
scoreboard players operation @s bingo.id = $next bingo.id
scoreboard players add $next bingo.id 1