#> fetchr:custom_hud/update_actionbar/0_5
#
# Binary tree
#
# @within function fetchr:custom_hud/update_actionbar

execute if score $custom_hud/update.components fetchr.tmp matches ..2 run function fetchr:custom_hud/update_actionbar/0_2
execute if score $custom_hud/update.components fetchr.tmp matches 3.. run function fetchr:custom_hud/update_actionbar/3_5