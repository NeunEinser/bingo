tellraw @a {"translate": "bingo.got_item", "with": [{"selector": "@s"}, {"translate": "block.minecraft.ominous_banner", "hoverEvent": {"action": "show_item", "contents": {"id": "minecraft:ominous_banner"}}}]}
execute as @e[type=minecraft:area_effect_cloud, tag=bingo_completed_item, tag=bingo_current_team, limit=1] run function bingo:item_detection/goals/announce_completed_goals
tag @s add bingo_clear_ominous_banner
schedule function bingo:item_detection/clear_item/ominous_banner 1