#> fetchr:custom_hud/components/timer/update/14973_17842
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/11895_20702

execute if score $custom_hud/timer.daytime fetchr.tmp matches ..15941 run function fetchr:custom_hud/components/timer/update/14973_15941
execute if score $custom_hud/timer.daytime fetchr.tmp matches 15942..16895 run function fetchr:custom_hud/components/timer/update/15942_16895
execute if score $custom_hud/timer.daytime fetchr.tmp matches 16896.. run function fetchr:custom_hud/components/timer/update/16896_17842
