#> fetchr:lobby/player_tick
#
# This function is executed for every player in the lobby every tick
#
# @within function fetchr:lobby/tick
# @context entity Current player

# saturation
effect give @s minecraft:saturation 2 255 true

# adventure mode
#NEUN_SCRIPT unless realms
execute if score $is_multiplayer fetchr.state matches 1 if score $lobby_gamemode fetchr.settings matches 0 run gamemode adventure @s[gamemode=survival]
execute if score $is_multiplayer fetchr.state matches 1 if score $lobby_gamemode fetchr.settings matches 1 run gamemode survival @s[gamemode=adventure]
execute if score $is_multiplayer fetchr.state matches 0 run gamemode survival @s[gamemode=adventure]
#NEUN_SCRIPT end

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
execute unless score $operator_only fetchr.settings matches 1 run scoreboard players enable @s fetchr.seed
execute if score @s fetchr.operator matches 1 run scoreboard players enable @s fetchr.seed

# teleport all
execute if score @s fetchr.teleport_all matches 1 run function fetchr:lobby/teleport_all

# change settings
execute if score @s fetchr.pre_gen_radius matches 1.. run function fetchr:lobby/settings/set_pre_gen_radius_internal
execute if score @s fetchr.pre_gen_radius matches 1.. run scoreboard players reset @s fetchr.pre_gen_radius

execute if score @s fetchr.update_hud matches 1 run function fetchr:custom_hud/components/timer/update