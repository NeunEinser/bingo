scoreboard players remove $start 91.timer.intern 5000000
scoreboard players remove $raw 91.timer.time 5000000
worldborder add -5000000

execute if score $blocks_per_second 91.timer.intern matches 1000 run worldborder add 7500000 7500
execute if score $blocks_per_second 91.timer.intern matches 100 run worldborder add 7500000 75000
execute if score $blocks_per_second 91.timer.intern matches 10 run worldborder add 7500000 750000
execute if score $blocks_per_second 91.timer.intern matches 1 run worldborder add 7500000 7500000