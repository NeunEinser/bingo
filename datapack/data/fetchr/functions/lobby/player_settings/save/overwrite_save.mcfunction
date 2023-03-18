scoreboard players set $stash_prev fetchr.tmp 1
scoreboard players set $first fetchr.tmp 5
function fetchr:lobby/player_settings/find_config

function fetchr:lobby/player_settings/save/copy_data_to_config
tellraw @s {"translate": "fetchr.lobby.settings.player.save.overwrite.success", "with": [{"storage": "fetchr:player", "nbt": "configurations[-1].name", "interpret": true}]}

data modify storage fetchr:player configurations append from storage fetchr:tmp playerConfigs[]