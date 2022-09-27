#> fetchr:custom_hud/component_eval
#
# This function should be called at the very end of each component's update
# function right before writing it back to the player. 
#
# @api
# @input $custom_hud/width.padding fetchr.io
# @writes storage io.fetchr:custom_hud component

#>
# Storage used to pass the component to function
# fetchr:custom_hud/component_post_evaluation
#
# @api
#declare storage io.fetchr:custom_hud

data modify storage io.fetchr:custom_hud component.padding set value []
execute if score $custom_hud/width.padding fetchr.io matches 0 run data modify storage io.fetchr:custom_hud component.padding append value ""

execute if score $custom_hud/width.padding fetchr.io matches 64.. run data modify storage io.fetchr:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding fetchr.io matches 64.. run scoreboard players remove $custom_hud/width.padding fetchr.io 64
execute if score $custom_hud/width.padding fetchr.io matches 32.. run data modify storage io.fetchr:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding fetchr.io matches 32.. run scoreboard players remove $custom_hud/width.padding fetchr.io 32
execute if score $custom_hud/width.padding fetchr.io matches 16.. run data modify storage io.fetchr:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding fetchr.io matches 16.. run scoreboard players remove $custom_hud/width.padding fetchr.io 16
execute if score $custom_hud/width.padding fetchr.io matches 8.. run data modify storage io.fetchr:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding fetchr.io matches 8.. run scoreboard players remove $custom_hud/width.padding fetchr.io 8
execute if score $custom_hud/width.padding fetchr.io matches 7 run data modify storage io.fetchr:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding fetchr.io matches 6 run data modify storage io.fetchr:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding fetchr.io matches 5 run data modify storage io.fetchr:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding fetchr.io matches 4 run data modify storage io.fetchr:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding fetchr.io matches 3 run data modify storage io.fetchr:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding fetchr.io matches 2 run data modify storage io.fetchr:custom_hud component.padding append value ""
execute if score $custom_hud/width.padding fetchr.io matches 1 run data modify storage io.fetchr:custom_hud component.padding append value ""


#>
# @within
# 	function fetchr:custom_hud/component_eval
# 	function fetchr:custom_hud/component_eval/*
#declare score_holder $custom_hud/eval.slot
execute store result score $custom_hud/eval.slot fetchr.tmp run data get storage io.fetchr:custom_hud component.slot_id

execute if score $custom_hud/eval.slot fetchr.tmp matches ..4 run function fetchr:custom_hud/component_eval/0_4
execute if score $custom_hud/eval.slot fetchr.tmp matches 5.. run function fetchr:custom_hud/component_eval/5_10

data modify storage io.fetchr:custom_hud component.evaluated set from block 7 0 7 Text1
