#> neun_einser.timer:detect_pause
#
# This function is used to automatically detect the game being paused and also
# pauses the timer.
#
# If you want to pause the timer when the game is paused, this function needs to
# be called every tick the timer is active.
#
# This works by detecting a single tick taking longer than 5 real time seconds.
#
# @api
# @context dimension The dimension used for the world border.
#
# @reads score $raw 91.timer.time
# @writes
# 	score $start 91.timer.intern
# 	score $detect_pause.previous_tick 91.timer.intern

#>
# @within
# 	function neun_einser.timer:detect_pause
# 	function neun_einser.timer:start/**
#declare score_holder $detect_pause.previous_tick

#>
# @within
# 	function neun_einser.timer:detect_pause
# 	function neun_einser.timer:internal/detected_pause
#declare score_holder $detect_pause.difference
#>
# @private
#declare score_holder $detect_pause.seconds_in_tick

function neun_einser.timer:internal/read_raw

scoreboard players operation $detect_pause.difference 91.timer.tmp = $raw 91.timer.time
scoreboard players operation $detect_pause.difference 91.timer.tmp -= $detect_pause.previous_tick 91.timer.intern
scoreboard players operation $detect_pause.seconds_in_tick 91.timer.tmp = $detect_pause.difference 91.timer.tmp
scoreboard players operation $detect_pause.seconds_in_tick 91.timer.tmp /= $blocks_per_second 91.timer.intern

execute if score $detect_pause.previous_tick 91.timer.intern matches -2147483648..2147483647 if score $detect_pause.seconds_in_tick 91.timer.tmp matches 2.. run function neun_einser.timer:internal/detected_pause

scoreboard players operation $detect_pause.previous_tick 91.timer.intern = $raw 91.timer.time