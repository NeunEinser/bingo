function neun_einser.timer:internal/read_raw
scoreboard players set $start 91.timer.intern 0
scoreboard players operation $start 91.timer.intern -= $raw 91.timer.time

scoreboard players add $start 91.timer.intern 50000000
worldborder set 50000000