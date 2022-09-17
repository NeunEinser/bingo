#> bingo:custom_hud/component_eval/0_4
#
# Binary tree
#
# @within function bingo:custom_hud/component_eval

execute if score $custom_hud/eval.slot bingo.tmp matches ..1 run function bingo:custom_hud/component_eval/0_2
execute if score $custom_hud/eval.slot bingo.tmp matches 2.. run function bingo:custom_hud/component_eval/3_4