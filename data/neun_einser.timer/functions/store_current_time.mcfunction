function neun_einser.timer:read
data remove storage neun_einser.timer:display internal

execute if score $hours timer_main matches 1.. run function neun_einser.timer:internal/display/add_hours
execute if score $hours timer_main matches 0 if score $minutes timer_main matches 1.. run function neun_einser.timer:internal/display/add_minutes
execute if score $hours timer_main matches 0 if score $minutes timer_main matches 0 run function neun_einser.timer:internal/display/add_seconds