#> bingo:custom_hud/components/player_position/update_xz/shorten_x_iter
#
# Shortens the x coordinate until enough space was made
#
# @within
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_both
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_x
# 	function bingo:custom_hud/components/player_position/update_xz/shorten_x_iter

scoreboard players operation $custom_hud/player_pos.short_x bingo.tmp /= 10 bingo.const
scoreboard players remove $custom_hud/width.characters bingo.io 1
scoreboard players add $custom_hud/width.padding bingo.io 6
scoreboard players add $custom_hud/player_pos.removed_x bingo.tmp 1

execute if score $custom_hud/width.characters bingo.io matches 12.. run function bingo:custom_hud/components/player_position/update_xz/shorten_x_iter