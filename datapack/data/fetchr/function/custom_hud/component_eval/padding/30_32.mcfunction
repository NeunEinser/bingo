#> fetchr:custom_hud/component_eval/padding/30_32
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/27_35

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/width.padding fetchr.io matches 30 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u001e"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 31 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u001f"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 32 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0020"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/width.padding fetchr.io matches 30 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u001e"
execute \
	if score $custom_hud/width.padding fetchr.io matches 31 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u001f"
execute \
	if score $custom_hud/width.padding fetchr.io matches 32 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0020"
#NEUN_SCRIPT end