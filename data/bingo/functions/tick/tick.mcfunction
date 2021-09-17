#> bingo:tick/tick
#
# This function is called every tick
#
# This contains some base logic, but most of the stuff happens in
# bingo:lobby/tick and bingo:game/tick
#
# @within tag/function minecraft:tick
# @handles #minecraft:tick

scoreboard players enable @a bingo.card_pos
execute in bingo:lobby run function neun_einser.timer:store_current_time

# Assign each player a unique ID
execute as @a unless score @s bingo.id matches -2147483648.. run function bingo:tick/new_player

# custom hud
data modify storage tmp.bingo:custom_hud handled set value []
execute as @a run function bingo:custom_hud/tick
data modify storage bingo:custom_hud players append from storage tmp.bingo:custom_hud handled[]
scoreboard players reset $update_card bingo.state

# change preferences
scoreboard players enable @a bingo.pref
execute as @a[scores={bingo.pref=..-1}] run function bingo:preferences/exec
execute as @a[scores={bingo.pref=1..}] run function bingo:preferences/exec

# Loop depending on game state
execute if entity @a[predicate=bingo:is_in_lobby, limit=1] in bingo:lobby run function bingo:lobby/tick
execute if score $game_state bingo.state matches 2 run function bingo:game/tick

scoreboard players operation $last_tick bingo.state = $raw 91.timer.time