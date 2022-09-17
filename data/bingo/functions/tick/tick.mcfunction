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
execute if score $is_multiplayer bingo.state matches 0 unless entity @e[name="DoNotTranslateThis{NEUN_SCRIPT:rp_version}", limit=1] run scoreboard players set $is_multiplayer bingo.state 1

# Place the sign in resource pack check chamber
setblock 1 2 1 minecraft:air
#NEUN_SCRIPT uncomment
#execute if entity @a[tag=bingo.resourcepack_check, limit=1] run setblock 1 2 1 minecraft:warped_wall_sign{Text1: '{"translate": "%1074992263$s%{NEUN_SCRIPT:rp_version}$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1074992263$s%3$s%3$s%1$s", "bold":true, "with": ["", {"translate": "bingo.resourcepack_check.wrong_version.sign.line1"}]}, {"translate": "bingo.resourcepack_check.sign.line1"}], "clickEvent": {"action": "run_command", "value": "/trigger bingo.resources"}}',Text2: '{"translate": "%1074992263$s%{NEUN_SCRIPT:rp_version}$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1074992263$s%3$s%3$s%1$s", "bold":true, "with": ["Download", {"translate": "bingo.resourcepack_check.wrong_version.sign.line2"}]}, {"translate": "bingo.resourcepack_check.sign.line2"}]}',Text3: '{"translate": "%1074992263$s%{NEUN_SCRIPT:rp_version}$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1074992263$s%3$s%3$s%1$s", "bold":true, "with": ["Resourcepack", {"translate": "bingo.resourcepack_check.wrong_version.sign.line3"}]}, {"translate": "bingo.resourcepack_check.sign.line3"}]}',Text4: '{"translate": "%1074992263$s%{NEUN_SCRIPT:rp_version}$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1074992263$s%3$s%3$s%1$s", "bold":true, "with": ["", {"translate": "bingo.resourcepack_check.wrong_version.sign.line4"}]}, {"translate": "bingo.resourcepack_check.sign.line4"}]}'}

#NEUN_SCRIPT remove
execute if entity @a[tag=bingo.resourcepack_check, limit=1] run setblock 1 2 1 minecraft:warped_wall_sign{Text1: '{"translate": "%1074992263$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1074992263$s%3$s%3$s%1$s", "bold":true, "with": ["", {"translate": "bingo.resourcepack_check.wrong_version.sign.line1"}]}, {"translate": "bingo.resourcepack_check.sign.line1"}], "clickEvent": {"action": "run_command", "value": "/trigger bingo.resources"}}',Text2: '{"translate": "%1074992263$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1074992263$s%3$s%3$s%1$s", "bold":true, "with": ["Download", {"translate": "bingo.resourcepack_check.wrong_version.sign.line2"}]}, {"translate": "bingo.resourcepack_check.sign.line2"}]}',Text3: '{"translate": "%1074992263$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1074992263$s%3$s%3$s%1$s", "bold":true, "with": ["Resourcepack", {"translate": "bingo.resourcepack_check.wrong_version.sign.line3"}]}, {"translate": "bingo.resourcepack_check.sign.line3"}]}',Text4: '{"translate": "%1074992263$s%1$s", "color": "#8eedeb", "with": [{"translate": "%1074992263$s%3$s%3$s%1$s", "bold":true, "with": ["", {"translate": "bingo.resourcepack_check.wrong_version.sign.line4"}]}, {"translate": "bingo.resourcepack_check.sign.line4"}]}'}
#endregion

# player tick
data modify storage tmp.bingo:custom_hud handled set value []
execute as @a at @s run function bingo:tick/player_tick
data modify storage bingo:custom_hud players append from storage tmp.bingo:custom_hud handled[]
scoreboard players reset $update_card bingo.state

# Command blocks enabled check
execute if score $commandblocks_enabled bingo.state matches 0 run effect give @a minecraft:blindness 2 255 true
execute if score $commandblocks_enabled bingo.state matches 0 run effect give @a minecraft:slowness 2 255 true
execute if score $commandblocks_enabled bingo.state matches 0 run effect give @a minecraft:jump_boost 2 128 true

#NEUN_SCRIPT uncomment
#execute if score $commandblocks_enabled bingo.state matches 0 run tellraw @a {"translate":"%1074992263$s%1$s", "color": "red", "with":[["Command blocks are disabled on this server. Please make sure the server.properties file does have all mentioned values set as described ", {"text": "here", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://gist.githubusercontent.com/NeunEinser/dac27cc76dbc83bdd1ea22a99cff3967/raw/{NEUN_SCRIPT:version}.properties"}}, "."], {"translate": "bingo.error.command_blocks_disabled", "with": [{"translate": "bingo.error.command_blocks_disabled.link", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://gist.githubusercontent.com/NeunEinser/dac27cc76dbc83bdd1ea22a99cff3967/raw/{NEUN_SCRIPT:version}.properties"}}]}]}

#NEUN_SCRIPT remove
execute if score $commandblocks_enabled bingo.state matches 0 run tellraw @a {"translate":"%1074992263$s%1$s", "color": "red", "with":[["Command blocks are disabled on this server. Please make sure the server.properties file does have all mentioned values set as described ", {"text": "here", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://gist.githubusercontent.com/NeunEinser/dac27cc76dbc83bdd1ea22a99cff3967"}}, "."], {"translate": "bingo.error.command_blocks_disabled", "with": [{"translate": "bingo.error.command_blocks_disabled.link", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://gist.githubusercontent.com/NeunEinser/dac27cc76dbc83bdd1ea22a99cff3967"}}]}]}

############################# KEEP AT END OF FILE #############################
# Loop depending on game state
execute if entity @a[predicate=bingo:is_in_lobby, limit=1] in bingo:lobby run function bingo:lobby/tick
execute if score $game_state bingo.state matches 2.. run function bingo:game/tick

scoreboard players operation $last_tick bingo.state = $raw 91.timer.time