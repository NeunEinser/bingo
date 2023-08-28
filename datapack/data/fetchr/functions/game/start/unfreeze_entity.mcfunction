#> fetchr:game/start/unfreeze_entity
#
# Sets some NBT tags for the current entity and sets the chicken timer score for
# chickens
#
# @context entity The entity to hanlde
# @within
# 	function fetchr:game/start/start_game
# 	function fetchr:game/start/pre_gen/unload/unload_chunk

teleport @s[type=!#fetchr:keep_on_game_start, tag=!fetchr.generated_entity] ~ -128 ~
kill @s[type=!#fetchr:keep_on_game_start, tag=!fetchr.generated_entity]

data merge entity @s {NoGravity: false, NoAI: false, PersistenceRequired: false, IsChickenJockey: false, PickupDelay: 0s, Invulnerable: false}
execute if entity @s[tag=fetchr.persistance_required] run data modify entity @s PersistenceRequired set value true
execute if entity @s[type=minecraft:chicken, tag=fetchr.chicken_jockey] run data modify entity @s IsChickenJockey set value true
execute if entity @s[tag=fetchr.invulnerable] run data modify entity @s Invulnerable set value true
execute if entity @s[type=minecraft:item] run data modify entity @s Age set value 0s