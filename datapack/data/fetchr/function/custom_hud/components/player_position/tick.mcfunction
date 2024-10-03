#> fetchr:custom_hud/components/player_position/tick
#
# @within tag/function fetchr:tick_hud_components
# @handles #fetchr:tick_hud_components

execute if score @s fetchr.update_hud matches 1 run function fetchr:custom_hud/components/player_position/update_all
execute unless score @s fetchr.update_hud matches 1 if entity @s[tag=fetchr.position_changed] run function fetchr:custom_hud/components/player_position/update_specific