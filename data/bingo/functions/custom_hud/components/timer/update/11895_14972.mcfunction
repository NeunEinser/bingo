#> bingo:custom_hud/components/timer/update/11895_14972
#
# Command Tree
#
# @within function bingo:custom_hud/components/timer/update/11895_20702

execute if score $custom_hud/timer.daytime bingo.tmp matches ..12959 run function bingo:custom_hud/components/timer/update/11895_12959
execute if score $custom_hud/timer.daytime bingo.tmp matches 12960..13981 run function bingo:custom_hud/components/timer/update/12960_13981
execute if score $custom_hud/timer.daytime bingo.tmp matches 13982.. run function bingo:custom_hud/components/timer/update/13982_14972
