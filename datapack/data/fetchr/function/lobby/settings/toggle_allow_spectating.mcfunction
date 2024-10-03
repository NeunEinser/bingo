#> fetchr:lobby/settings/toggle_allow_spectating
#
# This function checks whether strict mode is active and the player clicking is
# a confirmed operator, and the either asks the player to confirm their op
# status or toggles the allow spectating mode setting.
#
# @user
# @context entity Player changing the setting

execute unless score @s fetchr.operator matches 1 run function fetchr:util/show_confirm_operator_status_prompt
execute unless score @s fetchr.operator matches 1 run return 0

scoreboard players add $allow_spectating fetchr.settings 1
execute if score $allow_spectating fetchr.settings matches 2 run scoreboard players set $allow_spectating fetchr.settings 0

execute if score $allow_spectating fetchr.settings matches 0 run tellraw @s {"translate": "fetchr.lobby.settings.allow_spectating.toggle.off", "color": "red"}
execute if score $allow_spectating fetchr.settings matches 1 run tellraw @s {"translate": "fetchr.lobby.settings.allow_spectating.toggle.on", "color": "green"}

execute if score $allow_spectating fetchr.settings matches 0 run data modify entity @e[type=minecraft:marker, tag=fetchr.allow_spectating_sign, distance=..1, limit=1] data.front_text.messages[3] set value '{"translate": "fetchr.lobby.settings.allow_spectating.sign.off", "color": "gray"}'
execute if score $allow_spectating fetchr.settings matches 1 run data modify entity @e[type=minecraft:marker, tag=fetchr.allow_spectating_sign, distance=..1, limit=1] data.front_text.messages[3] set value '{"translate": "fetchr.lobby.settings.allow_spectating.sign.on", "color": "green"}'

function fetchr:lobby/place_indestructible_blocks