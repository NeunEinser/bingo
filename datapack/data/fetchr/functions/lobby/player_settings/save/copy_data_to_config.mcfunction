data modify storage fetchr:player configurations[-1].inventory set from entity @s Inventory
data modify storage fetchr:player configurations[-1].effects set value []
data modify storage fetchr:tmp effects set from entity @s ActiveEffects
execute if data storage fetchr:tmp effects[0] run function fetchr:lobby/player_settings/save/copy_effects

effect clear @s
clear @s