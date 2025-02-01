#> fetchr:custom_hud/component_eval/padding/60_62
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/54_62

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/width.padding fetchr.io matches 60 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u003c"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 61 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u003d"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 62 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u003e"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/width.padding fetchr.io matches 60 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u003c"
execute \
	if score $custom_hud/width.padding fetchr.io matches 61 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u003d"
execute \
	if score $custom_hud/width.padding fetchr.io matches 62 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u003e"
#NEUN_SCRIPT end