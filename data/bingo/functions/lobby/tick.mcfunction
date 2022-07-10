#> bingo:lobby/tick
#
# This function is executed when at least one player is in the lobby and runs
# logic associated with lobby functionality
#
# @within function bingo:tick/tick

execute as @a[predicate=bingo:is_in_lobby] run function bingo:lobby/player_tick

#change settings
#execute as @a[scores={bingo.settings=5..12}] run function bingo:lobby/player_settings/save/do_action
#execute as @a[scores={bingo.settings=14..20}] run function bingo:lobby/player_settings/load/do_action
#execute as @e[type=minecraft:item, nbt={Item:{id:"minecraft:name_tag", tag:{bingo:{newConfig: true}}}}] if data entity @s Item.tag.display.Name run function bingo:lobby/player_settings/save/new_config

# mark card frame
execute as @e[type=minecraft:item_frame, tag=bingo.card_frame, nbt=!{Item: {}}] at @s run function bingo:card_frames/on_item_removed
execute as @e[type=minecraft:item_frame, tag=bingo.card_frame, nbt=!{ItemRotation: 0b}] at @s run function bingo:card_frames/on_rotation_changed

# regen item frames if neccasary
#>
# Used for counting the item frames
#
# @private
#declare score_holder $lobby/loop.frame_count
execute store result score $lobby/loop.frame_count bingo.tmp if entity @e[type=minecraft:item_frame, tag=bingo.card_frame]
execute unless score $lobby/loop.frame_count bingo.tmp matches 25 run function bingo:card_frames/spawn