data merge storage timer:display {internal:{minuteSeperator:[":"], minutes:'[{"score":{"name": "$minutes", "objective": "timer_main"}}, {"storage": "timer:display", "nbt": "internal.minuteSeperator", "interpret": true}]'}}
execute if score $seconds timer_main matches ..9 run data modify storage timer:display internal.minuteSeperator append value "0"
function timer:internal/display/add_seconds