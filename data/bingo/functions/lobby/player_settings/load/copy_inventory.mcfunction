execute store result score $slot bingo_tmp run data get storage bingo:tmp playerConfigs[0].inventory[0].Slot

data modify storage bingo:tmp playerConfigs[0].inventory[0].Slot set value 0b
tellraw @a {"storage": "bingo:tmp", "nbt": "playerConfigs[0].inventory[0]"}
data modify block 0 63 0 Items[0] set from storage bingo:tmp playerConfigs[0].inventory[0]
function bingo:lobby/player_settings/load/copy_inventory_slot

data remove storage bingo:tmp playerConfigs[0].inventory[0]
execute if data storage bingo:tmp playerConfigs[0].inventory[0] run function bingo:lobby/player_settings/load/copy_inventory