#> fetchr:card_generation/generate_card
#
# Generates a card using the set seed in nn.math.rand
#
# @within
# 	function fetchr:card_generation/random_card
# 	function fetchr:card_generation/generate_from_seed
# @input score $seed nn.math.rand
# @writes storage fetchr:card

#>
# @within function fetchr:card_generation/**
#declare storage tmp.fetchr:card_generation

function fetchr:game/end

scoreboard players operation $seed fetchr.state = $rand.seed 91.math.io
scoreboard players set $update_card fetchr.state 1

#>
# The slot which is currently being generated
#
# @within function fetchr:card_generation/**
#declare score_holder $card_gen.slot
scoreboard players set $card_gen.slot fetchr.tmp 0
#>
# The current total weight of all remaining items of tmp.fetchr:card_generation
# items
#
# @within function fetchr:card_generation/**
#declare score_holder $card_gen.total_weight
scoreboard players operation $card_gen.total_weight fetchr.tmp = $total_item_weight fetchr.state
#>
# The current weight available per category. Might change if a category's total
# item weight changes in such a way that the available category weight cannot
# be split correctly.
#
# @within function fetchr:card_generation/**
#declare score_holder $card_gen.available_category_weight
scoreboard players operation $card_gen.available_category_weight fetchr.tmp = $available_category_weight fetchr.state
#>
# Tag used for temporary entity used for positional command execution to set
# lobby command block's commands
#
# @within
# 	function fetchr:card_generation/generate_card
# 	function fetchr:card_generation/generate_slot
# 	function fetchr:card_generation/set_commands
#declare tag fetchr.command_cloud
data modify storage tmp.fetchr:card_generation items set from storage fetchr:items activeItems
data remove storage fetchr:card slots
summon minecraft:marker 0 0 0 {Tags: ["fetchr.command_cloud"]}
execute positioned 0 0 0 as @e[type=minecraft:marker, tag=fetchr.string_tester, distance=..0.1, limit=1] run function fetchr:card_generation/generate_slot
kill @e[type=minecraft:marker, tag=fetchr.command_cloud, limit=1]

function neun_einser.math:random/next_int
execute store result storage fetchr:card spawnLocation int 1 run scoreboard players get $rand.seed 91.math.io

# Reset teams
data remove storage fetchr:card teams
data modify storage fetchr:card teams append value {id: "fetchr:aqua", completedBorder: '{"text": "\\uFFFE", "color": "aqua"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage fetchr:card teams append value {id: "fetchr:black", completedBorder: '{"text": "\\uFFFE", "color": "black"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage fetchr:card teams append value {id: "fetchr:blue", completedBorder: '{"text": "\\uFFFE", "color": "blue"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage fetchr:card teams append value {id: "fetchr:dark_aqua", completedBorder: '{"text": "\\uFFFE", "color": "dark_aqua"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage fetchr:card teams append value {id: "fetchr:dark_blue", completedBorder: '{"text": "\\uFFFE", "color": "dark_blue"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage fetchr:card teams append value {id: "fetchr:dark_gray", completedBorder: '{"text": "\\uFFFE", "color": "dark_gray"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage fetchr:card teams append value {id: "fetchr:dark_green", completedBorder: '{"text": "\\uFFFE", "color": "dark_green"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage fetchr:card teams append value {id: "fetchr:dark_purple", completedBorder: '{"text": "\\uFFFE", "color": "dark_purple"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage fetchr:card teams append value {id: "fetchr:dark_red", completedBorder: '{"text": "\\uFFFE", "color": "dark_red"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage fetchr:card teams append value {id: "fetchr:gold", completedBorder: '{"text": "\\uFFFE", "color": "gold"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage fetchr:card teams append value {id: "fetchr:gray", completedBorder: '{"text": "\\uFFFE", "color": "gray"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage fetchr:card teams append value {id: "fetchr:green", completedBorder: '{"text": "\\uFFFE", "color": "green"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage fetchr:card teams append value {id: "fetchr:light_purple", completedBorder: '{"text": "\\uFFFE", "color": "light_purple"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage fetchr:card teams append value {id: "fetchr:red", completedBorder: '{"text": "\\uFFFE", "color": "red"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage fetchr:card teams append value {id: "fetchr:white", completedBorder: '{"text": "\\uFFFE", "color": "white"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}
data modify storage fetchr:card teams append value {id: "fetchr:yellow", completedBorder: '{"text": "\\uFFFE", "color": "yellow"}', slots:['"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"', '"\\uFFFF"']}

data modify block 7 0 7 Text1 set value '["",{"text":"a","font":"fetchr:card"},{"translate":"space.-103"},[{"text":"","font":"fetchr:actionbar_card/row0"},{"storage":"fetchr:card","nbt":"slots[0].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[1].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[2].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[3].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[4].item.icon","interpret":true}],{"translate":"space.-101"},[{"text":"","font":"fetchr:actionbar_card/row1"},{"storage":"fetchr:card","nbt":"slots[5].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[6].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[7].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[8].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[9].item.icon","interpret":true}],{"translate":"space.-101"},[{"text":"","font":"fetchr:actionbar_card/row2"},{"storage":"fetchr:card","nbt":"slots[10].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[11].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[12].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[13].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[14].item.icon","interpret":true}],{"translate":"space.-101"},[{"text":"","font":"fetchr:actionbar_card/row3"},{"storage":"fetchr:card","nbt":"slots[15].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[16].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[17].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[18].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[19].item.icon","interpret":true}],{"translate":"space.-101"},[{"text":"","font":"fetchr:actionbar_card/row4"},{"storage":"fetchr:card","nbt":"slots[20].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[21].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[22].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[23].item.icon","interpret":true},{"translate":"space.4","font":"space:default"},{"storage":"fetchr:card","nbt":"slots[24].item.icon","interpret":true}],{"translate":"space.-103"}]'
data modify storage fetchr:card teams[].card set from block 7 0 7 Text1

execute as @e[tag=fetchr.card_frame, scores={fetchr.lobby_card_frame_id=12}, limit=1] at @s run playsound minecraft:entity.item_frame.add_item voice @a ~ ~ ~ 1 0.8

bossbar set fetchr:start/pre_gen/progress visible false

function fetchr:custom_hud/components/timer/update

#>
# @api
#declare tag/function fetchr:post_card_gen
function #fetchr:post_card_gen

#NEUN_SCRIPT uncomment
#schedule function fetchr:game/start/locate_spawnpoint 5s