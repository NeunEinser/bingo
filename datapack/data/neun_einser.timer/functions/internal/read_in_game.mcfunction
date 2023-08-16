#> neun_einser.timer:internal/read_in_game
#
# Stores the raw in-game time
#
# @internal

execute if score $count_pauses 91.timer.io matches 1 run scoreboard players operation $ticks 91.timer.intern += @a[scores={91.timer.unpaused_ticks=1..}, limit=1] 91.timer.total_ticks
execute if score $count_pauses 91.timer.io matches 0 run scoreboard players operation $ticks 91.timer.intern += @a[scores={91.timer.unpaused_ticks=1..}, limit=1] 91.timer.unpaused_ticks
scoreboard players operation $raw 91.timer.io = $ticks 91.timer.intern