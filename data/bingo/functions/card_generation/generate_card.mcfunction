function bingo:game/end

scoreboard players operation $seed bingo.state = $seed nn.math.rand

data remove storage bingo:tmp forbiddenCategories
data modify storage bingo:tmp categories set from storage bingo:items categories
data remove storage bingo:card_generation forbiddenCategories
data remove storage bingo:card slots
execute as @e[type=minecraft:item_frame, tag=bingo.card_frame] at @s run setblock ~ ~ ~-1 minecraft:barrier

execute in bingo:lobby run data modify block 0 0 0 auto set value false
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