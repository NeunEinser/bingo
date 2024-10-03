#> fetchr:card_frames/spawn_iter
#
# Iterates 25 times to spawn 25 item frames to be used for displaying the crad
# in the lobby.
#
# Already creates each frame at the correct location
#
# @within
# 	function fetchr:card_frames/spawn_frames
# 	function fetchr:card_frames/spawn_iter
#>
# @private
#declare score_holder $card_frames/spawn.row
#>
# @private
#declare tag fetchr.new
#>
# @within
# 	function fetchr:card_frames/spawn_frames
# 	function fetchr:card_frames/spawn_iter
#declare score_holder $card_frames/spawn.i
#>
# @within
# 	function fetchr:card_frames/spawn_frames
# 	function fetchr:card_frames/spawn_iter
#declare storage tmp.fetchr:card_frames/spawn_frames

summon minecraft:item_frame ~ ~ ~ {Facing: 3b, Silent: true, Tags: ["fetchr.card_frame", "fetchr.new"], Item:{id:"minecraft:barrier", Count: 1b}, ItemDropChance: 0.0f}
scoreboard players operation @e[type=minecraft:item_frame, tag=fetchr.card_frame, tag=fetchr.new] fetchr.lobby_card_frame_id = $card_frames/spawn.i fetchr.tmp

execute unless score $blind_mode fetchr.state matches 1 run data modify entity @e[type=minecraft:item_frame, tag=fetchr.new, limit=1] Item set from storage tmp.fetchr:card_frames/spawn_frames slots[0].item.item
data remove storage tmp.fetchr:card_frames/spawn_frames slots[0]

tag @e[type=minecraft:item_frame, tag=fetchr.card_frame] remove fetchr.new

scoreboard players add $card_frames/spawn.i fetchr.tmp 1
scoreboard players operation $card_frames/spawn.row fetchr.tmp = $card_frames/spawn.i fetchr.tmp
scoreboard players operation $card_frames/spawn.row fetchr.tmp %= 5 fetchr.const

execute if score $card_frames/spawn.i fetchr.tmp matches ..24 if score $card_frames/spawn.row fetchr.tmp matches 1.. positioned ~1 ~ ~ run function fetchr:card_frames/spawn_iter
execute if score $card_frames/spawn.i fetchr.tmp matches ..24 if score $card_frames/spawn.row fetchr.tmp matches 0 positioned ~-4 ~-1 ~ run function fetchr:card_frames/spawn_iter