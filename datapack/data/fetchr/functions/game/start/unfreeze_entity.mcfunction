#> fetchr:game/start/unfreeze_entity
#
# Sets some NBT tags for the current entity and sets the chicken timer score for
# chickens
#
# @context entity The entity to hanlde
# @within function fetchr:game/start/start_game

data merge entity @s {NoAI: false, PersistenceRequired: false, IsChickenJockey: false}
execute if entity @s[tag=fetchr.persistance_required] run data modify entity @s PersistenceRequired set value true
execute if entity @s[type=minecraft:chicken, tag=fetchr.chicken_jockey] run data modify entity @s IsChickenJockey set value true