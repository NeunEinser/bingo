##by NOPEname

#>
# @internal
#declare tag nope_name.math.uuid
summon minecraft:area_effect_cloud ~ ~ ~ {Tags:["nope_name.math.uuid"]}
execute store result score $seed nn.math.rand run data get entity @e[type=minecraft:area_effect_cloud,tag=nope_name.math.uuid,limit=1] UUID[0]
function nope_name.math:rand/set_seed
kill @e[tag=nope_name.math.uuid]
