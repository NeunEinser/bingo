#> bingo:tick/tick
#
# This function is called every tick
#
# This contains some base logic, but most of the stuff happens in
# bingo:lobby/tick and bingo:game/tick
#
# @within tag/function minecraft:tick
# @handles #minecraft:tick

execute as @a run function bingo:custom_hud/tick

# Assign each player a unique ID
execute as @a unless score @s bingo.id matches -2147483648.. run function bingo:tick/new_player

# change preferences
scoreboard players enable @a bingo.pref
execute as @a[scores={bingo.pref=..-1}] run function bingo:preferences/show_preferences
execute as @a[scores={bingo.pref=1..}] run function bingo:preferences/show_preferences

# Loop depending on game state
execute if entity @a[predicate=bingo:is_in_lobby, limit=1] in bingo:lobby run function bingo:lobby/tick
execute if score $game_state bingo.state matches 2 run function bingo:game/tick