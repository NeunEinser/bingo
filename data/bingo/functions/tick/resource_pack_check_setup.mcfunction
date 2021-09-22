#> bingo:tick/resource_pack_check_setup
#
# Sets a new player up for a resourcepack check.
#
# @within function bingo:tick/handle_new_player
# @context entity Player who is being set up

gamemode adventure
scoreboard players enable @s bingo.resources
effect give @s minecraft:weakness 1000000 255 true
tag @s add bingo.resourcepack_check

trigger bingo.resources