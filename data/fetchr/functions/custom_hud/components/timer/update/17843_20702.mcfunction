#> fetchr:custom_hud/components/timer/update/17843_20702
#
# Command Tree
#
# @within function fetchr:custom_hud/components/timer/update/11895_20702

execute if score $custom_hud/timer.daytime fetchr.tmp matches ..18788 run function fetchr:custom_hud/components/timer/update/17843_18788
execute if score $custom_hud/timer.daytime fetchr.tmp matches 18789..19739 run function fetchr:custom_hud/components/timer/update/18789_19739
execute if score $custom_hud/timer.daytime fetchr.tmp matches 19740.. run function fetchr:custom_hud/components/timer/update/19740_20702
