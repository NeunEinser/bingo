#> fetchr:game/skybox/button_pressed
#
# This function is executed during the skybox phase
#
# @within function fetchr:game/skybox/tick
# @context
# 	location The location of the button

execute if block ~ ~ ~1 minecraft:red_stained_glass as @p[tag=fetchr.pressed_button] run function fetchr:game/skybox/join_team/red
execute if block ~ ~ ~1 minecraft:orange_stained_glass as @p[tag=fetchr.pressed_button] run function fetchr:game/skybox/join_team/orange
execute if block ~ ~ ~1 minecraft:yellow_stained_glass as @p[tag=fetchr.pressed_button] run function fetchr:game/skybox/join_team/yellow
execute if block ~ ~ ~1 minecraft:lime_stained_glass as @p[tag=fetchr.pressed_button] run function fetchr:game/skybox/join_team/lime
execute if block ~ ~ ~1 minecraft:green_stained_glass as @p[tag=fetchr.pressed_button] run function fetchr:game/skybox/join_team/green
execute if block ~ ~ ~1 minecraft:cyan_stained_glass as @p[tag=fetchr.pressed_button] run function fetchr:game/skybox/join_team/cyan
execute if block ~ ~ ~1 minecraft:light_blue_stained_glass as @p[tag=fetchr.pressed_button] run function fetchr:game/skybox/join_team/light_blue
execute if block ~ ~ ~1 minecraft:blue_stained_glass as @p[tag=fetchr.pressed_button] run function fetchr:game/skybox/join_team/blue
execute if block ~ ~ ~1 minecraft:purple_stained_glass as @p[tag=fetchr.pressed_button] run function fetchr:game/skybox/join_team/purple
execute if block ~ ~ ~1 minecraft:magenta_stained_glass as @p[tag=fetchr.pressed_button] run function fetchr:game/skybox/join_team/magenta

setblock ~ ~ ~ minecraft:stone_button[facing=north,powered=false]