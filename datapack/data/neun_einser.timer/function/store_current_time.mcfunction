#> neun_einser.timer:store_current_time
#
# Stores the current time in the storage in various formats as a text component
# string.
#
# You may need to evaluate the text component using a sign depending on your
# needs, as it is not processed automatically.
#
# Additionally, the time is stored in the scoreboard `91.timer.io`, but if
# you only need the scoreboard time, you should call `neun_einser.timer:read`
# instead.
#
# @api
# @output
# 	storage neun_einser.timer:display hh:mm:ss.s - The current time in the
# 		format hh:mm:ss.s, with an amount of decimal places depending on the
# 		precision of the timer.
# 	storage neun_einser.timer:display hh:mm:ss - The current time in the
# 		format hh:mm:ss.
# 	storage neun_einser.timer:display hh:mm - The current time in the format
# 		hh:mm.
# 	score $hours 91.timer.io The hours of the timer.
# 	score $minutes 91.timer.io The minutes of the timer.
# 	score $seconds 91.timer.io The seconds of the timer.
# 	score $millis 91.timer.io The milliseconds of the timer.
# 	score $raw 91.timer.io The raw time of the timer (total time in the
# 		timer's precision).
# 	score $current_percision 91.timer.io The current precision of the timer.

function neun_einser.timer:read
data remove storage neun_einser.timer:display internal

execute if score $hours 91.timer.io matches 1.. run function neun_einser.timer:internal/display/store_hours
execute if score $hours 91.timer.io matches 0 if score $minutes 91.timer.io matches 1.. run function neun_einser.timer:internal/display/store_minutes
execute if score $hours 91.timer.io matches 0 if score $minutes 91.timer.io matches 0 run function neun_einser.timer:internal/display/store_seconds