#> bingo:custom_hud/components/player_position/update_xz/set_compass_text/27_35
#
# Command Tree
#
# @within function bingo:custom_hud/components/player_position/update_xz/set_compass_text/27_53

execute if score $custom_hud/player_pos.rot bingo.tmp matches ..29 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/27_29
execute if score $custom_hud/player_pos.rot bingo.tmp matches 30..32 run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/30_32
execute if score $custom_hud/player_pos.rot bingo.tmp matches 33.. run function bingo:custom_hud/components/player_position/update_xz/set_compass_text/33_35
