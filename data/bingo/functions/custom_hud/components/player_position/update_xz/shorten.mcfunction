#> bingo:custom_hud/components/player_position/update_xz/shorten
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
# @within function bingo:custom_hud/components/player_position/update_xz
# @context entity Player whose hud is currently being updated

#>
# @within function bingo:custom_hud/components/player_position/update_xz/*
#declare score_holder $custom_hud/player_pos.abs_x
scoreboard players operation $custom_hud/player_pos.abs_x bingo.tmp = $custom_hud/player_pos.x bingo.tmp
execute if score $custom_hud/player_pos.x bingo.tmp matches ..-1 run scoreboard players operation $custom_hud/player_pos.abs_x bingo.tmp *= -1 bingo.const
#>
# @within function bingo:custom_hud/components/player_position/update_xz/*
#declare score_holder $custom_hud/player_pos.abs_z
scoreboard players operation $custom_hud/player_pos.abs_z bingo.tmp = $custom_hud/player_pos.z bingo.tmp
execute if score $custom_hud/player_pos.z bingo.tmp matches ..-1 run scoreboard players operation $custom_hud/player_pos.abs_z bingo.tmp *= -1 bingo.const

#>
# 1 if both coordinates should be shortened,
# 0 if only the one with the higher absolute value should be shortened
#
# Logic see comments below, basically it's overengineered as heck.
#
# @private
#declare score_holder $custom_hud/player_pos.shorten_both
scoreboard players set $custom_hud/player_pos.shorten_both bingo.tmp 0

# These checks are here for -100000 (which is 7 characters because of the `-`
# sign)
# In this case, 2 digits need to be pruned, so the tense and ones of both values
# will be chosen first, and possibly one hundrets digit as well, if both values
# have a length of 7.
execute if score $custom_hud/player_pos.x_len bingo.tmp matches 7.. if score $custom_hud/player_pos.z_len bingo.tmp matches 6.. run scoreboard players set $custom_hud/player_pos.shorten_both bingo.tmp 1
execute if score $custom_hud/player_pos.z_len bingo.tmp matches 7.. if score $custom_hud/player_pos.x_len bingo.tmp matches 6.. run scoreboard players set $custom_hud/player_pos.shorten_both bingo.tmp 1

# In order to show as siginificant digits as possible, if one of the values is
# >= 1M and at least 2 digits need to be pruned, the other coordinate will be
# shortened in order to allow more siginificant digits of the 1M to be
# displayed.
execute if score $custom_hud/player_pos.abs_x bingo.tmp matches 1000000.. if score $custom_hud/width.characters bingo.io matches 13.. if score $custom_hud/player_pos.abs_z bingo.tmp matches 1000.. run scoreboard players set $custom_hud/player_pos.shorten_both bingo.tmp 1
execute if score $custom_hud/player_pos.abs_z bingo.tmp matches 1000000.. if score $custom_hud/width.characters bingo.io matches 13.. if score $custom_hud/player_pos.abs_x bingo.tmp matches 1000.. run scoreboard players set $custom_hud/player_pos.shorten_both bingo.tmp 1

execute if score $custom_hud/player_pos.shorten_both bingo.tmp matches 0 if score $custom_hud/player_pos.abs_x bingo.tmp >= $custom_hud/player_pos.abs_z bingo.tmp run function bingo:custom_hud/components/player_position/update_xz/shorten_x
execute if score $custom_hud/player_pos.shorten_both bingo.tmp matches 0 if score $custom_hud/player_pos.abs_z bingo.tmp > $custom_hud/player_pos.abs_x bingo.tmp run function bingo:custom_hud/components/player_position/update_xz/shorten_z
execute if score $custom_hud/player_pos.shorten_both bingo.tmp matches 1 run function bingo:custom_hud/components/player_position/update_xz/shorten_both