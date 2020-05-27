tag @s add bingo_got_item
execute as @e[tag=bingo_purple_dye, scores={bingo_slot_id=0..}, limit=1] run function bingo:award_item

execute if entity @s[tag=bingo_successful_got_item] run tellraw @a {"translate": "bingo.got_item", "with": [{"selector": "@s"}, {"translate": "item.minecraft.purple_dye", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:purple_dye"}}}]}

tag @s remove bingo_got_item
tag @s remove bingo_successful_got_item