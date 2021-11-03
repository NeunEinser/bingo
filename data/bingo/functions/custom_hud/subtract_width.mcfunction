#> bingo:custom_hud/subtract_width
#
# Subtracts the character width the given number takes up. Useful for
# determaining the amount of padding spaces required.
#
# @api
# @input score $custom_hud/width.number bingo.io The number to dertmain the
# 	width from
# @writes score $custom_hud/width.padding bingo.io The width of the number is
# 		subtracted from that score

#>
# Input for function bingo:custom_hud/get_width
#
# The number to dertmain the width from
#
# @api
#declare score_holder $custom_hud/width.number
#>
# The resulting width
#
# @api
#declare score_holder $custom_hud/width.padding
#>
# The resulting width
#
# @api
#declare score_holder $custom_hud/width.characters

# If value is positive, reset since it's from a previous iteration.
# While iterating, the value is represented in a negative form to be able to do this.
execute if score $custom_hud/width.characters bingo.io matches 1.. run scoreboard players set $custom_hud/width.characters bingo.io 0

scoreboard players remove $custom_hud/width.characters bingo.io 1
execute if score $custom_hud/width.number bingo.io matches -2147483648.. run scoreboard players remove $custom_hud/width.padding bingo.io 6
execute if score $custom_hud/width.number bingo.io matches ..-1 run scoreboard players remove $custom_hud/width.padding bingo.io 6
execute if score $custom_hud/width.number bingo.io matches ..-1 run scoreboard players remove $custom_hud/width.characters bingo.io 1
execute if score $custom_hud/width.number bingo.io matches ..-1 run scoreboard players operation $custom_hud/width.number bingo.io *= -1 bingo.const
# Min val *= -1 = min val because of overflow, thus just subtract one to underflow back to max val.
# Does only alter the last digit and will have no effect for the number's width
execute if score $custom_hud/width.number bingo.io matches -2147483648 run scoreboard players remove $custom_hud/width.number bingo.io 1

scoreboard players operation $custom_hud/width.number bingo.io /= 10 bingo.const

execute if score $custom_hud/width.number bingo.io matches 0 run scoreboard players operation $custom_hud/width.characters bingo.io *= -1 bingo.const
execute unless score $custom_hud/width.number bingo.io matches 0 run function bingo:custom_hud/subtract_width