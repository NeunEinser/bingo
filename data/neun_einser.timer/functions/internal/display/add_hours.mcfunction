data merge storage neun_einser.timer:display {internal:{hourSeperator:[":"], hours:'{"score":{"name": "$hours", "objective": "timer_main"}}'}}
execute if score $minutes timer_main matches ..9 run data modify storage neun_einser.timer:display internal.hourSeperator append value "0"
function neun_einser.timer:internal/display/add_minutes