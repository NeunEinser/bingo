#> bingo:tick/tick
#
# This function is called every tick
#
# This contains some base logic, but most of the stuff happens in
# bingo:lobby/tick and bingo:game/tick
#
# @within tag/function minecraft:tick
# @handles #minecraft:tick

scoreboard players enable @a bingo.card_pos
execute in bingo:lobby run function neun_einser.timer:store_current_time

# Resource pack check
tellraw @a[scores={bingo.resources=1}] ["\n\n\n", {"translate": "%1074992263$s%1$s", "with": [["",{"text": "The resourcepack is currently not enabled.", "color": "red"}, "\nPlease download the Resourcepack ", {"text": "here", "color": "#00c3ff", "clickEvent": {"action": "open_url", "value": "https://github.com/NeunEinser/bingo/releases/download/5.0-beta2/Resourcepack.zip"}}, " and enable it.\n\n[", {"text": "Re-check", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.resources"}}, "]"], ["", {"translate": "bingo.resourcepack_check.go_to_lobby.part1", "color": "green"}, "\n", {"translate": "bingo.resourcepack_check.go_to_lobby.part2", "with": [{"translate": "bingo.resourcepack_check.go_to_lobby.click", "color": "#00c3ff", "clickEvent": {"action": "run_command", "value": "/trigger bingo.resources set 91"}}]}]]}]
scoreboard players enable @a[tag=bingo.resourcepack_check] bingo.resources
scoreboard players set @a[scores={bingo.resources=1}] bingo.resources 0

execute as @a[scores={bingo.resources=91}] run function bingo:util/go_to_lobby

setblock 1 2 1 minecraft:air
setblock 1 2 1 minecraft:warped_wall_sign{Text1: '{"translate":"%1074992263$s%1$s", "bold": true, "color":"#8eedeb", "with": ["", {"translate": "bingo.resourcepack_check.sign.line1"}], "clickEvent": {"action": "run_command", "value": "/trigger bingo.resources"}}', Text2:'{"translate":"%1074992263$s%1$s", "bold": true, "color":"#8eedeb", "with": ["Download", {"translate": "bingo.resourcepack_check.sign.line2"}]}', Text3:'{"translate":"%1074992263$s%1$s", "bold": true, "color":"#8eedeb", "with": ["Resourcepack", {"translate": "bingo.resourcepack_check.sign.line3"}]}', Text4:'{"translate":"%1074992263$s%1$s", "bold": true, "color":"#8eedeb", "with": ["", {"translate": "bingo.resourcepack_check.sign.line4"}]}'}

# Assign each player a unique ID
execute as @a[scores={bingo.reconnect=1}] run function #bingo:player_reconnect
execute as @a unless score @s bingo.id matches -2147483648.. run function #bingo:new_player

# custom hud
data modify storage tmp.bingo:custom_hud handled set value []
execute as @a[predicate=!bingo:is_in_overworld] run function bingo:custom_hud/tick
data modify storage bingo:custom_hud players append from storage tmp.bingo:custom_hud handled[]
scoreboard players reset $update_card bingo.state

# change preferences
scoreboard players enable @a bingo.pref
execute as @a[scores={bingo.pref=..-1}] run function bingo:preferences/show
execute as @a[scores={bingo.pref=1..}] run function bingo:preferences/show

# Loop depending on game state
execute if entity @a[predicate=bingo:is_in_lobby, limit=1] in bingo:lobby run function bingo:lobby/tick
execute if score $game_state bingo.state matches 2.. run function bingo:game/tick

scoreboard players operation $last_tick bingo.state = $raw 91.timer.time