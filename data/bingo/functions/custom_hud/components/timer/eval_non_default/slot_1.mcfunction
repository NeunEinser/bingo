#> bingo:custom_hud/components/timer/eval_non_default/slot_1
#
# Evaluates timer for slot 1
#
# @within function bingo:custom_hud/components/timer/eval_non_default

scoreboard players operation $custom_hud/width.padding bingo.io = $custom_hud/timer.padding bingo.tmp
data modify storage io.bingo:custom_hud component.slot_id set value 1b
function bingo:custom_hud/component_eval
data modify storage bingo:custom_hud players[].components[{id: "bingo:timer", slot_id: 1b}] set from storage io.bingo:custom_hud component