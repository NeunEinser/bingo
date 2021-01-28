scoreboard players set $stash_prev bingo.tmp 1
scoreboard players set $first bingo.tmp 5
function bingo:lobby/player_settings/find_config

function bingo:lobby/player_settings/save/copy_data_to_config
tellraw @s {"translate": "bingo.lobby.settings.player.save.overwrite.success", "with": [{"storage": "bingo:player", "nbt": "configurations[-1].name", "interpret": true}]}

data modify storage bingo:player configurations append from storage bingo:tmp playerConfigs[]