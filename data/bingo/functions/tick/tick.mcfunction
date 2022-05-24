#> bingo:tick/tick
#
# This function is called every tick
#
# This contains some base logic, but most of the stuff happens in
# bingo:lobby/tick and bingo:game/tick
#
# @within tag/function minecraft:tick
# @handles #minecraft:tick

execute in bingo:lobby run function neun_einser.timer:store_current_time

#region Resource pack check
# Detect second (or more) players in a LAN world
execute store result score $is_multiplayer bingo.state if entity @a
scoreboard players remove $is_multiplayer bingo.state 1
execute if score $is_multiplayer bingo.state matches 2.. run scoreboard players set $is_multiplayer bingo.state 1

# Detect the resource pack not being active server-side (So either we are on a
# server, or resourcepack is missing in single player for some reason)
#
# Uses name-check from technical translation:
# - "bingo.technical.detect_multiplayer" -> "DoNotTranslateThis<X>"
#    <X> being version-check iteration (3+) (also used below)
execute if score $is_multiplayer bingo.state matches 0 unless entity @e[name=DoNotTranslateThis3, limit=1] run scoreboard players set $is_multiplayer bingo.state 1

# Auto-validate if Singleplayer
execute if score $is_multiplayer bingo.state matches 0 run tellraw @a[tag=bingo.resourcepack_check] "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
execute if score $is_multiplayer bingo.state matches 0 run scoreboard players set @a[tag=bingo.resourcepack_check] bingo.resources 91

# Send Resource pack check chat message
#
# Uses technical translation strings with unused argument indexes - below
# (1, 2 are string argument indexes used in IF: [translated ? <2> : <1>])
#
# For easier understanding: <val/string> - value/encoded-string* as "%<val>$s"
# e.g. 'bingo' encoded* as 1074992263 => "%1074992263$s"; 1 => "%1$s"
# - "<bingo><1>" - bingo resource pack
# - "<bingo><X><1>" - RP-version equal check: <X>[version iteration, 3+]
# - "<bingo><3><X><1>" - RP-version equal or above check: <X>[as above]
# All above translate to "<2>"="%2$s" (2nd argument), in [en_us] lang-file
# 
# *NeunEinser's encoder: https://github.com/NeunEinser/translation-placeholder-namespace

#NEUN_SCRIPT uncomment
#tellraw @a[scores={bingo.resources=1}] ["\n\n\n\n\n", {"translate": "%1074992263$s%1$s", "with": [["", {"text": "The resourcepack is currently not enabled.", "color": "red"}, "\nIf there is a server resource pack in place, enable it and wait until the Mojang loading screen is done. Then click “re-check” down below.\n\nOtherwise, please download the Resourcepack ", {"text": "here", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://github.com/NeunEinser/bingo/releases/download/{NEUN_SCRIPT:version}/Bingo.{NEUN_SCRIPT:version}.Resourcepack.zip"}}, " and enable it.\n\n[", {"text": "Re-check", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.resources"}}, "]"], ["", {"translate": "%1074992263$s%{NEUN_SCRIPT:rp_version}$s%1$s", "with": [["", {"translate": "%1074992263$s%3$s%3$s%1$s", "with": [["", {"text": "Incorrect resource pack version enabled.", "color": "red"}, "\nYou are using an incompatible version of the Bingo resource pack.\n\nPlease download the correct version ", {"text": "here", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://github.com/NeunEinser/bingo/releases/download/{NEUN_SCRIPT:version}/Bingo.{NEUN_SCRIPT:version}.Resourcepack.zip"}}, ", enable it and click “re-check” down below.\n\nIf the resource pack was applied automatically through a server resource pack, please inform the server admin to update the server resource pack.\n\n[", {"text": "Re-check", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.resources"}}, "]"], ["", {"translate": "bingo.resourcepack_check.wrong_version.title", "color": "red"}, {"translate": "bingo.resourcepack_check.wrong_version.description", "with": [{"translate": "bingo.resourcepack_check.wrong_version.link", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://github.com/NeunEinser/bingo/releases/download/{NEUN_SCRIPT:version}/Bingo.{NEUN_SCRIPT:version}.Resourcepack.zip"}}]}, "\n\n", {"translate": "bingo.resourcepack_check.wrong_version.server"}, "\n\n[", {"translate": "bingo.resourcepack_check.wrong_version.recheck", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.resources"}}, "]"]]}], ["", {"translate": "bingo.resourcepack_check.go_to_lobby.part1", "color": "green"}, "\n", {"translate": "bingo.resourcepack_check.go_to_lobby.part2", "with": [{"translate": "bingo.resourcepack_check.go_to_lobby.click", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.resources set 91"}}]}]]}]]}]

