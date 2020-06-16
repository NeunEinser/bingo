data merge storage timer:display {internal:{minuteSeperator:[":"], minutes:'[{"storage": "timer:display", "nbt": "internal.hourSeperator", "interpret": true}, {"score":{"name": "$minutes", "objective": "timer_main"}}]'}}
execute if score $seconds timer_main matches ..9 run data modify storage timer:display internal.minuteSeperator append value "0"
function timer:internal/display/add_seconds