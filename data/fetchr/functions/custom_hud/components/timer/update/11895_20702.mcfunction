#> fetchr:custom_hud/components/timer/update/11895_20702
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update

execute if score $custom_hud/timer.daytime fetchr.tmp matches ..14972 run function fetchr:custom_hud/components/timer/update/11895_14972
execute if score $custom_hud/timer.daytime fetchr.tmp matches 14973..17842 run function fetchr:custom_hud/components/timer/update/14973_17842
execute if score $custom_hud/timer.daytime fetchr.tmp matches 17843.. run function fetchr:custom_hud/components/timer/update/17843_20702
