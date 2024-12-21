#> fetchr:game/black_skybox
#
# Blacks the skybox
#
# @within function fetchr:game/end

fill ~-9 ~-2 ~-9 ~10 ~5 ~10 minecraft:black_concrete outline
setblock ~ ~-2 ~ minecraft:sea_lantern
tag @s remove fetchr.spawn
tag @s add fetchr.old_spawn
kill @e[type=minecraft:item_display, distance=..1, limit=1]
forceload add ~ ~