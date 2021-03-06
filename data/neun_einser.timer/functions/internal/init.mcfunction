#declare storage neun_einser.timer:display

scoreboard objectives add timer_main dummy "Minecraft Timer"
scoreboard objectives add timer_const dummy "Constant Table"
scoreboard players set 60 timer_const 60

data merge storage neun_einser.timer:display {"hh:mm:ss.s": '[{"storage": "neun_einser.timer:display", "nbt": "internal.hours", "interpret": true}, {"storage": "neun_einser.timer:display", "nbt": "internal.minutes", "interpret": true}, {"storage": "neun_einser.timer:display", "nbt": "internal.seconds", "interpret": true}, {"storage": "neun_einser.timer:display", "nbt": "internal.millis", "interpret": true}]', "hh:mm:ss": '[{"storage": "neun_einser.timer:display", "nbt": "internal.hours", "interpret": true}, {"storage": "neun_einser.timer:display", "nbt": "internal.minutes", "interpret": true}, {"storage": "neun_einser.timer:display", "nbt": "internal.seconds", "interpret": true}]', "hh:mm": '[{"storage": "neun_einser.timer:display", "nbt": "internal.hours", "interpret": true}, {"storage": "neun_einser.timer:display", "nbt": "internal.minutes", "interpret": true}]'}