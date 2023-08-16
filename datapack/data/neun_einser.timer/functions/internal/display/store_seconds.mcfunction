#> neun_einser.timer:internal/display/store_seconds
#
# Stores the seconds component to the display storage.
#
# @internal

data merge storage neun_einser.timer:display {internal:{secondSeparator:[], seconds:'[{"storage": "neun_einser.timer:display", "nbt": "internal.minuteSeparator", "interpret": true}, {"score":{"name": "$seconds", "objective": "91.timer.io"}}]'}}
execute if score $blocks_per_second 91.timer.intern matches 10.. run function neun_einser.timer:internal/display/store_fractional_seconds