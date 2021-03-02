#> bingo:tick/set_player_id
#
# This function gives @s a unique player ID.
#
# @within function bingo:tick/**
# @context entity Player to give the next ID
#>
# Score holder which holds the next id.
# This is part of the bingo.id objective
#
# @private
#declare score_holder $next

scoreboard players operation @s bingo.id = $next bingo.id
scoreboard players add $next bingo.id 1