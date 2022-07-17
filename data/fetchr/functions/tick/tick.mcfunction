#> fetchr:tick/tick
#
# This function is called every tick
#
# This contains some base logic, but most of the stuff happens in
# fetchr:lobby/tick and fetchr:game/tick
#
# @within tag/function minecraft:tick
# @handles #minecraft:tick

execute in fetchr:lobby run function neun_einser.timer:store_current_time

# Player jooin
execute as @a unless score @s fetchr.player_id matches -2147483648.. run function #fetchr:new_player
execute as @a[scores={fetchr.reconnect=1}] run function #fetchr:player_reconnect

#region Resource pack check
# Detect second (or more) players in a LAN world
execute store result score $is_multiplayer fetchr.state if entity @a
scoreboard players remove $is_multiplayer fetchr.state 1
execute if score $is_multiplayer fetchr.state matches 2.. run scoreboard players set $is_multiplayer fetchr.state 1

# Detect the resource pack not being active server-side (So either we are on a
# server, or resourcepack is missing in single player for some reason)
#
# Uses name-check from technical translation:
# - "fetchr.technical.detect_multiplayer" -> "DoNotTranslateThis<X>"
#    <X> being version-check iteration (3+) (also used below)
execute if score $is_multiplayer fetchr.state matches 0 unless entity @e[name="DoNotTranslateThis{NEUN_SCRIPT:rp_version}", limit=1] run scoreboard players set $is_multiplayer fetchr.state 1

# Auto-validate if Singleplayer
execute if score $is_multiplayer fetchr.state matches 0 run tellraw @a[tag=fetchr.resourcepack_check] "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
execute if score $is_multiplayer fetchr.state matches 0 run scoreboard players set @a[tag=fetchr.resourcepack_check] fetchr.resource_pack_check 91

# Send Resource pack check chat message
#
# Uses technical translation strings with unused argument indexes - below
# (1, 2 are string argument indexes used in IF: [translated ? <2> : <1>])
#
# For easier understanding: <val/string> - value/encoded-string* as "%<val>$s"
# e.g. 'fetchr' encoded* as 1162888552 => "%1162888552$s"; 1 => "%1$s"
# - "<fetchr><1>" - fetchr resource pack
# - "<fetchr><X><1>" - RP-version equal check: <X>[version iteration, 3+]
# - "<fetchr><3><X><1>" - RP-version equal or above check: <X>[as above]
# All above translate to "<2>"="%2$s" (2nd argument), in [en_us] lang-file
# 
# *NeunEinser's encoder: https://github.com/NeunEinser/translation-placeholder-namespace

#NEUN_SCRIPT uncomment
#tellraw @a[scores={fetchr.resource_pack_check=1}] ["\n\n\n\n\n", {"translate": "%1162888552$s%1$s", "with": [["", {"text": "The resourcepack is currently not enabled.", "color": "red"}, "\nIf there is a server resource pack in place, enable it and wait until the Mojang loading screen is done. Then click “re-check” down below.\n\nOtherwise, please download the Resourcepack ", {"text": "here", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://github.com/NeunEinser/bingo/releases/download/{NEUN_SCRIPT:version}/Fetchr-{NEUN_SCRIPT:version}-resourcepack.zip"}}, " and enable it.\n\n[", {"text": "Re-check", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.resource_pack_check"}}, "]"], ["", {"translate": "%1162888552$s%{NEUN_SCRIPT:rp_version}$s%1$s", "with": [["", {"translate": "%1162888552$s%3$s%3$s%1$s", "with": [["", {"text": "Incorrect resource pack version enabled.", "color": "red"}, "\nYou are using an incompatible version of the Fetchr resource pack.\n\nPlease download the correct version ", {"text": "here", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://github.com/NeunEinser/bingo/releases/download/{NEUN_SCRIPT:version}/Fetchr-{NEUN_SCRIPT:version}-resourcepack.zip"}}, ", enable it and click “re-check” down below.\n\nIf the resource pack was applied automatically through a server resource pack, please inform the server admin to update the server resource pack.\n\n[", {"text": "Re-check", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.resource_pack_check"}}, "]"], ["", {"translate": "fetchr.resourcepack_check.wrong_version.title", "color": "red"}, "\n", {"translate": "fetchr.resourcepack_check.wrong_version.description", "with": [{"translate": "fetchr.resourcepack_check.wrong_version.link", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://github.com/NeunEinser/bingo/releases/download/{NEUN_SCRIPT:version}/Fetchr-{NEUN_SCRIPT:version}-resourcepack.zip"}}]}, "\n\n", {"translate": "fetchr.resourcepack_check.wrong_version.server"}, "\n\n[", {"translate": "fetchr.resourcepack_check.wrong_version.recheck", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.resource_pack_check"}}, "]"]]}], ["", {"translate": "fetchr.resourcepack_check.go_to_lobby.part1", "color": "green"}, "\n", {"translate": "fetchr.resourcepack_check.go_to_lobby.part2", "with": [{"translate": "fetchr.resourcepack_check.go_to_lobby.click", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.resource_pack_check set 91"}}]}]]}]]}]

