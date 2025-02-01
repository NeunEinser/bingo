#> fetchr:custom_hud/components/timer/update/14973_15941
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/14973_17842

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches ..15297 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0117"'
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 15298..15620 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U0118"'
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 15621.. \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0119"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches ..15297 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0117"
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 15298..15620 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0118"
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 15621.. \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0119"
#NEUN_SCRIPT end
