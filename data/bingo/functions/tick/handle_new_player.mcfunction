#> bingo:tick/handle_new_player
#
# Function that is run for every new player
#
# @within tag/function bingo:new_player
# @handles #bingo:new_player

team join bingo.dark_green
recipe give @s *

gamemode adventure
scoreboard players set @s bingo.resources 1
scoreboard players enable @s bingo.resources
effect give @s minecraft:weakness 1000000 255 true
tag @s add bingo.resourcepack_check

setblock 1 2 2 minecraft:sea_lantern

scoreboard players add @s bingo.operator 0

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