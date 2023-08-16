#> neun_einser.timer:resume
#
# Resumes the timer after it has been paused.
#
# @api

execute if score $blocks_per_second 91.timer.intern matches 1000 run worldborder set 59999000 59998
execute if score $blocks_per_second 91.timer.intern matches 100 run worldborder set 59999900 599989
execute if score $blocks_per_second 91.timer.intern matches 10 run worldborder set 59999960 5999894
execute if score $blocks_per_second 91.timer.intern matches 1 run worldborder set 59999968 59998932

execute if score $in_game 91.timer.intern matches 2 run scoreboard players set $in_game 91.timer.intern 1
execute if score $in_game 91.timer.intern matches 2 run worldborder set 59999968

scoreboard players reset * 91.timer.total_ticks
scoreboard players reset * 91.timer.unpaused_ticks