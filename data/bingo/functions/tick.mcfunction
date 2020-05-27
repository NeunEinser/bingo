execute as @a run function bingo:card_display/display_card

scoreboard players enable @a seed
execute as @p[scores={seed=..-1}] run function bingo:generate_card_from_seed
execute as @p[scores={seed=1..}] run function bingo:generate_card_from_seed