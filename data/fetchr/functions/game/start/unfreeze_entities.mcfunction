#> fetchr:game/start/unfreeze_entities
#
# Resets stuff set in fetchr:game/start/pre_gen/handle_entities
#
# @context entity The entity to hanlde
# @within function fetchr:game/start/spawn_skybox

kill @s[type=minecraft:item, nbt={Item:{id: "minecraft:egg"}}]
data modify entity @s NoAI set value false
data modify entity @s[tag=!fetchr.persistance_required] PersistenceRequired set value false
execute if entity @s[type=minecraft:chicken] store result entity @s EggLayTime int 1 run scoreboard players get @s fetchr.chicken_timer_cache
scoreboard players reset @s fetchr.chicken_timer_cache