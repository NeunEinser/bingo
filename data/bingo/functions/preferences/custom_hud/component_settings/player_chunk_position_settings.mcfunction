#> bingo:preferences/custom_hud/component_settings/player_chunk_position_settings
#
# Shows player chunk position menu page
#
# @within function bingo:preferences/custom_hud/show

tellraw @s ["\n\n\n\n\n=== ", {"translate": "bingo.preferences.custom_hud.component_settings.player_chunk_position.title", "bold": true, "color": "green"}, " ===\n\n", {"translate": "bingo.preferences.custom_hud.component_settings.player_chunk_position.description", "color": "gray"}, "\n\n[", {"translate": "bingo.preferences.custom_hud.component_settings.player_chunk_position.merge_with_pos.title", "color": "#00c3ff", "hoverEvent": {"action": "show_text", "contents": {"translate": "bingo.preferences.custom_hud.component_settings.player_chunk_position.merge_with_pos.description", "color": "gold"}}, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 71"}}, "]"]

#>
# @private
#declare score_holder $hud/settings/chnk_pos_settings.slot
execute store result score $hud/settings/chnk_pos_settings.slot bingo.tmp run data get storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_chunk_position"}].slot_id
execute if score $hud/settings/chnk_pos_settings.slot bingo.tmp matches 0..4 run tellraw @s ["\n[", {"translate": "bingo.preferences.back", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 9"}}, "]"]
execute if score $hud/settings/chnk_pos_settings.slot bingo.tmp matches 5..10 run tellraw @s ["\n[", {"translate": "bingo.preferences.back", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 10"}}, "]"]