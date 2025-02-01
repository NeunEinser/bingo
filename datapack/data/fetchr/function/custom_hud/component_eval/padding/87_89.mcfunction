#> fetchr:custom_hud/component_eval/padding/87_89
#
# Command Tree
#
# @within function fetchr:custom_hud/component_eval/padding/81_89

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/width.padding fetchr.io matches 87 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0057"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 88 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0058"'
#execute \
	if score $custom_hud/width.padding fetchr.io matches 89 \
	run data modify storage io.fetchr:custom_hud component.padding set value '"\\u0059"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/width.padding fetchr.io matches 87 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0057"
execute \
	if score $custom_hud/width.padding fetchr.io matches 88 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0058"
execute \
	if score $custom_hud/width.padding fetchr.io matches 89 \
	run data modify storage io.fetchr:custom_hud component.padding set value "\u0059"
#NEUN_SCRIPT end