#> bingo:custom_hud/components/player_position/update_xz/shorten_both_iter
#
# Shortens both values until the secondary coordinate made enough space. The
# primary coordinate may need to be shortened further
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both_iter

scoreboard players operation $custom_hud/player_pos.short_x bingo.tmp /= 10 bingo.const
scoreboard players operation $custom_hud/player_pos.short_z bingo.tmp /= 10 bingo.const
scoreboard players remove $custom_hud/width.characters bingo.io 2
scoreboard players add $custom_hud/width.padding bingo.io 12
scoreboard players add $custom_hud/player_pos.removed_x bingo.tmp 1
scoreboard players add $custom_hud/player_pos.removed_z bingo.tmp 1

execute if score $custom_hud/width.characters bingo.io matches 13.. if score $custom_hud/player_pos.removed_x bingo.tmp < $custom_hud/player_pos.max_secondary bingo.tmp run function bingo:custom_hud/components/player_position/update_xz/shorten_both_iter