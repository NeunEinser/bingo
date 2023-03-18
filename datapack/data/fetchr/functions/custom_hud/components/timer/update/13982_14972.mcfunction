#> fetchr:custom_hud/components/timer/update/13982_14972
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/11895_14972

execute if score $custom_hud/timer.daytime fetchr.tmp matches ..14314 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0114"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 14315..14644 run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0115"'
execute if score $custom_hud/timer.daytime fetchr.tmp matches 14645.. run data modify storage io.fetchr:custom_hud component.icon set value '"\\u0116"'
