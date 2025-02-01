#> fetchr:custom_hud/component_eval/padding/15_17
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/9_17

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/width.padding fetchr.io matches 15 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u000f"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 16 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0010"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 17 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0011"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/width.padding fetchr.io matches 15 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u000f"
execute \
	if score $custom_hud/width.padding fetchr.io matches 16 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0010"
execute \
	if score $custom_hud/width.padding fetchr.io matches 17 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0011"
#NEUN_SCRIPT end