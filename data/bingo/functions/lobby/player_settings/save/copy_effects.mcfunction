data modify storage bingo:player configurations[-1].effects append from storage bingo:tmp effects[0]
data modify storage bingo:player configurations[-1].effects[-1].Duration set value 2147483647
data modify storage bingo:player configurations[-1].effects[-1].ShowParticles set value false
data modify storage bingo:player configurations[-1].effects[-1].ShowIcon set value false

data remove storage bingo:tmp effects[0]

execute if data storage bingo:tmp effects[0] run function bingo:lobby/player_settings/save/copy_effects