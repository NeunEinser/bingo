#> fetchr:game/skybox/tick
#
# This function is executed during the skybox phase
#
# @within function fetchr:tick/tick

execute at @e[type=minecraft:marker, tag=fetchr.skybox_button, distance=..13] if block ~ ~ ~ minecraft:stone_button[powered=true] run function fetchr:game/skybox/button_pressed

execute as @a[predicate=fetchr:is_in_game] at @s align y if block ~ ~ ~ minecraft:void_air run tp ~ ~1.2 ~
#NEUN_SCRIPT until 30
#execute as @a[predicate=fetchr:is_in_game] at @s if block ~ ~-1 ~ minecraft:void_air run effect give @s minecraft:levitation 1 255 true
#execute as @a[predicate=fetchr:is_in_game] at @s unless block ~ ~-1 ~ minecraft:void_air run effect clear @s minecraft:levitation
#NEUN_SCRIPT end
#NEUN_SCRIPT since 31
execute as @a[predicate=fetchr:is_in_game] at @s align y if block ~ ~-1 ~ minecraft:void_air unless entity @s[distance=...01] run tp ~ ~.2 ~
execute as @a[predicate=fetchr:is_in_game] at @s align y if block ~ ~-1 ~-1 minecraft:void_air run tp ~ ~ ~
execute as @a[predicate=fetchr:is_in_game] at @s if block ~ ~-1 ~ minecraft:void_air run attribute @s generic.gravity base set 0
execute as @a[predicate=fetchr:is_in_game] at @s if block ~ ~-1 ~-1 minecraft:void_air run attribute @s generic.gravity base set 0
execute as @a[predicate=fetchr:is_in_game] at @s unless block ~ ~-1 ~ minecraft:void_air unless block ~ ~-1 ~-1 minecraft:void_air run attribute @s generic.gravity base set 0.08
#NEUN_SCRIPT end

#NEUN_SCRIPT since 25
execute unless entity @a[team=fetchr.black] run scoreboard players reset $black
execute unless entity @a[team=fetchr.blue] run scoreboard players reset $blue
execute unless entity @a[team=fetchr.cyan] run scoreboard players reset $cyan
execute unless entity @a[team=fetchr.dark_blue] run scoreboard players reset $dark_blue
execute unless entity @a[team=fetchr.dark_gray] run scoreboard players reset $dark_gray
execute unless entity @a[team=fetchr.dark_red] run scoreboard players reset $dark_red
execute unless entity @a[team=fetchr.gray] run scoreboard players reset $gray
execute unless entity @a[team=fetchr.green] run scoreboard players reset $green
execute unless entity @a[team=fetchr.light_blue] run scoreboard players reset $light_blue
execute unless entity @a[team=fetchr.lime] run scoreboard players reset $lime
execute unless entity @a[team=fetchr.magenta] run scoreboard players reset $magenta
execute unless entity @a[team=fetchr.orange] run scoreboard players reset $orange
execute unless entity @a[team=fetchr.purple] run scoreboard players reset $purple
execute unless entity @a[team=fetchr.red] run scoreboard players reset $red
execute unless entity @a[team=fetchr.white] run scoreboard players reset $white
execute unless entity @a[team=fetchr.yellow] run scoreboard players reset $yellow

execute if entity @a[team=fetchr.black] run function fetchr:game/skybox/setup_team_display/black
execute if entity @a[team=fetchr.blue] run function fetchr:game/skybox/setup_team_display/blue
execute if entity @a[team=fetchr.cyan] run function fetchr:game/skybox/setup_team_display/cyan
execute if entity @a[team=fetchr.dark_blue] run function fetchr:game/skybox/setup_team_display/dark_blue
execute if entity @a[team=fetchr.dark_gray] run function fetchr:game/skybox/setup_team_display/dark_gray
execute if entity @a[team=fetchr.dark_red] run function fetchr:game/skybox/setup_team_display/dark_red
execute if entity @a[team=fetchr.gray] run function fetchr:game/skybox/setup_team_display/gray
execute if entity @a[team=fetchr.green] run function fetchr:game/skybox/setup_team_display/green
execute if entity @a[team=fetchr.light_blue] run function fetchr:game/skybox/setup_team_display/light_blue
execute if entity @a[team=fetchr.lime] run function fetchr:game/skybox/setup_team_display/lime
execute if entity @a[team=fetchr.magenta] run function fetchr:game/skybox/setup_team_display/magenta
execute if entity @a[team=fetchr.orange] run function fetchr:game/skybox/setup_team_display/orange
execute if entity @a[team=fetchr.purple] run function fetchr:game/skybox/setup_team_display/purple
execute if entity @a[team=fetchr.red] run function fetchr:game/skybox/setup_team_display/red
execute if entity @a[team=fetchr.white] run function fetchr:game/skybox/setup_team_display/white
execute if entity @a[team=fetchr.yellow] run function fetchr:game/skybox/setup_team_display/yellow
#NEUN_SCRIPT end

particle minecraft:happy_villager ~ ~-63 ~ .125 16 .125 1 16 force
particle minecraft:happy_villager ~ ~-31 ~ .125 8 .125 1 8 force
particle minecraft:happy_villager ~ ~-15 ~ .125 4 .125 1 4 force
particle minecraft:happy_villager ~ ~-7 ~ .125 2 .125 1 2 force
particle minecraft:happy_villager ~ ~-3 ~ .125 1 .125 1 1 force

scoreboard players set $card_frames.count fetchr.io 0
execute positioned ~-2 ~-1 ~-7.49 as @e[type=minecraft:item_frame, tag=fetchr.card_frame, dx=5, dy=5, dz=.1] at @s run function fetchr:card_frames/check_item
execute if score $card_frames.count fetchr.io matches ..24 run function fetchr:card_frames/spawn
