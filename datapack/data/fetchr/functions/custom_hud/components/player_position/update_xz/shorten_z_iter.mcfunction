#> fetchr:custom_hud/components/player_position/update_xz/shorten_z_iter
#
# Shortens the z coordinate until enough space was made
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_z
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_z_iter

scoreboard players operation $custom_hud/player_pos.short_z fetchr.tmp /= 10 fetchr.const
scoreboard players add $custom_hud/width.padding fetchr.io 6
scoreboard players add $custom_hud/player_pos.removed_z fetchr.tmp 1

execute if score $custom_hud/width.padding fetchr.io matches ..-1 run function fetchr:custom_hud/components/player_position/update_xz/shorten_z_iter