#NEUN_SCRIPT remove
tellraw @a[scores={fetchr.resource_pack_check=1}] ["\n\n\n\n\n", {"translate": "%1162888552$s%1$s", "with": [["",{"text": "The resourcepack is currently not enabled.", "color": "red"}, "\nThis is not a release version, thus no resource pack download can be provided. You can get the resource pack from master as well, just like you did with the data pack. You will need to download and apply the NegativeSpaceFont linked in readme manually as well, though.\n\nIf you want to play the release version, please follow the instructions on ", {"text": "this page", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://github.com/NeunEinser/bingo/releases"}}, "."], ["", {"translate": "fetchr.resourcepack_check.go_to_lobby.part1", "color": "green"}, "\n", {"translate": "fetchr.resourcepack_check.go_to_lobby.part2", "with": [{"translate": "fetchr.resourcepack_check.go_to_lobby.click", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger fetchr.resource_pack_check set 91"}}]}]]}]

# Validate checked players, reenable trigger
scoreboard players enable @a[tag=fetchr.resourcepack_check] fetchr.resource_pack_check
scoreboard players set @a[scores={fetchr.resource_pack_check=1}] fetchr.resource_pack_check 0
tag @a[scores={fetchr.resource_pack_check=91}] remove fetchr.resourcepack_check
execute as @a[scores={fetchr.resource_pack_check=91}] run function fetchr:util/go_to_lobby

# Place the sign in resource pack check chamber
setblock 1 2 1 minecraft:air
#NEUN_SCRIPT uncomment
#setblock 1 2 1 minecraft:warped_wall_sign{Text1: '{"translate": "%1162888552$s%{NEUN_SCRIPT:rp_version}$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1162888552$s%3$s%3$s%1$s", "bold":true, "with": ["", {"translate": "fetchr.resourcepack_check.wrong_version.sign.line1"}]}, {"translate": "fetchr.resourcepack_check.sign.line1"}], "clickEvent": {"action": "run_command", "value": "/trigger fetchr.resource_pack_check"}}',Text2: '{"translate": "%1162888552$s%{NEUN_SCRIPT:rp_version}$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1162888552$s%3$s%3$s%1$s", "bold":true, "with": ["Download", {"translate": "fetchr.resourcepack_check.wrong_version.sign.line2"}]}, {"translate": "fetchr.resourcepack_check.sign.line2"}]}',Text3: '{"translate": "%1162888552$s%{NEUN_SCRIPT:rp_version}$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1162888552$s%3$s%3$s%1$s", "bold":true, "with": ["Resourcepack", {"translate": "fetchr.resourcepack_check.wrong_version.sign.line3"}]}, {"translate": "fetchr.resourcepack_check.sign.line3"}]}',Text4: '{"translate": "%1162888552$s%{NEUN_SCRIPT:rp_version}$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1162888552$s%3$s%3$s%1$s", "bold":true, "with": ["", {"translate": "fetchr.resourcepack_check.wrong_version.sign.line4"}]}, {"translate": "fetchr.resourcepack_check.sign.line4"}]}'}

#NEUN_SCRIPT remove
setblock 1 2 1 minecraft:warped_wall_sign{Text1: '{"translate": "%1162888552$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1162888552$s%3$s%3$s%1$s", "bold":true, "with": ["", {"translate": "fetchr.resourcepack_check.wrong_version.sign.line1"}]}, {"translate": "fetchr.resourcepack_check.sign.line1"}], "clickEvent": {"action": "run_command", "value": "/trigger fetchr.resource_pack_check"}}',Text2: '{"translate": "%1162888552$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1162888552$s%3$s%3$s%1$s", "bold":true, "with": ["Download", {"translate": "fetchr.resourcepack_check.wrong_version.sign.line2"}]}, {"translate": "fetchr.resourcepack_check.sign.line2"}]}',Text3: '{"translate": "%1162888552$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1162888552$s%3$s%3$s%1$s", "bold":true, "with": ["Resourcepack", {"translate": "fetchr.resourcepack_check.wrong_version.sign.line3"}]}, {"translate": "fetchr.resourcepack_check.sign.line3"}]}',Text4: '{"translate": "%1162888552$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1162888552$s%3$s%3$s%1$s", "bold":true, "with": ["", {"translate": "fetchr.resourcepack_check.wrong_version.sign.line4"}]}, {"translate": "fetchr.resourcepack_check.sign.line4"}]}'}
#endregion

# custom hud
data modify storage tmp.fetchr:custom_hud handled set value []
execute as @a[predicate=!fetchr:is_in_overworld] run function fetchr:custom_hud/tick
data modify storage fetchr:custom_hud players append from storage tmp.fetchr:custom_hud handled[]
scoreboard players reset $update_card fetchr.state

# Loop depending on game state
execute if entity @a[predicate=fetchr:is_in_lobby, limit=1] in fetchr:lobby run function fetchr:lobby/tick
execute if score $game_state fetchr.state matches 2.. run function fetchr:game/tick

scoreboard players operation $last_tick fetchr.state = $raw 91.timer.time

# Command blocks enabled check
execute if score $commandblocks_enabled fetchr.state matches 0 run effect give @a minecraft:blindness 2 255 true
execute if score $commandblocks_enabled fetchr.state matches 0 run effect give @a minecraft:slowness 2 255 true
execute if score $commandblocks_enabled fetchr.state matches 0 run effect give @a minecraft:jump_boost 2 128 true

#NEUN_SCRIPT uncomment
#execute if score $commandblocks_enabled fetchr.state matches 0 run tellraw @a {"translate":"%1162888552$s%1$s", "color": "red", "with":[["Command blocks are disabled on this server. Please make sure the server.properties file does have all mentioned values set as described ", {"text": "here", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://gist.githubusercontent.com/NeunEinser/dac27cc76dbc83bdd1ea22a99cff3967/raw/{NEUN_SCRIPT:version}.properties"}}, "."], {"translate": "fetchr.error.command_blocks_disabled", "with": [{"translate": "fetchr.error.command_blocks_disabled.link", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://gist.githubusercontent.com/NeunEinser/dac27cc76dbc83bdd1ea22a99cff3967/raw/{NEUN_SCRIPT:version}.properties"}}]}]}

#NEUN_SCRIPT remove
execute if score $commandblocks_enabled fetchr.state matches 0 run tellraw @a {"translate":"%1162888552$s%1$s", "color": "red", "with":[["Command blocks are disabled on this server. Please make sure the server.properties file does have all mentioned values set as described ", {"text": "here", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://gist.githubusercontent.com/NeunEinser/dac27cc76dbc83bdd1ea22a99cff3967"}}, "."], {"translate": "fetchr.error.command_blocks_disabled", "with": [{"translate": "fetchr.error.command_blocks_disabled.link", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://gist.githubusercontent.com/NeunEinser/dac27cc76dbc83bdd1ea22a99cff3967"}}]}]}