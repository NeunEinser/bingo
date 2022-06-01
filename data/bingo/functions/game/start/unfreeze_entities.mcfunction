#> bingo:game/start/unfreeze_entities
#
# Resets stuff set in bingo:game/start/pre_gen/handle_entities
#
# @context entity The entity to hanlde
# @within function bingo:game/start/spawn_skybox

kill @s[type=minecraft:item, nbt={Item:{id: "minecraft:egg"}}]
data modify entity @s NoAI set value false
data modify entity @s[tag=!bingo.persistance_required] PersistenceRequired set value false
execute if entity @s[type=minecraft:chicken] store result entity @s EggLayTime int 1 run scoreboard players get @s bingo.chicken
scoreboard players reset @s bingo.chicken