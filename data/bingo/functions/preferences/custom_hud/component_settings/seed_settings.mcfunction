#> bingo:preferences/custom_hud/component_settings/seed_settings
#
# Shows seed menu page
#
# @within function bingo:preferences/custom_hud/show

tellraw @s ["\n\n\n\n\n=== ", {"translate": "bingo.preferences.custom_hud.component_settings.seed.title", "bold": true, "color": "green"}, " ===\n\n", {"translate": "bingo.preferences.custom_hud.component_settings.seed.description", "color": "gray"}, "\n"]

execute unless data storage bingo:custom_hud currentPlayer.components[{id: "bingo:seed"}].custom.bingo{onlyShowAfterRun: true} run tellraw @s ["[", {"translate": "bingo.preferences.custom_hud.component_settings.seed.only_show_after_run.title", "color": "#00c3ff", "hoverEvent": {"action": "show_text", "contents": {"translate": "bingo.preferences.custom_hud.component_settings.seed.only_show_after_run.description", "color": "gold"}}, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 75"}}, "]"]

execute if data storage bingo:custom_hud currentPlayer.components[{id: "bingo:seed"}].custom.bingo{onlyShowAfterRun: true} run tellraw @s ["[", {"translate": "bingo.preferences.custom_hud.component_settings.seed.always_show.title", "color": "#00c3ff", "hoverEvent": {"action": "show_text", "contents": {"translate": "bingo.preferences.custom_hud.component_settings.seed.always_show.description", "color": "gold"}}, "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 76"}}, "]"]

#>
# @private
#declare score_holder $hud/settings/pos_settings.slot
execute store result score $hud/settings/pos_settings.slot bingo.tmp run data get storage bingo:custom_hud currentPlayer.components[{id: "bingo:seed"}].slot_id
execute if score $hud/settings/pos_settings.slot bingo.tmp matches 0..4 run tellraw @s ["\n[", {"translate": "bingo.preferences.back", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 9"}}, "]"]
execute if score $hud/settings/pos_settings.slot bingo.tmp matches 5..10 run tellraw @s ["\n[", {"translate": "bingo.preferences.back", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.pref set 10"}}, "]"]