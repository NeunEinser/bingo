#> fetchr:lobby/place_special_sign/strict_mode
#
# Special handling for the strict mode sign
#
# @within function fetchr:lobby/place_sign
# @context
# 	entity The marker related to the sign
# 	location The position of the sign

execute if score $is_multiplayer fetchr.state matches 0 run setblock ~ ~ ~ minecraft:air
execute if score $is_multiplayer fetchr.state matches 1 run setblock ~ ~ ~ minecraft:crimson_wall_sign[facing=north]

execute if score $strict_mode fetchr.settings matches 0 run data modify block ~ ~ ~ front_text.messages[3] set value '{"translate":"fetchr.lobby.settings.strict_mode.sign.off","color":"red"}'
execute if score $strict_mode fetchr.settings matches 1 run data modify block ~ ~ ~ front_text.messages[3] set value '{"translate":"fetchr.lobby.settings.strict_mode.sign.on","color":"green"}'
execute if score $strict_mode fetchr.settings matches 2 run data modify block ~ ~ ~ front_text.messages[3] set value '{"translate":"fetchr.lobby.settings.strict_mode.sign.adventure", "color":"gray"}'