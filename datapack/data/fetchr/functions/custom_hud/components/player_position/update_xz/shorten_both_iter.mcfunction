#> fetchr:custom_hud/components/player_position/update_xz/shorten_both_iter
#
# Shortens both values until the secondary coordinate made enough space. The
# primary coordinate may need to be shortened further
#
# @within
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both
# 	function fetchr:custom_hud/components/player_position/update_xz/shorten_both_iter

scoreboard players operation $custom_hud/player_pos.short_x fetchr.tmp /= 10 fetchr.const
scoreboard players operation $custom_hud/player_pos.short_z fetchr.tmp /= 10 fetchr.const
scoreboard players remove $custom_hud/width.characters fetchr.io 2
scoreboard players add $custom_hud/width.padding fetchr.io 12
scoreboard players add $custom_hud/player_pos.removed_x fetchr.tmp 1
scoreboard players add $custom_hud/player_pos.removed_z fetchr.tmp 1

execute if score $custom_hud/width.characters fetchr.io matches 13.. if score $custom_hud/player_pos.removed_x fetchr.tmp < $custom_hud/player_pos.max_secondary fetchr.tmp run function fetchr:custom_hud/components/player_position/update_xz/shorten_both_iter