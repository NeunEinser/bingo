function bingo:game/end

scoreboard players operation $seed bingo.state = $seed nn.math.rand

data remove storage bingo:tmp forbiddenCategories
data modify storage bingo:tmp categories set from storage bingo:items categories
data remove storage bingo:card_generation forbiddenCategories
data remove storage bingo:card slots
execute as @e[type=minecraft:item_frame, tag=bingo.card_frame] at @s run setblock ~ ~ ~-1 minecraft:barrier

execute in bingo:lobby run data modify block 5 3 5 auto set value false

#>
# This tag marks a player who is in a team that obtained the item in slot 0.
#
# @private
#declare tag bingo.has_slot0
#>
# This tag marks a player who is in a team that obtained the item in slot 1.
#
# @private
#declare tag bingo.has_slot1
#>
# This tag marks a player who is in a team that obtained the item in slot 2.
#
# @private
#declare tag bingo.has_slot2
#>
# This tag marks a player who is in a team that obtained the item in slot 3.
#
# @private
#declare tag bingo.has_slot3
#>
# This tag marks a player who is in a team that obtained the item in slot 4.
#
# @private
#declare tag bingo.has_slot4
#>
# This tag marks a player who is in a team that obtained the item in slot 5.
#
# @private
#declare tag bingo.has_slot5
#>
# This tag marks a player who is in a team that obtained the item in slot 6.
#
# @private
#declare tag bingo.has_slot6
#>
# This tag marks a player who is in a team that obtained the item in slot 7.
#
# @private
#declare tag bingo.has_slot7
#>
# This tag marks a player who is in a team that obtained the item in slot 8.
#
# @private
#declare tag bingo.has_slot8
#>
# This tag marks a player who is in a team that obtained the item in slot 9.
#
# @private
#declare tag bingo.has_slot9
#>
# This tag marks a player who is in a team that obtained the item in slot 10.
#
# @private
#declare tag bingo.has_slot10
#>
# This tag marks a player who is in a team that obtained the item in slot 11.
#
# @private
#declare tag bingo.has_slot11
#>
# This tag marks a player who is in a team that obtained the item in slot 12.
#
# @private
#declare tag bingo.has_slot12
#>
# This tag marks a player who is in a team that obtained the item in slot 13.
#
# @private
#declare tag bingo.has_slot13
#>
# This tag marks a player who is in a team that obtained the item in slot 14.
#
# @private
#declare tag bingo.has_slot14
#>
# This tag marks a player who is in a team that obtained the item in slot 15.
#
# @private
#declare tag bingo.has_slot15
#>
# This tag marks a player who is in a team that obtained the item in slot 16.
#
# @private
#declare tag bingo.has_slot16
#>
# This tag marks a player who is in a team that obtained the item in slot 17.
#
# @private
#declare tag bingo.has_slot17
#>
# This tag marks a player who is in a team that obtained the item in slot 18.
#
# @private
#declare tag bingo.has_slot18
#>
# This tag marks a player who is in a team that obtained the item in slot 19.
#
# @private
#declare tag bingo.has_slot19
#>
# This tag marks a player who is in a team that obtained the item in slot 20.
#
# @private
#declare tag bingo.has_slot20
#>
# This tag marks a player who is in a team that obtained the item in slot 21.
#
# @private
#declare tag bingo.has_slot21
#>
# This tag marks a player who is in a team that obtained the item in slot 22.
#
# @private
#declare tag bingo.has_slot22
#>
# This tag marks a player who is in a team that obtained the item in slot 23.
#
# @private
#declare tag bingo.has_slot23
#>
# This tag marks a player who is in a team that obtained the item in slot 24.
#
# @private
#declare tag bingo.has_slot24

tag @a remove bingo.has_slot0
tag @a remove bingo.has_slot1
tag @a remove bingo.has_slot2
tag @a remove bingo.has_slot3
tag @a remove bingo.has_slot4
tag @a remove bingo.has_slot5
tag @a remove bingo.has_slot6
tag @a remove bingo.has_slot7
tag @a remove bingo.has_slot8
tag @a remove bingo.has_slot9
tag @a remove bingo.has_slot10
tag @a remove bingo.has_slot11
tag @a remove bingo.has_slot12
tag @a remove bingo.has_slot13
tag @a remove bingo.has_slot14
tag @a remove bingo.has_slot15
tag @a remove bingo.has_slot16
tag @a remove bingo.has_slot17
tag @a remove bingo.has_slot18
tag @a remove bingo.has_slot19
tag @a remove bingo.has_slot20
tag @a remove bingo.has_slot21
tag @a remove bingo.has_slot22
tag @a remove bingo.has_slot23
tag @a remove bingo.has_slot24

scoreboard players set $i bingo.tmp 0
execute in bingo:lobby run summon minecraft:area_effect_cloud 0 0 0 {Tags: ["bingo.command_cloud"]}
function bingo:card_generation/generate_slot

function nope_name.math:rand/exe
execute store result storage bingo:card spawnLocation int 1 run scoreboard players get $out nn.math.rand
execute if score $automatically_pregen bingo.settings matches 1 run schedule function bingo:game/start/locate_spawnpoint 5s

# Reset teams
data remove storage bingo:card teams
data modify storage bingo:card teams append value {id: "bingo:aqua", completedBorder: '{"text": "\\uFFFE", "color": "aqua"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:black", completedBorder: '{"text": "\\uFFFE", "color": "black"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:blue", completedBorder: '{"text": "\\uFFFE", "color": "blue"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:dark_aqua", completedBorder: '{"text": "\\uFFFE", "color": "dark_aqua"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:dark_blue", completedBorder: '{"text": "\\uFFFE", "color": "dark_blue"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:dark_gray", completedBorder: '{"text": "\\uFFFE", "color": "dark_gray"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:dark_green", completedBorder: '{"text": "\\uFFFE", "color": "dark_green"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:dark_purple", completedBorder: '{"text": "\\uFFFE", "color": "dark_purple"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:dark_red", completedBorder: '{"text": "\\uFFFE", "color": "dark_red"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:gold", completedBorder: '{"text": "\\uFFFE", "color": "gold"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:gray", completedBorder: '{"text": "\\uFFFE", "color": "gray"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:green", completedBorder: '{"text": "\\uFFFE", "color": "green"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:light_purple", completedBorder: '{"text": "\\uFFFE", "color": "light_purple"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:red", completedBorder: '{"text": "\\uFFFE", "color": "red"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:white", completedBorder: '{"text": "\\uFFFE", "color": "white"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage bingo:card teams append value {id: "bingo:yellow", completedBorder: '{"text": "\\uFFFE", "color": "yellow"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
function bingo:card_display/display_card_schedule