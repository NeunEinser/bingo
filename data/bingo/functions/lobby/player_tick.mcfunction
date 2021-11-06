#> bingo:lobby/player_tick
#
# This function is executed for every player in the lobby every tick
#
# @within function bingo:lobby/tick
# @context entity Current player

# saturation
effect give @s minecraft:saturation 1 255 true

# advanture mode
execute if score $strict_mode bingo.settings matches 1 run gamemode adventure @s[gamemode=survival]

# change preferences
execute unless score @s bingo.pref matches 0 run function bingo:preferences/show
scoreboard players enable @s bingo.card_pos
scoreboard players enable @s bingo.pref

# Float in front of card display
execute at @s align y if block ~ ~1 ~ minecraft:void_air run tp ~ ~1 ~
execute at @s if block ~ ~ ~ minecraft:void_air run effect give @s minecraft:levitation 1 255 true
execute at @s unless block ~ ~ ~ minecraft:void_air run effect clear @s minecraft:levitation

# generate card from seed
execute if score @s bingo.seed matches -2147483648.. unless score @s bingo.seed matches 0 run function bingo:card_generation/generate_from_seed
scoreboard players reset @s bingo.seed
execute unless score $strict_mode bingo.settings matches 1 run scoreboard players enable @s bingo.seed
execute if score @s bingo.operator matches 1 run scoreboard players enable @s bingo.seed

# change settings
execute if score @s bingo.settings matches 21 run scoreboard players set $automatically_pregen bingo.settings 1
execute if score @s bingo.settings matches 22 run scoreboard players set $automatically_pregen bingo.settings 0
scoreboard players reset @s bingo.settings
execute unless score $strict_mode bingo.settings matches 1 run scoreboard players enable @s bingo.settings
execute if score @s bingo.operator matches 1 run scoreboard players enable @s bingo.settings