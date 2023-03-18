#> neun_einser.timer:internal/detected_pause
#
# This function is called when neun_einser.timer:detect_pause detected the game
# being paused.
#
# @within function neun_einser.timer:detect_pause
# @reads score $detect_pause.difference 91.timer.tmp
# @writes score $start 91.timer.intern

#>
# @private
#declare score_holder $detect_pause.blocks_per_tick

scoreboard players operation $start 91.timer.intern += $detect_pause.difference 91.timer.tmp
scoreboard players operation $detect_pause.blocks_per_tick 91.timer.tmp = $blocks_per_second 91.timer.intern
scoreboard players operation $detect_pause.blocks_per_tick 91.timer.tmp /= 20 91.timer.intern

scoreboard players operation $start 91.timer.intern -= $detect_pause.blocks_per_tick 91.timer.intern

tellraw @a {"score": {"name": "$detect_pause.difference", "objective": "91.timer.tmp"}}

say [TIMER/DEBUG] Pause detected (tick took longer than 2 seconds)