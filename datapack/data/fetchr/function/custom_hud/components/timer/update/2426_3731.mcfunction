#> fetchr:custom_hud/components/timer/update/2426_3731
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/106_3731

execute if score $custom_hud/timer.daytime fetchr.tmp matches ..2847 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0139"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 2848..3282 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u013A"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 3283.. run data modify storage io.fetchr:custom_hud component.icon set value '"\\u013B"'
