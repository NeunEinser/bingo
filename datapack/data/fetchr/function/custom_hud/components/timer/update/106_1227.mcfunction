#> fetchr:custom_hud/components/timer/update/106_1227
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/106_3731

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches ..472 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0133"'
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 473..845 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U0134"'
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 846.. \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0135"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches ..472 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0133"
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 473..845 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0134"
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 846.. \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0135"
#NEUN_SCRIPT end
