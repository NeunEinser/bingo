function bingo:util/find_player_team_entity
tag @s add bingo_got_item
execute as @e[tag=bingo_repeater, scores={bingo_slot_id=0..}, limit=1] run function bingo:award_item/award_item

execute if entity @s[tag=bingo_successful_got_item] run tellraw @a {"translate": "bingo.got_item", "with": [{"selector": "@s"}, {"translate": "block.minecraft.repeater", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:repeater"}}}]}

tag @s remove bingo_got_item
tag @s remove bingo_successful_got_item
tag @e[type=minecraft:area_effect_cloud, tag=bingo_completed_item, tag=bingo_current_team, limit=1] remove bingo_current_team