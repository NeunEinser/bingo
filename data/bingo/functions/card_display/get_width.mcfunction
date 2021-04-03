#> bingo:card_display/get_width
#
# Calculates the character width the number takes up. Useful for determaining
# the amount of padding spaces required.
#
# @within
# 	function bingo:card_display/display_if_seed_is_set
# 	function bingo:card_display/get_width
# @input score $card_display/width.number bingo.tmp The number to dertmain the
# 	width from
# @output score $card_display/width.width bingo.tmp The calculated width. Must be
# 	set to 0 when calling this function

#>
# Input for function bingo:card_display/get_width
#
# The number to dertmain the width from
#
# @within
# 	function bingo:card_display/display_if_seed_is_set
# 	function bingo:card_display/get_width
#declare score_holder $card_display/width.number
#>
# Output for function bingo:card_display/get_width
#
# The width of the number. Must be 0 when calling this function.
#
# @within function bingo:card_display/**
#declare score_holder $card_display/width.width

scoreboard players remove $card_display/width.width bingo.tmp 6
execute if score $card_display/width.number bingo.tmp matches ..-1 run scoreboard players remove $card_display/width.width bingo.tmp 6
execute if score $card_display/width.number bingo.tmp matches ..-1 run scoreboard players operation $card_display/width.number bingo.tmp *= -1 bingo.const
# Min val *= -1 = min val because of overflow, thus just subtract one to underflow back to max val
execute if score $card_display/width.number bingo.tmp matches -2147483648 run scoreboard players remove $card_display/width.number bingo.tmp 1

scoreboard players operation $card_display/width.number bingo.tmp /= 10 bingo.const

execute unless score $card_display/width.number bingo.tmp matches 0 run function bingo:card_display/get_width