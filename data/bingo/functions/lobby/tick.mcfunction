# Float in front of card display
execute as @a at @s if block ~ ~ ~ minecraft:void_air run effect give @s minecraft:levitation 1 255 true
execute as @a at @s unless block ~ ~ ~ minecraft:void_air run effect clear @s minecraft:levitation

# generate card from seed
scoreboard players enable @a bingo.seed
execute as @a[scores={bingo.seed=..-1}] run function bingo:card_generation/generate_from_seed
execute as @a[scores={bingo.seed=1..}] run function bingo:card_generation/generate_from_seed

#change settings
execute as @a[scores={bingo.settings=5..12}] run function bingo:lobby/player_settings/save/do_action
execute as @a[scores={bingo.settings=14..20}] run function bingo:lobby/player_settings/load/do_action
execute as @e[type=minecraft:item, nbt={Item:{id:"minecraft:name_tag", tag:{bingo:{newConfig: true}}}}] if data entity @s Item.tag.display.Name run function bingo:lobby/player_settings/save/new_config
scoreboard players reset @a bingo.settings
scoreboard players enable @a bingo.settings

# mark card frame
execute as @e[type=minecraft:item_frame, tag=bingo.card_frame, nbt=!{Item: {}}] at @s run function bingo:card_frames/on_item_removed
execute as @e[type=minecraft:item_frame, tag=bingo.card_frame, nbt=!{ItemRotation: 0b}] at @s run function bingo:card_frames/on_rotation_changed

# set signs
function bingo:lobby/set_signs