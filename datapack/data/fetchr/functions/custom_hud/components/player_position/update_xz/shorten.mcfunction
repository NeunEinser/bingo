#> fetchr:custom_hud/components/player_position/update_xz/shorten
#
# In case the full coordinates wouldn't fit, this shortens them and uses a k
# suffix for 1000 and an M suffix for one million.
#
# If possible, decimal places will be used to show more information.
#
# This function tries its best to show as many digits as possible and prefrers
# more significant digits.
#
# In case only one of the coordinates needs to be shortened, the one with the
# higher absolute value will be picked. 
#
# @within function fetchr:custom_hud/components/player_position/update_xz
# @context entity Player whose hud is currently being updated

#>
# @within function fetchr:custom_hud/components/player_position/update_xz/*
#declare score_holder $custom_hud/player_pos.abs_x
scoreboard players operation $custom_hud/player_pos.abs_x fetchr.tmp = $custom_hud/player_pos.x fetchr.tmp
execute if score $custom_hud/player_pos.x fetchr.tmp matches ..-1 run scoreboard players operation $custom_hud/player_pos.abs_x fetchr.tmp *= -1 fetchr.const
#>
# @within function fetchr:custom_hud/components/player_position/update_xz/*
#declare score_holder $custom_hud/player_pos.abs_z
scoreboard players operation $custom_hud/player_pos.abs_z fetchr.tmp = $custom_hud/player_pos.z fetchr.tmp
execute if score $custom_hud/player_pos.z fetchr.tmp matches ..-1 run scoreboard players operation $custom_hud/player_pos.abs_z fetchr.tmp *= -1 fetchr.const

#>
# 1 if both coordinates should be shortened,
# 0 if only the one with the higher absolute value should be shortened
#
# @private
#declare score_holder $custom_hud/player_pos.shorten_both
scoreboard players set $custom_hud/player_pos.shorten_both fetchr.tmp 0
execute if score $custom_hud/width.padding fetchr.io matches ..-6 run scoreboard players set $custom_hud/player_pos.shorten_both fetchr.tmp 1
execute if score $custom_hud/width.padding fetchr.io matches -5 if score $custom_hud/player_pos.abs_x fetchr.tmp matches 1000000.. run scoreboard players set $custom_hud/player_pos.shorten_both fetchr.tmp 1
execute if score $custom_hud/width.padding fetchr.io matches -5 if score $custom_hud/player_pos.abs_z fetchr.tmp matches 1000000.. run scoreboard players set $custom_hud/player_pos.shorten_both fetchr.tmp 1

execute if score $custom_hud/width.padding fetchr.io matches -11 if score $custom_hud/player_pos.abs_x fetchr.tmp matches ..999999 if score $custom_hud/player_pos.abs_z fetchr.tmp matches ..999999 run scoreboard players set $custom_hud/player_pos.shorten_both fetchr.tmp 0
execute if score $custom_hud/width.padding fetchr.io matches -10 if score $custom_hud/player_pos.abs_x fetchr.tmp matches 1000000.. run scoreboard players set $custom_hud/player_pos.shorten_both fetchr.tmp 0
execute if score $custom_hud/width.padding fetchr.io matches -10 if score $custom_hud/player_pos.abs_z fetchr.tmp matches 1000000.. run scoreboard players set $custom_hud/player_pos.shorten_both fetchr.tmp 0
execute if score $custom_hud/width.padding fetchr.io matches -9 if score $custom_hud/player_pos.abs_x fetchr.tmp matches 1000000.. if score $custom_hud/player_pos.abs_z fetchr.tmp matches 1000000.. run scoreboard players set $custom_hud/player_pos.shorten_both fetchr.tmp 0

execute if score $custom_hud/player_pos.abs_x fetchr.tmp matches ..999 run scoreboard players set $custom_hud/player_pos.shorten_both fetchr.tmp 0
execute if score $custom_hud/player_pos.abs_z fetchr.tmp matches ..999 run scoreboard players set $custom_hud/player_pos.shorten_both fetchr.tmp 0

execute if score $custom_hud/player_pos.shorten_both fetchr.tmp matches 0 if score $custom_hud/player_pos.abs_x fetchr.tmp >= $custom_hud/player_pos.abs_z fetchr.tmp run function fetchr:custom_hud/components/player_position/update_xz/shorten_x
execute if score $custom_hud/player_pos.shorten_both fetchr.tmp matches 0 if score $custom_hud/player_pos.abs_z fetchr.tmp > $custom_hud/player_pos.abs_x fetchr.tmp run function fetchr:custom_hud/components/player_position/update_xz/shorten_z
execute if score $custom_hud/player_pos.shorten_both fetchr.tmp matches 1 run function fetchr:custom_hud/components/player_position/update_xz/shorten_both