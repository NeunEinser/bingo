#> bingo:game/start/pre_gen/handle_entities
#
# Sets some NBT tags for the current entity and sets the chicken timer score for
# chickens
#
# @context entity The entity to hanlde
# @within function bingo:game/start/pre_gen/generate_chunks_without_lag

tag @s[nbt={PersistenceRequired: true}] add bingo.persistance_required
data merge entity @s {NoAI: true, PersistenceRequired: true}
execute if entity @s[type=minecraft:chicken] store result score @s bingo.chicken run data get entity @s EggLayTime