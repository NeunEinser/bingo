execute store result score $raw timer_main run worldborder get
execute if score $raw timer_main matches 50000000.. run function timer:internal/prevent_overflow

scoreboard players operation $raw timer_main -= $start timer_main

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