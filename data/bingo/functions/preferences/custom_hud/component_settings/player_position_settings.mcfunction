#> bingo:preferences/custom_hud/component_settings/player_position_settings
#
# Shows player position menu page
#
# @within function bingo:preferences/custom_hud/show

tellraw @s ["\n\n\n\n\n=== ", {"translate": "bingo.preferences.custom_hud.component_settings.player_position.title", "bold": true, "color": "green"}, " ===\n\n", {"translate": "bingo.preferences.custom_hud.component_settings.player_position.description", "color": "gray"}, "\n"]

execute if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}].custom.bingo{chunkCoordinatesOnTreasureMap: true} run tellraw @s ["[", {"translate": "bingo.preferences.custom_hud.component_settings.player_position.disable_chunk_coordinates.title", "color": "#00c3ff", "hoverEvent": {"action": "show_text", "contents": {"translate": "bingo.preferences.custom_hud.component_settings.player_position.disable_chunk_coordinates.description", "color": "gold"}}, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 73"}}, "]"]

execute unless data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}].custom.bingo{chunkCoordinatesOnTreasureMap: true} run tellraw @s ["[", {"translate": "bingo.preferences.custom_hud.component_settings.player_position.enable_chunk_coordinates.title", "color": "#00c3ff", "hoverEvent": {"action": "show_text", "contents": {"translate": "bingo.preferences.custom_hud.component_settings.player_position.enable_chunk_coordinates.description", "color": "gold"}}, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 71"}}, "]"]

execute unless data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}].custom.bingo{iconType: 'compass'} run tellraw @s ["[", {"translate": "bingo.preferences.custom_hud.component_settings.player_position.use_compass_icon.title", "color": "#00c3ff", "hoverEvent": {"action": "show_text", "contents": {"translate": "bingo.preferences.custom_hud.component_settings.player_position.use_compass_icon.description", "color": "gold"}}, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 77"}}, "]"]

execute if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}].custom.bingo{iconType: 'compass'} run tellraw @s ["[", {"translate": "bingo.preferences.custom_hud.component_settings.player_position.use_text_icon.title", "color": "#00c3ff", "hoverEvent": {"action": "show_text", "contents": {"translate": "bingo.preferences.custom_hud.component_settings.player_position.use_text_icon.description", "color": "gold"}}, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 78"}}, "]"]

#>
# @private
#declare score_holder $hud/settings/pos_settings.slot
execute store result score $hud/settings/pos_settings.slot bingo.tmp run data get storage bingo:custom_hud currentPlayer.components[{id: "bingo:player_position"}].slot_id
execute if score $hud/settings/pos_settings.slot bingo.tmp matches 0..4 run tellraw @s ["\n[", {"translate": "bingo.preferences.back", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 9"}}, "]"]
execute if score $hud/settings/pos_settings.slot bingo.tmp matches 5..10 run tellraw @s ["\n[", {"translate": "bingo.preferences.back", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 10"}}, "]"]