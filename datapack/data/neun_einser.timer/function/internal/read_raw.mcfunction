#> neun_einser.timer:internal/read_raw
#
# Reads the raw time
#
# @internal


execute \
	if score $count_pauses 91.timer.io matches 0 \
	as @a[scores={91.timer.total_ticks=1..}, limit=1] \
	run function neun_einser.timer:internal/remove_paused_time

#NEUN_SCRIPT until 90
#scoreboard players set $raw 91.timer.io 0
#execute \
	store result score $raw 91.timer.io \
	run worldborder get

#execute \
	if score $raw 91.timer.io < $last_worldborder_value 91.timer.intern \
	run function neun_einser.timer:internal/handle_reset_world_border

#execute \
	if score $raw 91.timer.io matches 55000000.. \
	run function neun_einser.timer:internal/prevent_breakage
#scoreboard players operation $last_worldborder_value 91.timer.intern = $raw 91.timer.io

#scoreboard players set $ticks 91.timer.intern 0
#NEUN_SCRIPT end
#NEUN_SCRIPT since 90
execute \
	store result score $raw 91.timer.io \
	run stopwatch query neun_einser.timer:timer 1000
#NEUN_SCRIPT end