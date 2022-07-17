#> fetchr:custom_hud/subtract_width
#
# Subtracts the character width the given number takes up. Useful for
# determaining the amount of padding spaces required.
#
# @api
# @input score $custom_hud/width.number fetchr.io The number to dertmain the
# 	width from
# @writes score $custom_hud/width.padding fetchr.io The width of the number is
# 		subtracted from that score

#>
# Input for function fetchr:custom_hud/get_width
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
execute if score $custom_hud/width.characters fetchr.io matches 1.. run scoreboard players set $custom_hud/width.characters fetchr.io 0

scoreboard players remove $custom_hud/width.characters fetchr.io 1
execute if score $custom_hud/width.number fetchr.io matches -2147483648.. run scoreboard players remove $custom_hud/width.padding fetchr.io 6
execute if score $custom_hud/width.number fetchr.io matches ..-1 run scoreboard players remove $custom_hud/width.padding fetchr.io 6
execute if score $custom_hud/width.number fetchr.io matches ..-1 run scoreboard players remove $custom_hud/width.characters fetchr.io 1
execute if score $custom_hud/width.number fetchr.io matches ..-1 run scoreboard players operation $custom_hud/width.number fetchr.io *= -1 fetchr.const
# Min val *= -1 = min val because of overflow, thus just subtract one to underflow back to max val.
# Does only alter the last digit and will have no effect for the number's width
execute if score $custom_hud/width.number fetchr.io matches -2147483648 run scoreboard players remove $custom_hud/width.number fetchr.io 1

scoreboard players operation $custom_hud/width.number fetchr.io /= 10 fetchr.const

execute if score $custom_hud/width.number fetchr.io matches 0 run scoreboard players operation $custom_hud/width.characters fetchr.io *= -1 fetchr.const
execute unless score $custom_hud/width.number fetchr.io matches 0 run function fetchr:custom_hud/subtract_width