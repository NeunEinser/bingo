#> fetchr:game/skybox/tick
#
# This function is executed during the skybox phase
#
# @within function fetchr:tick/tick

execute \
	as @a[predicate=fetchr:is_in_game] \
	at @s \
	run function #fetchr:spawn_preview/player_tick

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


execute \
	store result score $skybox.black_player_count fetchr.tmp \
	if entity @a[team=fetchr.black]
execute \
	store result score $skybox.blue_player_count fetchr.tmp \
	if entity @a[team=fetchr.blue]
execute \
	store result score $skybox.cyan_player_count fetchr.tmp \
	if entity @a[team=fetchr.cyan]
execute \
	store result score $skybox.dark_blue_player_count fetchr.tmp \
	if entity @a[team=fetchr.dark_blue]
execute \
	store result score $skybox.dark_gray_player_count fetchr.tmp \
	if entity @a[team=fetchr.dark_gray]
execute \
	store result score $skybox.dark_red_player_count fetchr.tmp \
	if entity @a[team=fetchr.dark_red]
execute \
	store result score $skybox.gray_player_count fetchr.tmp \
	if entity @a[team=fetchr.gray]
execute \
	store result score $skybox.green_player_count fetchr.tmp \
	if entity @a[team=fetchr.green]
execute \
	store result score $skybox.light_blue_player_count fetchr.tmp \
	if entity @a[team=fetchr.light_blue]
execute \
	store result score $skybox.lime_player_count fetchr.tmp \
	if entity @a[team=fetchr.lime]
execute \
	store result score $skybox.magenta_player_count fetchr.tmp \
	if entity @a[team=fetchr.magenta]
execute \
	store result score $skybox.orange_player_count fetchr.tmp \
	if entity @a[team=fetchr.orange]
execute \
	store result score $skybox.purple_player_count fetchr.tmp \
	if entity @a[team=fetchr.purple]
execute \
	store result score $skybox.red_player_count fetchr.tmp \
	if entity @a[team=fetchr.red]
execute \
	store result score $skybox.white_player_count fetchr.tmp \
	if entity @a[team=fetchr.white]
execute \
	store result score $skybox.yellow_player_count fetchr.tmp \
	if entity @a[team=fetchr.yellow]

execute \
	unless score $skybox.black_player_count fetchr.tmp = $black_player_count fetchr.state \
	as @a[team=fetchr.black,limit=1] \
	run function fetchr:game/skybox/setup_team_display/black
execute \
	unless score $skybox.blue_player_count fetchr.tmp = $blue_player_count fetchr.state \
	as @a[team=fetchr.blue,limit=1] \
	run function fetchr:game/skybox/setup_team_display/blue
execute \
	unless score $skybox.cyan_player_count fetchr.tmp = $cyan_player_count fetchr.state \
	as @a[team=fetchr.cyan,limit=1] \
	run function fetchr:game/skybox/setup_team_display/cyan
execute \
	unless score $skybox.dark_blue_player_count fetchr.tmp = $dark_blue_player_count fetchr.state \
	as @a[team=fetchr.dark_blue,limit=1] \
	run function fetchr:game/skybox/setup_team_display/dark_blue
execute \
	unless score $skybox.dark_gray_player_count fetchr.tmp = $dark_gray_player_count fetchr.state \
	as @a[team=fetchr.dark_gray,limit=1] \
	run function fetchr:game/skybox/setup_team_display/dark_gray
execute \
	unless score $skybox.dark_red_player_count fetchr.tmp = $dark_red_player_count fetchr.state \
	as @a[team=fetchr.dark_red,limit=1] \
	run function fetchr:game/skybox/setup_team_display/dark_red
execute \
	unless score $skybox.gray_player_count fetchr.tmp = $gray_player_count fetchr.state \
	as @a[team=fetchr.gray,limit=1] \
	run function fetchr:game/skybox/setup_team_display/gray
execute \
	unless score $skybox.green_player_count fetchr.tmp = $green_player_count fetchr.state \
	as @a[team=fetchr.green,limit=1] \
	run function fetchr:game/skybox/setup_team_display/green
execute \
	unless score $skybox.light_blue_player_count fetchr.tmp = $light_blue_player_count fetchr.state \
	as @a[team=fetchr.light_blue,limit=1] \
	run function fetchr:game/skybox/setup_team_display/light_blue
