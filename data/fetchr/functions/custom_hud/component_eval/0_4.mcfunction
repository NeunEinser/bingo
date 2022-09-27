#> fetchr:custom_hud/component_eval/0_4
#
# Binary tree
#
# @within function fetchr:custom_hud/component_eval

execute if score $custom_hud/eval.slot fetchr.tmp matches ..1 run function fetchr:custom_hud/component_eval/0_1
execute if score $custom_hud/eval.slot fetchr.tmp matches 2.. run function fetchr:custom_hud/component_eval/2_4