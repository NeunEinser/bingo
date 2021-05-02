#> bingo:tick/new_player
#
# Function that is run for every new player
#
# @within bingo:tick/tick

team join bingo.dark_green
recipe give @s *
execute in bingo:lobby run teleport @s -8.5 1.0625 7.5 180 0
execute in bingo:lobby run spawnpoint @s -9 1 7

# Set player ID
#>
# Score holder which holds the next id.
# This is part of the bingo.id objective
#
# @private
#declare score_holder $next
scoreboard players operation @s bingo.id = $next bingo.id
scoreboard players add $next bingo.id 1