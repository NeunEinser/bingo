#> fetchr:custom_hud/components/timer/update/3732_8268
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/106_11894

execute if score $custom_hud/timer.daytime fetchr.tmp matches ..5189 run function fetchr:custom_hud/components/timer/update/3732_5189
execute if score $custom_hud/timer.daytime fetchr.tmp matches 5190..6810 run function fetchr:custom_hud/components/timer/update/5190_6810
execute if score $custom_hud/timer.daytime fetchr.tmp matches 6811.. run function fetchr:custom_hud/components/timer/update/6811_8268
