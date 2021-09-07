#> bingo:custom_hud/calculate_padding
#
# This function calculates the seed spaces based on the width
#
# @api
# @input score $custom_hud/width.padding bingo.io
# @output storage io.bingo:custom_hud/padding padding

#>
# Storage used for io in bingo:custom_hud/calculate_padding
#
# @api
#declare storage io.bingo:custom_hud/padding

data modify storage io.bingo:custom_hud/padding padding set value []
execute if score $custom_hud/width.padding bingo.io matches 0 run data modify storage io.bingo:custom_hud/padding padding append value ""

execute if score $custom_hud/width.padding bingo.io matches 64.. run data modify storage io.bingo:custom_hud/padding padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 64.. run scoreboard players remove $custom_hud/width.padding bingo.io 64
execute if score $custom_hud/width.padding bingo.io matches 32.. run data modify storage io.bingo:custom_hud/padding padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 32.. run scoreboard players remove $custom_hud/width.padding bingo.io 32
execute if score $custom_hud/width.padding bingo.io matches 16.. run data modify storage io.bingo:custom_hud/padding padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 16.. run scoreboard players remove $custom_hud/width.padding bingo.io 16
execute if score $custom_hud/width.padding bingo.io matches 8.. run data modify storage io.bingo:custom_hud/padding padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 8.. run scoreboard players remove $custom_hud/width.padding bingo.io 8
execute if score $custom_hud/width.padding bingo.io matches 7 run data modify storage io.bingo:custom_hud/padding padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 6 run data modify storage io.bingo:custom_hud/padding padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 5 run data modify storage io.bingo:custom_hud/padding padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 4 run data modify storage io.bingo:custom_hud/padding padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 3 run data modify storage io.bingo:custom_hud/padding padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 2 run data modify storage io.bingo:custom_hud/padding padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 1 run data modify storage io.bingo:custom_hud/padding padding append value ""