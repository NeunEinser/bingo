execute as @a run function bingo:card_display/display_card

execute in bingo:lobby run function bingo:lobby/tick

execute as @a unless score @s bingo.id matches -2147483648.. run function bingo:set_player_id