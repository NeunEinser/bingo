#> fetchr:game/start/locate_spawnpoint
#
# Moves players to the spawnpoint
#
# @internal

#>
# Spawnpoint x coordinate
# @within function fetchr:game/start/**
#declare score_holder $game/start.spawnx
#>
# Spawnpoint z coordinate
# @within function fetchr:game/start/**
#declare score_holder $game/start.spawnz
#>
# Tag used for the aec which is moved to the random spawn coordinates
# @private
#declare tag fetchr.spawn_position

gamerule doDaylightCycle false
time set 0

# Spawn x: $result & 0xFFFF (signed)
execute store result score $game/start.spawnx fetchr.tmp run data get storage fetchr:card spawnLocation
scoreboard players operation $game/start.spawnx fetchr.tmp %= 65536 fetchr.const
execute if score $game/start.spawnx fetchr.tmp matches 32768.. run scoreboard players remove $game/start.spawnx fetchr.tmp 65536

#Spawn z: $result >> 16
execute store result score $game/start.spawnz fetchr.tmp run data get storage fetchr:card spawnLocation
scoreboard players operation $game/start.spawnz fetchr.tmp /= 65536 fetchr.const

execute if score $pregen_status fetchr.state matches 0 in fetchr:default run function fetchr:game/start/move_x/0