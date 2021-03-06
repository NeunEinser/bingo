function neun_einser.timer:internal/read_raw

scoreboard players operation $millis 91.timer.main = $raw 91.timer.main
scoreboard players operation $seconds 91.timer.main = $millis 91.timer.main
scoreboard players operation $seconds 91.timer.main /= $blocks_per_second 91.timer.main
scoreboard players operation $minutes 91.timer.main = $seconds 91.timer.main
scoreboard players operation $minutes 91.timer.main /= 60 91.timer.const
scoreboard players operation $hours 91.timer.main = $minutes 91.timer.main
scoreboard players operation $hours 91.timer.main /= 60 91.timer.const

scoreboard players operation $millis 91.timer.main %= $blocks_per_second 91.timer.main
scoreboard players operation $seconds 91.timer.main %= 60 91.timer.const
scoreboard players operation $minutes 91.timer.main %= 60 91.timer.const