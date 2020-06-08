execute as @a run function bingo:card_display/display_card

scoreboard players enable @a bingo_seed
execute as @a[scores={bingo_seed=..-1}, limit=1] run function bingo:generate_card_from_seed
execute as @a[scores={bingo_seed=1..}, limit=1] run function bingo:generate_card_from_seed

function timer:read