#> fetchr:lobby/on_skybox_button_pressed
#
# This function is executed during the skybox phase
#
# @within function fetchr:lobby/skybox_tick
# @context
# 	location The location of the button

execute if block ~ ~ ~1 minecraft:red_stained_glass run function fetchr:lobby/join_team/red
execute if block ~ ~ ~1 minecraft:orange_stained_glass run function fetchr:lobby/join_team/orange
execute if block ~ ~ ~1 minecraft:yellow_stained_glass run function fetchr:lobby/join_team/yellow
execute if block ~ ~ ~1 minecraft:lime_stained_glass run function fetchr:lobby/join_team/lime
execute if block ~ ~ ~1 minecraft:green_stained_glass run function fetchr:lobby/join_team/green
execute if block ~ ~ ~1 minecraft:cyan_stained_glass run function fetchr:lobby/join_team/cyan
execute if block ~ ~ ~1 minecraft:light_blue_stained_glass run function fetchr:lobby/join_team/light_blue
execute if block ~ ~ ~1 minecraft:blue_stained_glass run function fetchr:lobby/join_team/blue
execute if block ~ ~ ~1 minecraft:purple_stained_glass run function fetchr:lobby/join_team/purple
execute if block ~ ~ ~1 minecraft:magenta_stained_glass run function fetchr:lobby/join_team/magenta

setblock ~ ~ ~ minecraft:stone_button[facing=north,powered=false]