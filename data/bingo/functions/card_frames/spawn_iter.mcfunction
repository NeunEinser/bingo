#> bingo:card_frames/spawn_iter
#
# Iterates 25 times to spawn 25 item frames to be used for displaying the crad
# in the lobby.
#
# Already creates each frame at the correct location
#
# @within
# 	function bingo:card_frames/spawn
# 	function bingo:card_frames/spawn_iter
# @context
# 	dimension bingo:lobby
# 	location Location where next item frame needs to be placed, starting from
# 		top left
#>
# @private
#declare score_holder $card_frames/spawn.row
#>
# @private
#declare tag bingo.new
#>
# @within
# 	function bingo:card_frames/spawn
# 	function bingo:card_frames/spawn_iter
#declare score_holder $card_frames/spawn.i
#>
# @within
# 	function bingo:card_frames/spawn
# 	function bingo:card_frames/spawn_iter
#declare storage tmp.bingo:card_frames/spawn_frames

summon minecraft:item_frame ~ ~ ~ {Facing: 3b, Silent: true, Tags: ["bingo.card_frame", "bingo.new"], Item:{id:"minecraft:barrier", Count: 1b}, ItemDropChance: 0.0f}
scoreboard players operation @e[type=minecraft:item_frame, tag=bingo.card_frame, tag=bingo.new] bingo.frame_id = $card_frames/spawn.i bingo.tmp

data modify entity @e[type=minecraft:item_frame, tag=bingo.new, limit=1] Item set from storage tmp.bingo:card_frames/spawn_frames slots[0].item.item
data remove storage tmp.bingo:card_frames/spawn_frames slots[0]

tag @e[type=minecraft:item_frame, tag=bingo.card_frame] remove bingo.new

scoreboard players add $card_frames/spawn.i bingo.tmp 1
scoreboard players operation $card_frames/spawn.row bingo.tmp = $card_frames/spawn.i bingo.tmp
scoreboard players operation $card_frames/spawn.row bingo.tmp %= 5 bingo.const

execute if score $card_frames/spawn.i bingo.tmp matches ..24 if score $card_frames/spawn.row bingo.tmp matches 1.. positioned ~1 ~ ~ run function bingo:card_frames/spawn_iter
execute if score $card_frames/spawn.i bingo.tmp matches ..24 if score $card_frames/spawn.row bingo.tmp matches 0 positioned ~-4 ~-1 ~ run function bingo:card_frames/spawn_iter