#> fetchr:game/start/pre_gen/entities/process_entity
#
# Sets some NBT tags for the current entity and sets the chicken timer score for
# chickens
#
# @context entity The entity to hanlde
# @within function fetchr:game/start/pre_gen/entities/process_entities

tag @s add fetchr.generated_entity
tag @s[nbt={PersistenceRequired: true}] add fetchr.persistance_required
tag @s[type=minecraft:chicken, nbt={IsChickenJockey: true}] add fetchr.chicken_jockey
data merge entity @s {NoAI: true, PersistenceRequired: true, IsChickenJockey: true}