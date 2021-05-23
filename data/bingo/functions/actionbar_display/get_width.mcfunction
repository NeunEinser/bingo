#> bingo:actionbar_display/get_width
#
# Calculates the character width the number takes up. Useful for determaining
# the amount of padding spaces required.
#
# @within
# 	function bingo:actionbar_display/display_if_seed_is_set
# 	function bingo:actionbar_display/get_width
# @input score $actionbar_display/width.number bingo.tmp The number to dertmain the
# 	width from
# @output score $actionbar_display/width.width bingo.tmp The calculated width. Must be
# 	set to 0 when calling this function

#>
# Input for function bingo:actionbar_display/get_width
#
# The number to dertmain the width from
#
# @within
# 	function bingo:actionbar_display/display_if_seed_is_set
# 	function bingo:actionbar_display/get_width
#declare score_holder $actionbar_display/width.number
#>
# Output for function bingo:actionbar_display/get_width
#
# The width of the number. Must be 0 when calling this function.
#
# @within function bingo:actionbar_display/**
#declare score_holder $actionbar_display/width.width

scoreboard players remove $actionbar_display/width.width bingo.tmp 6
execute if score $actionbar_display/width.number bingo.tmp matches ..-1 run scoreboard players remove $actionbar_display/width.width bingo.tmp 6
execute if score $actionbar_display/width.number bingo.tmp matches ..-1 run scoreboard players operation $actionbar_display/width.number bingo.tmp *= -1 bingo.const
# Min val *= -1 = min val because of overflow, thus just subtract one to underflow back to max val
execute if score $actionbar_display/width.number bingo.tmp matches -2147483648 run scoreboard players remove $actionbar_display/width.number bingo.tmp 1

scoreboard players operation $actionbar_display/width.number bingo.tmp /= 10 bingo.const

execute unless score $actionbar_display/width.number bingo.tmp matches 0 run function bingo:actionbar_display/get_width