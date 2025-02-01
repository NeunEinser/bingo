#> fetchr:custom_hud/component_eval/padding/57_59
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/54_62

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/width.padding fetchr.io matches 57 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0039"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 58 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u003a"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 59 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u003b"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/width.padding fetchr.io matches 57 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0039"
execute \
	if score $custom_hud/width.padding fetchr.io matches 58 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u003a"
execute \
	if score $custom_hud/width.padding fetchr.io matches 59 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u003b"
#NEUN_SCRIPT end