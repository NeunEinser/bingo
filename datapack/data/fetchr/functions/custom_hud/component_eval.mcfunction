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

execute if score $custom_hud/width.padding fetchr.io matches ..80 run function fetchr:custom_hud/component_eval/padding/0_80
execute if score $custom_hud/width.padding fetchr.io matches 81.. run function fetchr:custom_hud/component_eval/padding/81_91


#>
# @within
# 	function fetchr:custom_hud/component_eval
# 	function fetchr:custom_hud/component_eval/slot/*
#declare score_holder $custom_hud/eval.slot
execute store result score $custom_hud/eval.slot fetchr.tmp run data get storage io.fetchr:custom_hud component.slot_id

execute if score $custom_hud/eval.slot fetchr.tmp matches ..4 run function fetchr:custom_hud/component_eval/slot/0_4
execute if score $custom_hud/eval.slot fetchr.tmp matches 5.. run function fetchr:custom_hud/component_eval/slot/5_10

data modify storage io.fetchr:custom_hud component.evaluated set from block 7 0 7 front_text.messages[0]