#> neun_einser.timer:read
#
# Reads the timer and stores the result in the score holders $hours, $minutes,
# \$seconds and $millis.
#
# @api
# @output
# 	score $hours 91.timer.io The hours of the timer.
# 	score $minutes 91.timer.io The minutes of the timer.
# 	score $seconds 91.timer.io The seconds of the timer.
# 	score $millis 91.timer.io The milliseconds of the timer.
# 	score $raw 91.timer.io The raw time of the timer (total time in the
# 		timer's precision).
# 	score $current_percision 91.timer.io The current precision of the timer.

execute unless score $in_game 91.timer.intern matches 1 if score $blocks_per_second 91.timer.intern matches 1.. run function neun_einser.timer:internal/read_raw
execute if score $in_game 91.timer.intern matches 1 run function neun_einser.timer:internal/read_in_game

scoreboard players reset * 91.timer.unpaused_ticks
scoreboard players reset * 91.timer.total_ticks

scoreboard players operation $current_percision 91.timer.io = $blocks_per_second 91.timer.intern
execute if score $in_game 91.timer.intern matches 1 run scoreboard players set $current_percision 91.timer.io 20
scoreboard players operation $millis 91.timer.io = $raw 91.timer.io
scoreboard players operation $seconds 91.timer.io = $millis 91.timer.io
scoreboard players operation $seconds 91.timer.io /= $current_percision 91.timer.io
scoreboard players operation $minutes 91.timer.io = $seconds 91.timer.io
scoreboard players operation $minutes 91.timer.io /= 60 91.timer.intern
scoreboard players operation $hours 91.timer.io = $minutes 91.timer.io
scoreboard players operation $hours 91.timer.io /= 60 91.timer.intern

scoreboard players operation $millis 91.timer.io %= $current_percision 91.timer.io
execute if score $in_game 91.timer.intern matches 1 run scoreboard players operation $millis 91.timer.io *= 5 91.timer.intern
scoreboard players operation $seconds 91.timer.io %= 60 91.timer.intern
scoreboard players operation $minutes 91.timer.io %= 60 91.timer.intern