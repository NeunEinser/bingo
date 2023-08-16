#> neun_einser.timer:internal/read_raw
#
# Reads the raw time
#
# @internal

scoreboard players set $raw 91.timer.io 0

execute if score $count_pauses 91.timer.io matches 0 as @a[scores={91.timer.total_ticks=1..}, limit=1] run function neun_einser.timer:internal/remove_paused_time

execute store result score $raw 91.timer.io run worldborder get
execute if score $ticks 91.timer.intern matches 1.. if score $raw 91.timer.io matches 55000000.. run function neun_einser.timer:internal/prevent_breakage
execute if score $ticks 91.timer.intern matches 1.. run scoreboard players operation $last_worldborder_value 91.timer.intern = $raw 91.timer.io

scoreboard players operation $raw 91.timer.io -= $start 91.timer.intern