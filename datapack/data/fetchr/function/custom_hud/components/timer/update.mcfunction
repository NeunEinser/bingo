#> fetchr:custom_hud/components/timer/update
#
# @internal

data \
	modify storage io.fetchr:custom_hud component \
	set from storage fetchr:custom_hud default[{ id: "fetchr:timer" }]
#NEUN_SCRIPT until 65
#data modify storage io.fetchr:custom_hud component merge value { icon: '"\\u0132"', changed: true }
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
data modify storage io.fetchr:custom_hud component merge value { icon: "\u0132", changed: true }
#NEUN_SCRIPT end
data \
	modify storage io.fetchr:custom_hud component.textComponent \
	set from storage neun_einser.timer:display "hh:mm:ss" 

# set icon
#>
# @within
# 	function fetchr:custom_hud/components/timer/update
# 	function fetchr:custom_hud/components/timer/update/*
#declare score_holder $custom_hud/timer.daytime
execute \
	store result score $custom_hud/timer.daytime fetchr.tmp \
	run time query daytime

execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches ..11894 \
	run function fetchr:custom_hud/components/timer/update/106_11894
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 11895..20702 \
	run function fetchr:custom_hud/components/timer/update/11895_20702
execute \
	if score $custom_hud/timer.daytime fetchr.tmp matches 20703.. \
	run function fetchr:custom_hud/components/timer/update/20703_23745

#NEUN_SCRIPT until 65
#execute \
	if score $game_state fetchr.state matches 0..1 \
	run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0100"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $game_state fetchr.state matches 0..1 \
	run data modify storage io.fetchr:custom_hud component.icon set value "\u0100"
#NEUN_SCRIPT end

# padding
#>
# @within function fetchr:custom_hud/components/timer/**
#declare score_holder $custom_hud/timer.padding
scoreboard players set $custom_hud/timer.padding fetchr.tmp 33
execute \
	if score $hours 91.timer.io matches ..99 \
	run scoreboard players add $custom_hud/timer.padding fetchr.tmp 6
execute \
	if score $hours 91.timer.io matches ..9 \
	run scoreboard players add $custom_hud/timer.padding fetchr.tmp 6
execute \
	if score $hours 91.timer.io matches 0 \
	run scoreboard players add $custom_hud/timer.padding fetchr.tmp 8
execute \
	if score $hours 91.timer.io matches 0 \
	if score $minutes 91.timer.io matches ..9 \
	run scoreboard players add $custom_hud/timer.padding fetchr.tmp 6
execute \
	if score $hours 91.timer.io matches 0 \
	if score $minutes 91.timer.io matches 0 \
	run scoreboard players add $custom_hud/timer.padding fetchr.tmp 8
execute \
	if score $hours 91.timer.io matches 0 \
	if score $minutes 91.timer.io matches 0 \
	if score $seconds 91.timer.io matches ..9 \
	run scoreboard players add $custom_hud/timer.padding fetchr.tmp 6

# hide timer during pre-gen
#NEUN_SCRIPT until 65
#execute \
	if score $game_state fetchr.state matches ..2 \
	run data modify storage io.fetchr:custom_hud component.textComponent set value '"0"'
#NEUN_SCRIPT end
#NEUN_SCRIPT since 65
execute \
	if score $game_state fetchr.state matches ..2 \
	run data modify storage io.fetchr:custom_hud component.textComponent set value "0"
#NEUN_SCRIPT end
execute \
	if score $game_state fetchr.state matches ..2 \
	run scoreboard players set $custom_hud/timer.padding fetchr.tmp 73

scoreboard players operation $custom_hud/width.padding fetchr.io = $custom_hud/timer.padding fetchr.tmp
function fetchr:custom_hud/component_eval
data \
	modify storage fetchr:custom_hud players[].components[{ id: "fetchr:timer", slot_id: 0b }] \
	set from storage io.fetchr:custom_hud component
execute \
	if data storage fetchr:custom_hud players[].components[{ id: "fetchr:timer", changed: false }] \
	run function fetchr:custom_hud/components/timer/eval_non_default