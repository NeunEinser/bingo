tag @s add bingo_got_item
execute as @e[tag=bingo_item_frame, scores={bingo_slot_id=0..}, limit=1] run function bingo:award_item

execute if entity @s[tag=bingo_successful_got_item] run tellraw @a {"translate": "bingo.got_item", "with": [{"selector": "@s"}, {"translate": "item.minecraft.item_frame", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:item_frame"}}}]}

tag @s remove bingo_got_item
tag @s remove bingo_successful_got_item