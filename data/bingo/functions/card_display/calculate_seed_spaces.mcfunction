#> bingo:card_display/calculate_seed_spaces
#
# This function calculates the seed spaces based on the width
#
# @within function bingo:card_display/display_card
# @input score $card_display/width.width bingo.tmp
# @output storage bingo:tmp seedSpaces

execute if score $card_display/width.width bingo.tmp matches 64.. run data modify storage bingo:tmp seedSpaces append value ""
execute if score $card_display/width.width bingo.tmp matches 64.. run scoreboard players remove $card_display/width.width bingo.tmp 64
execute if score $card_display/width.width bingo.tmp matches 32.. run data modify storage bingo:tmp seedSpaces append value ""
execute if score $card_display/width.width bingo.tmp matches 32.. run scoreboard players remove $card_display/width.width bingo.tmp 32
execute if score $card_display/width.width bingo.tmp matches 16.. run data modify storage bingo:tmp seedSpaces append value ""
execute if score $card_display/width.width bingo.tmp matches 16.. run scoreboard players remove $card_display/width.width bingo.tmp 16
execute if score $card_display/width.width bingo.tmp matches 8.. run data modify storage bingo:tmp seedSpaces append value ""
execute if score $card_display/width.width bingo.tmp matches 8.. run scoreboard players remove $card_display/width.width bingo.tmp 8
execute if score $card_display/width.width bingo.tmp matches 7 run data modify storage bingo:tmp seedSpaces append value ""
execute if score $card_display/width.width bingo.tmp matches 6 run data modify storage bingo:tmp seedSpaces append value ""
execute if score $card_display/width.width bingo.tmp matches 5 run data modify storage bingo:tmp seedSpaces append value ""
execute if score $card_display/width.width bingo.tmp matches 4 run data modify storage bingo:tmp seedSpaces append value ""
execute if score $card_display/width.width bingo.tmp matches 3 run data modify storage bingo:tmp seedSpaces append value ""
execute if score $card_display/width.width bingo.tmp matches 2 run data modify storage bingo:tmp seedSpaces append value ""
execute if score $card_display/width.width bingo.tmp matches 1 run data modify storage bingo:tmp seedSpaces append value ""