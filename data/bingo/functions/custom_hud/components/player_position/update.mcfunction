#> bingo:custom_hud/components/player_position/update
#
# Updates the component for the player position
#
# @within function bingo:custom_hud/components/player_position/tick
# @context entity Player whose hud is currently being updated

#>
# @private
#declare score_holder $custom_hud/player_pos.line
execute store result score $custom_hud/player_pos.line bingo.tmp run data get storage bingo:custom_hud components[{id: "bingo:player_position"}].line

#>
# @within function bingo:custom_hud/components/player_position/*
#declare storage temp:bingo.custom_hud

#>
# @within function bingo:custom_hud/components/player_position/*
#declare score_holder $custom_hud/player_pos.x_len
#>
# @within function bingo:custom_hud/components/player_position/*
#declare score_holder $custom_hud/player_pos.z_len

scoreboard players operation @s bingo.pos_hash = $custom_hud/player_pos.hash bingo.tmp
execute if entity @s[predicate=!bingo:is_in_lobby] run scoreboard players operation $custom_hud/player_pos.x bingo.tmp -= $spawn_x bingo.state
execute if entity @s[predicate=!bingo:is_in_lobby] run scoreboard players operation $custom_hud/player_pos.z bingo.tmp -= $spawn_z bingo.state

data modify storage temp:bingo.custom_hud component set value {textComponent:'[{"storage": "bingo:custom_hud", "nbt": "params.bingo.player_position.x"}, " ", {"storage": "bingo:custom_hud", "nbt": "params.bingo.player_position.z"}]', changed: true, iconWidth: '{"translate": "space.10"}', iconSeperatorAlignLeft: '" "', iconSeperatorAlignRight: '" "'}
execute if score $custom_hud/player_pos.rot bingo.tmp matches 0 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0100"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 1 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u011F"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 2 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u011E"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 3 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u011D"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 4 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u011C"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 5 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u011B"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 6 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u011A"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 7 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0119"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 8 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0118"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 9 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0117"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 10 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0116"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 11 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0115"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 12 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0114"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 13 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0113"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 14 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0112"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 15 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0111"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 16 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0110"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 17 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u010F"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 18 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u010E"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 19 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u010D"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 20 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u010C"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 21 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u010B"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 22 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u010A"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 23 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0109"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 24 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0108"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 25 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0107"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 26 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0106"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 27 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0105"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 28 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0104"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 29 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0103"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 30 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0102"'
execute if score $custom_hud/player_pos.rot bingo.tmp matches 31 run data modify storage temp:bingo.custom_hud component.icon set value '"\\u0101"'

execute if score $custom_hud/player_pos.line bingo.tmp matches 0 run data modify storage temp:bingo.custom_hud component.iconFont set value '{"text":"", "font": "bingo:compass/line0"}'
execute if score $custom_hud/player_pos.line bingo.tmp matches 1 run data modify storage temp:bingo.custom_hud component.iconFont set value '{"text":"", "font": "bingo:compass/line1"}'
execute if score $custom_hud/player_pos.line bingo.tmp matches 2 run data modify storage temp:bingo.custom_hud component.iconFont set value '{"text":"", "font": "bingo:compass/line2"}'
execute if score $custom_hud/player_pos.line bingo.tmp matches 3 run data modify storage temp:bingo.custom_hud component.iconFont set value '{"text":"", "font": "bingo:compass/line3"}'
execute if score $custom_hud/player_pos.line bingo.tmp matches 4 run data modify storage temp:bingo.custom_hud component.iconFont set value '{"text":"", "font": "bingo:compass/line4"}'
execute if score $custom_hud/player_pos.line bingo.tmp matches 5 run data modify storage temp:bingo.custom_hud component.iconFont set value '{"text":"", "font": "bingo:compass/line5"}'
execute if score $custom_hud/player_pos.line bingo.tmp matches 6 run data modify storage temp:bingo.custom_hud component.iconFont set value '{"text":"", "font": "bingo:compass/line6"}'
execute if score $custom_hud/player_pos.line bingo.tmp matches 7 run data modify storage temp:bingo.custom_hud component.iconFont set value '{"text":"", "font": "bingo:compass/line7"}'
execute if score $custom_hud/player_pos.line bingo.tmp matches 8 run data modify storage temp:bingo.custom_hud component.iconFont set value '{"text":"", "font": "bingo:compass/line8"}'
execute if score $custom_hud/player_pos.line bingo.tmp matches 9 run data modify storage temp:bingo.custom_hud component.iconFont set value '{"text":"", "font": "bingo:compass/line9"}'
execute if score $custom_hud/player_pos.line bingo.tmp matches 10 run data modify storage temp:bingo.custom_hud component.iconFont set value '{"text":"", "font": "bingo:compass/line10"}'

scoreboard players operation $custom_hud/width.number bingo.io = $custom_hud/player_pos.x bingo.tmp
scoreboard players set $custom_hud/width.padding bingo.io 73

function bingo:custom_hud/subtract_width
scoreboard players operation $custom_hud/player_pos.x_len bingo.tmp = $custom_hud/width.characters bingo.io
scoreboard players operation $custom_hud/width.number bingo.io = $custom_hud/player_pos.z bingo.tmp
function bingo:custom_hud/subtract_width
scoreboard players operation $custom_hud/player_pos.z_len bingo.tmp = $custom_hud/width.characters bingo.io
scoreboard players operation $custom_hud/width.characters bingo.io += $custom_hud/player_pos.x_len bingo.tmp

execute store result storage bingo:custom_hud params.bingo.player_position.x int 1 run scoreboard players get $custom_hud/player_pos.x bingo.tmp
execute store result storage bingo:custom_hud params.bingo.player_position.z int 1 run scoreboard players get $custom_hud/player_pos.z bingo.tmp
execute if score $custom_hud/width.characters bingo.io matches 12.. run function bingo:custom_hud/components/player_position/shorten

function bingo:custom_hud/calculate_padding

data modify storage temp:bingo.custom_hud component.padding set from storage io.bingo:custom_hud/padding padding
data modify storage bingo:custom_hud components[{id: "bingo:player_position"}] merge from storage temp:bingo.custom_hud component