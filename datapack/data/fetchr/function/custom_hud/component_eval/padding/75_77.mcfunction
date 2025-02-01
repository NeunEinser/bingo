#> fetchr:custom_hud/component_eval/padding/75_77
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/72_80

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/width.padding fetchr.io matches 75 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u004b"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 76 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u004c"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 77 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u004d"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/width.padding fetchr.io matches 75 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u004b"
execute \
	if score $custom_hud/width.padding fetchr.io matches 76 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u004c"
execute \
	if score $custom_hud/width.padding fetchr.io matches 77 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u004d"
#NEUN_SCRIPT end