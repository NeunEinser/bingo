data modify storage fetchr:player configurations append value {}
data modify storage fetchr:player configurations[-1].name set from entity @s Item.tag.display.Name

data modify storage tmp.fetchr:uuid uuid set from entity @s Thrower
kill @s
execute as @a run function fetchr:util/match_uuid

execute as @a[tag=fetchr.uuid_match, limit=1] run function fetchr:lobby/player_settings/save/copy_data_to_config
execute as @a[tag=fetchr.uuid_match, limit=1] run tellraw @s {"translate": "fetchr.lobby.settings.player.save.new.success", "with": [{"storage": "fetchr:player", "nbt": "configurations[-1].name", "interpret": true}]}
tag @a[tag=fetchr.uuid_match, limit=1] remove fetchr.uuid_match