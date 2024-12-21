#> fetchr:lobby/tick
#
# This function is executed when at least one player is in the lobby and runs
# logic associated with lobby functionality
#
# @within function fetchr:tick/tick

execute \
	as @a[predicate=fetchr:is_in_lobby] \
	at @s \
	run function fetchr:lobby/player_tick

execute \
	as @e[x=0, type=minecraft:creeper] \
	run data modify entity @s ExplosionRadius set value 0b

execute \
	as @e[x=0, type=minecraft:tnt] \
	run data modify entity @s explosion_power set value 0f

#change settings
#execute as @a[scores={fetchr.settings=5..12}] run function fetchr:lobby/player_settings/save/do_action
#execute as @a[scores={fetchr.settings=14..20}] run function fetchr:lobby/player_settings/load/do_action
#execute as @e[type=minecraft:item, nbt={Item:{id:"minecraft:name_tag", tag:{fetchr:{newConfig: true}}}}] if data entity @s Item.tag.display.Name run function fetchr:lobby/player_settings/save/new_config

# mark card frame
scoreboard players set $card_frames.count fetchr.io 0
execute as @e[type=minecraft:item_frame, tag=fetchr.card_frame, distance=0..] at @s run function fetchr:card_frames/check_item

# regen item frames if neccasary
execute if score $card_frames.count fetchr.io matches ..24 run function fetchr:card_frames/spawn

# Command feedback is sometimes momentarily disabled to hide certain messages.
# This re-enables it.
gamerule sendCommandFeedback true
