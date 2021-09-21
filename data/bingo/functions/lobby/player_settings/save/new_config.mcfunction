data modify storage bingo:player configurations append value {}
data modify storage bingo:player configurations[-1].name set from entity @s Item.tag.display.Name

data modify storage tmp.bingo:uuid uuid set from entity @s Thrower
kill @s
execute as @a run function bingo:util/match_uuid

execute as @a[tag=bingo.uuid_match, limit=1] run function bingo:lobby/player_settings/save/copy_data_to_config
execute as @a[tag=bingo.uuid_match, limit=1] run tellraw @s {"translate": "bingo.lobby.settings.player.save.new.success", "with": [{"storage": "bingo:player", "nbt": "configurations[-1].name", "interpret": true}]}
tag @a[tag=bingo.uuid_match, limit=1] remove bingo.uuid_match