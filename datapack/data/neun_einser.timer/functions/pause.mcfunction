#> neun_einser.timer:pause
#
# Pauses the timer.
#
# @api

function neun_einser.timer:internal/read_raw
scoreboard players set $start 91.timer.intern 0
scoreboard players operation $start 91.timer.intern -= $raw 91.timer.io

scoreboard players add $start 91.timer.intern 50000000
execute unless score $in_game 91.timer.intern matches 1.. run worldborder set 50000000
execute if score $in_game 91.timer.intern matches 1.. run scoreboard players set $in_game 91.timer.intern 2