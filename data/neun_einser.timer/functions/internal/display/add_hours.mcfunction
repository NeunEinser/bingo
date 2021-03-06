data merge storage neun_einser.timer:display {internal:{hourSeperator:[":"], hours:'{"score":{"name": "$hours", "objective": "91.timer.time"}}'}}
execute if score $minutes 91.timer.time matches ..9 run data modify storage neun_einser.timer:display internal.hourSeperator append value "0"
function neun_einser.timer:internal/display/add_minutes