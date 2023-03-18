execute store result score $slot fetchr.tmp run data get storage fetchr:tmp playerConfigs[0].inventory[0].Slot

data modify storage fetchr:tmp playerConfigs[0].inventory[0].Slot set value 0b
tellraw @a {"storage": "fetchr:tmp", "nbt": "playerConfigs[0].inventory[0]"}
data modify block 0 63 0 Items[0] set from storage fetchr:tmp playerConfigs[0].inventory[0]
function fetchr:lobby/player_settings/load/copy_inventory_slot

data remove storage fetchr:tmp playerConfigs[0].inventory[0]
execute if data storage fetchr:tmp playerConfigs[0].inventory[0] run function fetchr:lobby/player_settings/load/copy_inventory