execute store result score $raw 91.timer.time run worldborder get
execute if score $raw 91.timer.time matches 55000000.. run function neun_einser.timer:internal/prevent_overflow

scoreboard players operation $raw 91.timer.time -= $start 91.timer.time