execute as @a run function bingo:card_display/display_card

function bingo:tick/lobby

execute as @a unless score @s bingo_id matches -2147483648.. run function bingo:set_player_id