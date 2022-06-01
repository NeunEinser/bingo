#> bingo:card_frames/on_rotation_changed
#
# This function is called by the lobby loop whenever an item was removed from a
# card frame in the lobby.
#
# It toggles the hreen marker block behind the item frame.
#
# @within function bingo:lobby/tick
# @context entity The item frame that had its item removed

#>
# This tag indicates whether the item frame in question should toggle on (set
# green concrete behind) or toggle off (set barrier behind).
#
# @private
#declare tag bingo.toggle_on

data modify entity @s ItemRotation set value 0b

execute unless block ~ ~ ~-1 minecraft:green_concrete run tag @s add bingo.toggle_on
execute unless entity @s[tag=bingo.toggle_on] run setblock ~ ~ ~-1 minecraft:barrier
execute if entity @s[tag=bingo.toggle_on] run setblock ~ ~ ~-1 minecraft:green_concrete

tag @s remove bingo.toggle_on
playsound minecraft:entity.item_frame.rotate_item neutral @a ~ ~ ~ 1 1