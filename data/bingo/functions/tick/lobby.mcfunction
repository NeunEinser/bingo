# generate card from seed
scoreboard players enable @a bingo_seed
execute as @a[scores={bingo_seed=..-1}] run function bingo:card_generation/generate_from_seed
execute as @a[scores={bingo_seed=1..}] run function bingo:card_generation/generate_from_seed

# change preferences
scoreboard players enable @a bingo_preference
execute as @a[scores={bingo_preference=..-1}] run function bingo:preferences/show_preferences
execute as @a[scores={bingo_preference=1..}] run function bingo:preferences/show_preferences

#change settings
execute if entity @a[limit=1, scores={bingo_settings=1}] run function bingo:card_generation/random_card
tellraw @a[limit=1, scores={bingo_settings=2}] [{"translate": "bingo.lobby.card_generation.from_seed.instructions", "with": [{"translate": "bingo.lobby.card_generation.from_seed.instructions.link", "color":"#00c3ff", "clickEvent": {"action": "suggest_command", "value": "/trigger bingo_seed set "}}]}, "\n", {"translate": "bingo.lobby.card_generation.from_seed.explanation", "italic": true, "color": "gray"}]
scoreboard players reset @a bingo_settings
scoreboard players enable @a bingo_settings

# mark card frame
execute as @e[type=minecraft:item_frame, tag=bingo_card_frame, nbt=!{Item: {}}] at @s run function bingo:card_frames/on_item_removed
execute as @e[type=minecraft:item_frame, tag=bingo_card_frame, nbt=!{ItemRotation: 0b}] at @s run function bingo:card_frames/on_rotation_changed