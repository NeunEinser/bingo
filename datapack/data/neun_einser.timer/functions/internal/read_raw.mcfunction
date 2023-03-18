execute store result score $raw 91.timer.time run worldborder get
execute if score $ticks 91.timer.intern matches 1.. if score $raw 91.timer.time matches 55000000.. run function neun_einser.timer:internal/prevent_breakage
execute if score $ticks 91.timer.intern matches 1.. run scoreboard players operation $last_worldborder_value 91.timer.intern = $raw 91.timer.time

scoreboard players operation $raw 91.timer.time -= $start 91.timer.intern
scoreboard players set $ticks 91.timer.intern 0