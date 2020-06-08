scoreboard players remove $start timer_main 40000000
scoreboard players remove $raw timer_main 40000000
worldborder add -40000000

execute if score $blocks_per_second timer_main matches 1000 run worldborder add 40000000 40000
execute if score $blocks_per_second timer_main matches 100 run worldborder add 40000000 400000
execute if score $blocks_per_second timer_main matches 10 run worldborder add 40000000 4000000
execute if score $blocks_per_second timer_main matches 1 run worldborder add 40000000 40000000