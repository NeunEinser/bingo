execute as @a run function bingo:card_display/display_card

scoreboard players enable @a bingo_seed
execute as @a[scores={bingo_seed=..-1}, limit=1] run function bingo:generate_card_from_seed
execute as @a[scores={bingo_seed=1..}, limit=1] run function bingo:generate_card_from_seed

execute as @a unless score @s bingo_id matches -2147483648.. run function bingo:set_player_id