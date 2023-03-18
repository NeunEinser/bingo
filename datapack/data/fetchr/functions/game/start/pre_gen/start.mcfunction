#> fetchr:game/start/pre_gen/start
#
# Starts the pre-generation of chunks
#
# @within
# 	function fetchr:game/start/move_z/f

#>
# The marker cloud used to mark the current last pre-generated line of chunks.
#
# @within function fetchr:game/start/pre_gen/*
# @within function fetchr:game/start/spawn_skybox
#declare tag fetchr.spawn

kill @e[type=minecraft:marker, tag=fetchr.spawn, distance=..0.1]
summon minecraft:marker ~ ~ ~ {Tags: ["fetchr.spawn"]}
execute as @e[type=minecraft:marker, tag=fetchr.spawn, distance=..0.1, limit=1] run function fetchr:game/start/pre_gen/initialize
execute unless entity @e[type=minecraft:marker, tag=fetchr.spawn, distance=..0.1, limit=1] run forceload add ~-16 ~-16 ~16 ~16
execute unless entity @e[type=minecraft:marker, tag=fetchr.spawn, distance=..0.1, limit=1] run schedule function fetchr:game/start/locate_spawnpoint 1t replace
