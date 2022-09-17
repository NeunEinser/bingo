#> bingo:custom_hud/components/timer/update/20703_23745
#
# Command Tree
#
# @within function bingo:custom_hud/components/timer/update

execute if score $custom_hud/timer.daytime bingo.tmp matches ..21685 run function bingo:custom_hud/components/timer/update/20703_21685
execute if score $custom_hud/timer.daytime bingo.tmp matches 21686..22695 run function bingo:custom_hud/components/timer/update/21686_22695
execute if score $custom_hud/timer.daytime bingo.tmp matches 22696.. run function bingo:custom_hud/components/timer/update/22696_23745
