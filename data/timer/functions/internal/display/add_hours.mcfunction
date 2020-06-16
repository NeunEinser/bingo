data merge storage timer:display {internal:{hourSeperator:[":"], hours:'{"score":{"name": "$hours", "objective": "timer_main"}}'}}
execute if score $minutes timer_main matches ..9 run data modify storage timer:display internal.hourSeperator append value "0"
function timer:internal/display/add_minutes