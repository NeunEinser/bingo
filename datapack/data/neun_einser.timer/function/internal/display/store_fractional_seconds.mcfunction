#> neun_einser.timer:internal/display/store_fractional_seconds
#
# Stores the fractional seconds component to the display storage.
#
# @internal

data merge storage neun_einser.timer:display {internal:{secondSeparator: ["."], millis: '[{"storage": "neun_einser.timer:display", "nbt": "internal.secondSeparator", "interpret": true}, {"score":{"name": "$millis", "objective": "91.timer.io"}}]'}}
execute if score $blocks_per_second 91.timer.intern matches 100.. if score $millis 91.timer.io matches ..9 run data modify storage neun_einser.timer:display internal.secondSeparator append value "0"
execute if score $blocks_per_second 91.timer.intern matches 1000 if score $millis 91.timer.io matches ..99 run data modify storage neun_einser.timer:display internal.secondSeparator append value "0"