#> bingo:card_frames/on_item_removed
#
# This function is called by the lobby loop whenever an item was removed from a
# card frame in the lobby.
#
# It toggles the red marker block behind the item frame.
#
# @within function bingo:lobby/tick
# @context entity The item frame that had its item removed

#>
# This tag indicates whether the item frame in question should toggle on (set
# red concrete behind) or toggle off (set barrier behind).
#
# @private
#declare tag bingo.toggle_on

data modify storage tmp.bingo:card_frames slots set from storage bingo:card slots
scoreboard players operation $card_frames/find_item.slot_id bingo.tmp = @s bingo.frame_id
function bingo:card_frames/find_item

data modify entity @s Item set from storage tmp.bingo:card_frames foundItem

execute unless block ~ ~ ~-1 minecraft:red_concrete run tag @s add bingo.toggle_on
execute unless entity @s[tag=bingo.toggle_on] run setblock ~ ~ ~-1 minecraft:barrier
execute if entity @s[tag=bingo.toggle_on] run setblock ~ ~ ~-1 minecraft:red_concrete

tag @s remove bingo.toggle_on
playsound minecraft:entity.item_frame.remove_item neutral @a ~ ~ ~ 1 1