#> bingo:tick/tick
#
# This function is called every tick
#
# This contains some base logic, but most of the stuff happens in
# bingo:card_display/display_card or GAMELOOP_TO_BE_IMPLEMENTED
#
# @within tag/function minecraft:tick
# @handles #minecraft:tick

execute as @a run function bingo:card_display/display_card

execute in bingo:lobby run function bingo:lobby/tick

# Assign each player a unique ID
execute as @a unless score @s bingo.id matches -2147483648.. run function bingo:tick/set_player_id