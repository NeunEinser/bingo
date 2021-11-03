#> bingo:custom_hud/component_post_evaluation
#
# This function should be called at the very end of each component's update
# function right before writing it back to the player. 
#
# @api
# @input $custom_hud/width.padding bingo.io
# @writes storage io.bingo:custom_hud component

#>
# Storage used to pass the component to function
# bingo:custom_hud/component_post_evaluation
#
# @api
#declare storage io.bingo:custom_hud

data modify storage io.bingo:custom_hud component.padding set value []
execute if score $custom_hud/width.padding bingo.io matches 0 run data modify storage io.bingo:custom_hud component.padding append value ""

execute if score $custom_hud/width.padding bingo.io matches 64.. run data modify storage io.bingo:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 64.. run scoreboard players remove $custom_hud/width.padding bingo.io 64
execute if score $custom_hud/width.padding bingo.io matches 32.. run data modify storage io.bingo:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 32.. run scoreboard players remove $custom_hud/width.padding bingo.io 32
execute if score $custom_hud/width.padding bingo.io matches 16.. run data modify storage io.bingo:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 16.. run scoreboard players remove $custom_hud/width.padding bingo.io 16
execute if score $custom_hud/width.padding bingo.io matches 8.. run data modify storage io.bingo:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 8.. run scoreboard players remove $custom_hud/width.padding bingo.io 8
execute if score $custom_hud/width.padding bingo.io matches 7 run data modify storage io.bingo:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 6 run data modify storage io.bingo:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 5 run data modify storage io.bingo:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 4 run data modify storage io.bingo:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 3 run data modify storage io.bingo:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 2 run data modify storage io.bingo:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding bingo.io matches 1 run data modify storage io.bingo:custom_hud component.padding append value ""

execute in bingo:lobby run setblock 0 0 0 minecraft:oak_sign{Text1: '{"storage":"io.bingo:custom_hud","nbt":"component.textComponent","interpret":true,"color":"black"}'}
execute in bingo:lobby run data modify storage io.bingo:custom_hud component.evaluatedShadow set from block 0 0 0 Text1
execute in bingo:lobby run data modify block 0 0 0 Text1 set from storage io.bingo:custom_hud component.textComponent
execute in bingo:lobby run data modify storage io.bingo:custom_hud component.evaluatedTextComponent set from block 0 0 0 Text1
execute in bingo:lobby run setblock 0 0 0 minecraft:air
