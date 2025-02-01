#> fetchr:custom_hud/components/timer/eval_non_default/slot_8
#
# Evaluates timer for slot 8
#
# @within function fetchr:custom_hud/components/timer/eval_non_default

scoreboard players operation $custom_hud/width.padding fetchr.io = $custom_hud/timer.padding fetchr.tmp
data modify storage io.fetchr:custom_hud component.slot_id set value 8b
function fetchr:custom_hud/component_eval
data \
	modify storage fetchr:custom_hud players[].components[{ id: "fetchr:timer", slot_id: 8b }] \
	set from storage io.fetchr:custom_hud component