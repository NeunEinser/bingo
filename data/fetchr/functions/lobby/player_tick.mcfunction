#> fetchr:lobby/player_tick
#
# This function is executed for every player in the lobby every tick
#
# @within function fetchr:lobby/tick
# @context entity Current player

# saturation
effect give @s minecraft:saturation 2 255 true

# adventure mode
execute if score $strict_mode fetchr.settings matches 1 run gamemode adventure @s[gamemode=survival]

# change preferences
execute unless score @s fetchr.pref matches 0 run function fetchr:preferences/show
scoreboard players enable @s fetchr.pref

# Float in front of card display
execute at @s align y if block ~ ~1 ~ minecraft:void_air run tp ~ ~1 ~
execute at @s if block ~ ~ ~ minecraft:void_air run effect give @s minecraft:levitation 1 255 true
execute at @s unless block ~ ~ ~ minecraft:void_air run effect clear @s minecraft:levitation

# generate card from seed
execute if score @s fetchr.seed matches -2147483648.. unless score @s fetchr.seed matches 0 run function fetchr:card_generation/generate_from_seed
scoreboard players reset @s fetchr.seed
execute unless score $strict_mode fetchr.settings matches 1 run scoreboard players enable @s fetchr.seed
execute if score @s fetchr.operator matches 1 run scoreboard players enable @s fetchr.seed

# change settings
execute if score @s fetchr.settings matches 21 run scoreboard players set $automatically_pregen fetchr.settings 1
execute if score @s fetchr.settings matches 21 run data modify entity @e[type=minecraft:marker, tag=fetchr.sign_automatically_pregen, limit=1] data.Text4 set value '{"translate":"fetchr.lobby.settings.pregen_behavior.sign.off","color":"white"}'
execute if score @s fetchr.settings matches 22 run scoreboard players set $automatically_pregen fetchr.settings 0
execute if score @s fetchr.settings matches 22 run data modify entity @e[type=minecraft:marker, tag=fetchr.sign_automatically_pregen, limit=1] data.Text4 set value '{"translate":"fetchr.lobby.settings.pregen_behavior.sign.on","color":"white"}'
execute if score @s fetchr.settings matches 21..22 run function fetchr:lobby/settings/change_pregen_behavior
scoreboard players reset @s fetchr.settings
execute unless score $strict_mode fetchr.settings matches 1 run scoreboard players enable @s fetchr.settings
execute if score @s fetchr.operator matches 1 run scoreboard players enable @s fetchr.settings