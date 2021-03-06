scoreboard players remove $start timer_main 5000000
scoreboard players remove $raw timer_main 5000000
worldborder add -5000000

execute if score $blocks_per_second timer_main matches 1000 run worldborder add 7500000 7500
execute if score $blocks_per_second timer_main matches 100 run worldborder add 7500000 75000
execute if score $blocks_per_second timer_main matches 10 run worldborder add 7500000 750000
execute if score $blocks_per_second timer_main matches 1 run worldborder add 7500000 7500000