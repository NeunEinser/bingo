execute as @a run function bingo:card_display/display_card

scoreboard players enable @a bingo_seed
execute as @a[scores={bingo_seed=..-1}] run function bingo:generate_card_from_seed
execute as @a[scores={bingo_seed=1..}] run function bingo:generate_card_from_seed

scoreboard players enable @a bingo_preference
execute as @a[scores={bingo_preference=..-1}] run function bingo:preferences/show_preferences
execute as @a[scores={bingo_preference=1..}] run function bingo:preferences/show_preferences

execute as @a unless score @s bingo_id matches -2147483648.. run function bingo:set_player_id