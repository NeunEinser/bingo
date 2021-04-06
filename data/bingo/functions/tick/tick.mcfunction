#> bingo:tick/tick
#
# This function is called every tick
#
# This contains some base logic, but most of the stuff happens in
# bingo:card_display/display_card or GAMELOOP_TO_BE_IMPLEMENTED
#
# @within tag/function minecraft:tick
# @handles #minecraft:tick

# Assign each player a unique ID
execute as @a unless score @s bingo.id matches -2147483648.. run function bingo:tick/new_player

# change preferences
scoreboard players enable @a bingo.pref
execute as @a[scores={bingo.pref=..-1}] run function bingo:preferences/show_preferences
execute as @a[scores={bingo.pref=1..}] run function bingo:preferences/show_preferences

# Loop depending on game state
execute if entity @a[predicate=bingo:is_in_lobby, limit=1] in bingo:lobby run function bingo:lobby/tick
execute if score $game_in_progress bingo.state matches 1 run function bingo:game/tick