execute \
	unless score $skybox.lime_player_count fetchr.tmp = $lime_player_count fetchr.state \
	as @a[team=fetchr.lime,limit=1] \
	run function fetchr:game/skybox/setup_team_display/lime
execute \
	unless score $skybox.magenta_player_count fetchr.tmp = $magenta_player_count fetchr.state \
	as @a[team=fetchr.magenta,limit=1] \
	run function fetchr:game/skybox/setup_team_display/magenta
execute \
	unless score $skybox.orange_player_count fetchr.tmp = $orange_player_count fetchr.state \
	as @a[team=fetchr.orange,limit=1] \
	run function fetchr:game/skybox/setup_team_display/orange
execute \
	unless score $skybox.purple_player_count fetchr.tmp = $purple_player_count fetchr.state \
	as @a[team=fetchr.purple,limit=1] \
	run function fetchr:game/skybox/setup_team_display/purple
execute \
	unless score $skybox.red_player_count fetchr.tmp = $red_player_count fetchr.state \
	as @a[team=fetchr.red,limit=1] \
	run function fetchr:game/skybox/setup_team_display/red
execute \
	unless score $skybox.white_player_count fetchr.tmp = $white_player_count fetchr.state \
	as @a[team=fetchr.white,limit=1] \
	run function fetchr:game/skybox/setup_team_display/white
execute \
	unless score $skybox.yellow_player_count fetchr.tmp = $yellow_player_count fetchr.state \
	as @a[team=fetchr.yellow,limit=1] \
	run function fetchr:game/skybox/setup_team_display/yellow

scoreboard players operation $black_player_count fetchr.state = $skybox.black_player_count fetchr.tmp
scoreboard players operation $blue_player_count fetchr.state = $skybox.blue_player_count fetchr.tmp
scoreboard players operation $cyan_player_count fetchr.state = $skybox.cyan_player_count fetchr.tmp
scoreboard players operation $dark_blue_player_count fetchr.state = $skybox.dark_blue_player_count fetchr.tmp
scoreboard players operation $dark_gray_player_count fetchr.state = $skybox.dark_gray_player_count fetchr.tmp
scoreboard players operation $dark_red_player_count fetchr.state = $skybox.dark_red_player_count fetchr.tmp
scoreboard players operation $gray_player_count fetchr.state = $skybox.gray_player_count fetchr.tmp
scoreboard players operation $green_player_count fetchr.state = $skybox.green_player_count fetchr.tmp
scoreboard players operation $light_blue_player_count fetchr.state = $skybox.light_blue_player_count fetchr.tmp
scoreboard players operation $lime_player_count fetchr.state = $skybox.lime_player_count fetchr.tmp
scoreboard players operation $magenta_player_count fetchr.state = $skybox.magenta_player_count fetchr.tmp
scoreboard players operation $orange_player_count fetchr.state = $skybox.orange_player_count fetchr.tmp
scoreboard players operation $purple_player_count fetchr.state = $skybox.purple_player_count fetchr.tmp
scoreboard players operation $red_player_count fetchr.state = $skybox.red_player_count fetchr.tmp
scoreboard players operation $white_player_count fetchr.state = $skybox.white_player_count fetchr.tmp
scoreboard players operation $yellow_player_count fetchr.state = $skybox.yellow_player_count fetchr.tmp

particle minecraft:happy_villager ~ ~-63 ~ .125 16 .125 1 16 force
particle minecraft:happy_villager ~ ~-31 ~ .125 8 .125 1 8 force
particle minecraft:happy_villager ~ ~-15 ~ .125 4 .125 1 4 force
particle minecraft:happy_villager ~ ~-7 ~ .125 2 .125 1 2 force
particle minecraft:happy_villager ~ ~-3 ~ .125 1 .125 1 1 force

scoreboard players set $card_frames.count fetchr.io 0
execute \
	positioned ~-2 ~-1 ~-7.49 \
	as @e[type=minecraft:item_frame, tag=fetchr.card_frame, dx=5, dy=5, dz=.1] \
	at @s \
	run function fetchr:card_frames/check_item
execute \
	if score $card_frames.count fetchr.io matches ..24 \
	run function fetchr:card_frames/spawn