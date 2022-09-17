#> bingo:custom_hud/components/timer/update/8269_11894
#
# Command Tree
#
# @within function bingo:custom_hud/components/timer/update/106_11894

execute if score $custom_hud/timer.daytime bingo.tmp matches ..9574 run function bingo:custom_hud/components/timer/update/8269_9574
execute if score $custom_hud/timer.daytime bingo.tmp matches 9575..10772 run function bingo:custom_hud/components/timer/update/9575_10772
execute if score $custom_hud/timer.daytime bingo.tmp matches 10773.. run function bingo:custom_hud/components/timer/update/10773_11894
