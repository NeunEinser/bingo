#> fetchr:custom_hud/components/timer/update/12960_13981
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/11895_14972

#NEUN_SCRIPT until 65
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches ..13304 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0111"'
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 13305..13644 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\U0112"'
#execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 13645.. \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0113"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches ..13304 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0111"
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 13305..13644 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0112"
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 13645.. \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0113"
#NEUN_SCRIPT end