#NEUN_SCRIPT remove
tellraw @a[scores={bingo.resources=1}] ["\n\n\n\n\n", {"translate": "%1074992263$s%1$s", "with": [["",{"text": "The resourcepack is currently not enabled.", "color": "red"}, "\nThis is not a release version, thus no resource pack download can be provided. You can get the resource pack from master as well, just like you did with the data pack. You will need to download and apply the NegativeSpaceFont linked in readme manually as well, though.\n\nIf you want to play the release version, please follow the instructions on ", {"text": "this page", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://github.com/NeunEinser/bingo/releases/tag/{NEUN_SCRIPT:version}"}}, "."], ["", {"translate": "bingo.resourcepack_check.go_to_lobby.part1", "color": "green"}, "\n", {"translate": "bingo.resourcepack_check.go_to_lobby.part2", "with": [{"translate": "bingo.resourcepack_check.go_to_lobby.click", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.resources set 91"}}]}]]}]

# Validate checked players, reenable trigger
scoreboard players enable @a[tag=bingo.resourcepack_check] bingo.resources
scoreboard players set @a[scores={bingo.resources=1}] bingo.resources 0
tag @a[scores={bingo.resources=91}] remove bingo.resourcepack_check
execute as @a[scores={bingo.resources=91}] run function bingo:util/go_to_lobby

# Place the sign in resource pack check chamber
setblock 1 2 1 minecraft:air
setblock 1 2 1 minecraft:warped_wall_sign{Text1: '{"translate": "%1074992263$s%{NEUN_SCRIPT:rp_version}$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1074992263$s%3$s%3$s%1$s", "bold":true, "with": ["", {"translate": "bingo.resourcepack_check.wrong_version.sign.line1"}]}, {"translate": "bingo.resourcepack_check.sign.line1"}], "clickEvent": {"action": "run_command", "value": "/trigger bingo.resources"}}',Text2: '{"translate": "%1074992263$s%{NEUN_SCRIPT:rp_version}$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1074992263$s%3$s%3$s%1$s", "bold":true, "with": ["Download", {"translate": "bingo.resourcepack_check.wrong_version.sign.line2"}]}, {"translate": "bingo.resourcepack_check.sign.line2"}]}',Text3: '{"translate": "%1074992263$s%{NEUN_SCRIPT:rp_version}$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1074992263$s%3$s%3$s%1$s", "bold":true, "with": ["Resourcepack", {"translate": "bingo.resourcepack_check.wrong_version.sign.line3"}]}, {"translate": "bingo.resourcepack_check.sign.line3"}]}',Text4: '{"translate": "%1074992263$s%{NEUN_SCRIPT:rp_version}$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1074992263$s%3$s%3$s%1$s", "bold":true, "with": ["", {"translate": "bingo.resourcepack_check.wrong_version.sign.line4"}]}, {"translate": "bingo.resourcepack_check.sign.line4"}]}'}
#endregion

# Assign each player a unique ID
execute as @a[scores={bingo.reconnect=1}] run function #bingo:player_reconnect
execute as @a unless score @s bingo.id matches -2147483648.. run function #bingo:new_player

# custom hud
data modify storage tmp.bingo:custom_hud handled set value []
execute as @a[predicate=!bingo:is_in_overworld] run function bingo:custom_hud/tick
data modify storage bingo:custom_hud players append from storage tmp.bingo:custom_hud handled[]
scoreboard players reset $update_card bingo.state

# Loop depending on game state
execute if entity @a[predicate=bingo:is_in_lobby, limit=1] in bingo:lobby run function bingo:lobby/tick
execute if score $game_state bingo.state matches 2.. run function bingo:game/tick

scoreboard players operation $last_tick bingo.state = $raw 91.timer.time

# Command blocks enabled check
execute if score $commandblocks_enabled bingo.state matches 0 run effect give @a minecraft:blindness 2 255 true
execute if score $commandblocks_enabled bingo.state matches 0 run effect give @a minecraft:slowness 2 255 true
execute if score $commandblocks_enabled bingo.state matches 0 run effect give @a minecraft:jump_boost 2 128 true

execute if score $commandblocks_enabled bingo.state matches 0 run tellraw @a {"translate":"%1074992263$s%1$s", "color": "red", "with":[["Command blocks are disabled on this server. Please make sure the server.properties file does have all mentioned values set as described ", {"text": "here", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://gist.githubusercontent.com/NeunEinser/dac27cc76dbc83bdd1ea22a99cff3967/raw/adab90d31d915e75a4d9657b4e2dc247719b5793/{NEUN_SCRIPT:version}.properties"}}, "."], {"translate": "bingo.error.command_blocks_disabled", "with": [{"translate": "bingo.error.command_blocks_disabled.link", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://gist.githubusercontent.com/NeunEinser/dac27cc76dbc83bdd1ea22a99cff3967/raw/adab90d31d915e75a4d9657b4e2dc247719b5793/{NEUN_SCRIPT:version}.properties"}}]}]}