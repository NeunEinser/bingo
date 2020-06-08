function timer:internal/read_raw

scoreboard players operation $millis timer_main = $raw timer_main
scoreboard players operation $seconds timer_main = $millis timer_main
scoreboard players operation $seconds timer_main /= $blocks_per_second timer_main
scoreboard players operation $minutes timer_main = $seconds timer_main
scoreboard players operation $minutes timer_main /= 60 timer_const
scoreboard players operation $hours timer_main = $minutes timer_main
scoreboard players operation $hours timer_main /= 60 timer_const

scoreboard players operation $millis timer_main %= $blocks_per_second timer_main
scoreboard players operation $seconds timer_main %= 60 timer_const
scoreboard players operation $minutes timer_main %= 60 timer_const