#> bingo:util/new_player
#
# Function that is run for every new player
#
# @within tag/function bingo:new_player
# @handles #bingo:new_player

team join bingo.dark_green
recipe give @s *
execute in bingo:lobby run teleport @s -8.5 3 7.5 180 0
execute in bingo:lobby run spawnpoint @s -9 3 7

# Set player ID
#>
# Score holder which holds the next id.
# This is part of the bingo.id objective
#
# @private
#declare score_holder $next
scoreboard players operation @s bingo.id = $next bingo.id
scoreboard players add $next bingo.id 1

data modify storage bingo:custom_hud players append value {}
execute store result storage bingo:custom_hud players[-1].id int 1 run scoreboard players get @s bingo.id
data modify storage bingo:custom_hud players[-1].components set from storage bingo:custom_hud default
scoreboard players set @s bingo.update_hud 1