execute store result score $raw timer_main run worldborder get
execute if score $raw timer_main matches 55000000.. run function timer:internal/prevent_overflow

scoreboard players operation $raw timer_main -= $start timer_main