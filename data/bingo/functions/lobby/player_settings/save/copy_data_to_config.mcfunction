data modify storage bingo:player configurations[-1].inventory set from entity @s Inventory
data modify storage bingo:player configurations[-1].effects set value []
data modify storage bingo:tmp effects set from entity @s ActiveEffects
execute if data storage bingo:tmp effects[0] run function bingo:lobby/player_settings/save/copy_effects

effect clear @s
clear @s