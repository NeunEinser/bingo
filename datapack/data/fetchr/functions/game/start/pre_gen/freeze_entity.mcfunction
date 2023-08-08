#> fetchr:game/start/pre_gen/freeze_entity
#
# Sets some NBT tags for the current entity and sets the chicken timer score for
# chickens
#
# @context entity The entity to hanlde
# @within function fetchr:game/start/pre_gen/**

# execute store result score $x fetchr.tmp run data get entity @s Pos[0]
# scoreboard players operation $x fetchr.tmp -= $spawn_x fetchr.state
# execute store result score $z fetchr.tmp run data get entity @s Pos[2]
# scoreboard players operation $z fetchr.tmp -= $spawn_z fetchr.state
# tellraw NeunEinser [{"selector": "@s"}, ": ", {"score": {"name": "$x", "objective": "fetchr.tmp"}}, ", ", {"entity": "@s", "nbt": "Pos[1]"}, ", ", {"score": {"name": "$z", "objective": "fetchr.tmp"}}]

forceload add ~ ~

tag @s add fetchr.generated_entity
tag @s[nbt={PersistenceRequired: true}] add fetchr.persistance_required
tag @s[type=minecraft:chicken, nbt={IsChickenJockey: true}] add fetchr.chicken_jockey
data merge entity @s {NoGravity: true, NoAI: true, PersistenceRequired: true, IsChickenJockey: true}