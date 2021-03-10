scoreboard players set $raw 91.timer.time 0
execute if score $blocks_per_second 91.timer.intern matches 1.. run function neun_einser.timer:internal/read_raw

scoreboard players operation $millis 91.timer.time = $raw 91.timer.time
scoreboard players operation $seconds 91.timer.time = $millis 91.timer.time
scoreboard players operation $seconds 91.timer.time /= $blocks_per_second 91.timer.intern
scoreboard players operation $minutes 91.timer.time = $seconds 91.timer.time
scoreboard players operation $minutes 91.timer.time /= 60 91.timer.intern
scoreboard players operation $hours 91.timer.time = $minutes 91.timer.time
scoreboard players operation $hours 91.timer.time /= 60 91.timer.intern

scoreboard players operation $millis 91.timer.time %= $blocks_per_second 91.timer.intern
scoreboard players operation $seconds 91.timer.time %= 60 91.timer.intern
scoreboard players operation $minutes 91.timer.time %= 60 91.timer.intern