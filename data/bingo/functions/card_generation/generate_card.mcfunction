#> bingo:card_generation/generate_card
#
# Generates a card using the set seed in nn.math.rand
#
# @within
# 	function bingo:card_generation/random_card
# 	function bingo:card_generation/generate_from_seed
# @input score $seed nn.math.rand
# @writes storage bingo:card

#>
# @within function bingo:card_generation/**
#declare storage tmp.bingo:card_generation

function bingo:game/end

scoreboard players operation $seed bingo.state = $rand.seed 91.math.io
scoreboard players set $update_card bingo.state 1

#>
# The slot which is currently being generated
#
# @within function bingo:card_generation/**
#declare score_holder $card_gen.slot
scoreboard players set $card_gen.slot bingo.tmp 0
#>
# The current total weight of all remaining items of tmp.bingo:card_generation
# items
#
# @within function bingo:card_generation/**
#declare score_holder $card_gen.total_weight
scoreboard players operation $card_gen.total_weight bingo.tmp = $total_item_weight bingo.state
#>
# The current weight available per category. Might change if a category's total
# item weight changes in such a way that the available category weight cannot
# be split correctly.
#
# @within function bingo:card_generation/**
#declare score_holder $card_gen.available_category_weight
scoreboard players operation $card_gen.available_category_weight bingo.tmp = $available_category_weight bingo.state
#>
# Tag used for temporary entity used for positional command execution to set
# lobby command block's commands
#
# @within
# 	function bingo:card_generation/generate_card
# 	function bingo:card_generation/generate_slot
# 	function bingo:card_generation/set_commands
#declare tag bingo.command_cloud
data modify storage tmp.bingo:card_generation items set from storage bingo:items activeItems
data remove storage bingo:card slots
summon minecraft:area_effect_cloud 0 0 0 {Tags: ["bingo.command_cloud"]}
setblock 0 0 0 minecraft:oak_sign
execute positioned 0 0 0 as @e[type=minecraft:area_effect_cloud, tag=bingo.string_tester, distance=..0.1, limit=1] run function bingo:card_generation/generate_slot

function neun_einser.math:random/next_int
execute store result storage bingo:card spawnLocation int 1 run scoreboard players get $rand.seed 91.math.io
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

data modify block 0 0 0 Text1 set value '["",{"text":"a","font":"bingo:card"},{"translate":"space.-103"},[{"text":"","font":"bingo:actionbar_card/row0"},{"storage":"bingo:card","nbt":"slots[0].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[1].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[2].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[3].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[4].item.icon","interpret":true}],{"translate":"space.-101"},[{"text":"","font":"bingo:actionbar_card/row1"},{"storage":"bingo:card","nbt":"slots[5].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[6].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[7].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[8].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[9].item.icon","interpret":true}],{"translate":"space.-101"},[{"text":"","font":"bingo:actionbar_card/row2"},{"storage":"bingo:card","nbt":"slots[10].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[11].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[12].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[13].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[14].item.icon","interpret":true}],{"translate":"space.-101"},[{"text":"","font":"bingo:actionbar_card/row3"},{"storage":"bingo:card","nbt":"slots[15].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[16].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[17].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[18].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[19].item.icon","interpret":true}],{"translate":"space.-101"},[{"text":"","font":"bingo:actionbar_card/row4"},{"storage":"bingo:card","nbt":"slots[20].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[21].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[22].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[23].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"bingo:card","nbt":"slots[24].item.icon","interpret":true}],{"translate":"space.-103"}]'
data modify storage bingo:card teams[].card set from block 0 0 0 Text1
setblock 0 0 0 minecraft:barrier

execute as @e[tag=bingo.card_frame, scores={bingo.frame_id=12}, limit=1] at @s run playsound minecraft:entity.item_frame.add_item voice @a ~ ~ ~ 1 0.8

bossbar set bingo:start/pre_gen/progress visible false

#>
# @api
#declare tag/function bingo:post_card_gen
function #bingo:post_card_gen