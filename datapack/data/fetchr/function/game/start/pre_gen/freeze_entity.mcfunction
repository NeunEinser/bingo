#> fetchr:game/start/pre_gen/freeze_entity
#
# Sets some NBT tags for the current entity and sets the chicken timer score for
# chickens
#
# @context entity The entity to hanlde
# @within function fetchr:game/start/pre_gen/**

execute \
	if entity @s[tag=fetchr.generated_entity] \
	run return 0
execute \
	unless entity @s[type=#fetchr:do_not_forceload] \
	run forceload add ~ ~

tag @s add fetchr.generated_entity
tag @s[nbt={ PersistenceRequired: true }] add fetchr.persistance_required
tag @s[type=minecraft:chicken, nbt={ IsChickenJockey: true }] add fetchr.chicken_jockey
tag @s[nbt={ Invulnerable: true }] add fetchr.invulnerable
execute \
	if entity @s[type=minecraft:item] \
	run data modify entity @s Age set value -32768s
data \
	merge entity @s {\
	NoAI: true,\
	PersistenceRequired: true,\
	IsChickenJockey: true,\
	Invulnerable: true,\
	PickupDelay: 32767s\
}