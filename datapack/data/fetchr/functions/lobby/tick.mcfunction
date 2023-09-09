#> fetchr:lobby/tick
#
# This function is executed when at least one player is in the lobby and runs
# logic associated with lobby functionality
#
# @within function fetchr:tick/tick

execute as @a[predicate=fetchr:is_in_lobby] run function fetchr:lobby/player_tick
execute if entity @a[tag=fetchr.in_skybox] in fetchr:default as @e[type=minecraft:marker, tag=fetchr.spawn, distance=0.., limit=1] at @s run function fetchr:game/skybox/tick

#change settings
#execute as @a[scores={fetchr.settings=5..12}] run function fetchr:lobby/player_settings/save/do_action
#execute as @a[scores={fetchr.settings=14..20}] run function fetchr:lobby/player_settings/load/do_action
#execute as @e[type=minecraft:item, nbt={Item:{id:"minecraft:name_tag", tag:{fetchr:{newConfig: true}}}}] if data entity @s Item.tag.display.Name run function fetchr:lobby/player_settings/save/new_config

# mark card frame
execute as @e[type=minecraft:item_frame, tag=fetchr.card_frame, nbt=!{Item: {}}] at @s run function fetchr:card_frames/on_item_removed
execute as @e[type=minecraft:item_frame, tag=fetchr.card_frame, nbt=!{ItemRotation: 0b}] at @s run function fetchr:card_frames/on_rotation_changed

# regen item frames if neccasary
#>
# Used for counting the item frames
#
# @private
#declare score_holder $lobby/loop.frame_count
execute store result score $lobby/loop.frame_count fetchr.tmp if entity @e[type=minecraft:item_frame, tag=fetchr.card_frame, distance=0..]
execute unless score $lobby/loop.frame_count fetchr.tmp matches 25 run function fetchr:card_frames/spawn

gamerule sendCommandFeedback true