data modify storage fetchr:player configurations[-1].effects append from storage fetchr:tmp effects[0]
data modify storage fetchr:player configurations[-1].effects[-1].Duration set value 2147483647
data modify storage fetchr:player configurations[-1].effects[-1].ShowParticles set value false
data modify storage fetchr:player configurations[-1].effects[-1].ShowIcon set value false

data remove storage fetchr:tmp effects[0]

execute if data storage fetchr:tmp effects[0] run function fetchr:lobby/player_settings/save/copy_effects