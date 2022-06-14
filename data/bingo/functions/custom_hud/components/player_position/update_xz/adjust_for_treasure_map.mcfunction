#> bingo:custom_hud/components/player_position/update_xz/adjust_for_treasure_map
#
# This function switches the display to chunk coordinates when hodling a
# treasure map if that setting is active.
#
# @within function bingo:custom_hud/components/player_position/update_xz
# @context entity Player whose hud is currently being updated

scoreboard players operation $custom_hud/player_pos.x bingo.tmp %= 16 bingo.const
scoreboard players operation $custom_hud/player_pos.z bingo.tmp %= 16 bingo.const

data modify storage io.bingo:custom_hud component.textComponent set value '[{"score": {"name": "$custom_hud/player_pos.x", "objective": "bingo.tmp"}, "color": "yellow"}, " ", {"score": {"name": "$custom_hud/player_pos.z", "objective": "bingo.tmp"}}]'