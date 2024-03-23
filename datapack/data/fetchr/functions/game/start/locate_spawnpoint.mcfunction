#> fetchr:game/start/locate_spawnpoint
#
# Moves players to the spawnpoint
#
# @internal

scoreboard players set $game_state fetchr.state 1

#NEUN_SCRIPT until 16
#execute if score $pregen_status fetchr.state matches 0 in fetchr:default run function fetchr:game/start/pre_gen/start
#NEUN_SCRIPT end

#NEUN_SCRIPT since 16
execute if score $pregen_status fetchr.state matches 0 in fetchr:default run function fetchr:game/start/pre_gen/start with storage fetchr:card randomSequenceData
#NEUN_SCRIPT end
