#> fetchr:item_detection/special/detect_blue_trimmed_leather_boots
#
# Detects all variants of blue trimmed leather boots.
#
# @within function fetchr:init/fill_registries
# @context
# 	entity The player to check

#NEUN_SCRIPT since 33 until 39
execute if items entity @s container.* minecraft:leather_boots[minecraft:trim={pattern:"minecraft:coast",material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1
execute if items entity @s container.* minecraft:leather_boots[minecraft:trim={pattern:"minecraft:dune",material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1
execute if items entity @s container.* minecraft:leather_boots[minecraft:trim={pattern:"minecraft:eye",material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1
execute if items entity @s container.* minecraft:leather_boots[minecraft:trim={pattern:"minecraft:host",material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1
execute if items entity @s container.* minecraft:leather_boots[minecraft:trim={pattern:"minecraft:raiser",material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1
execute if items entity @s container.* minecraft:leather_boots[minecraft:trim={pattern:"minecraft:rib",material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1
execute if items entity @s container.* minecraft:leather_boots[minecraft:trim={pattern:"minecraft:sentry",material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1
execute if items entity @s container.* minecraft:leather_boots[minecraft:trim={pattern:"minecraft:shaper",material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1
execute if items entity @s container.* minecraft:leather_boots[minecraft:trim={pattern:"minecraft:silence",material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1
execute if items entity @s container.* minecraft:leather_boots[minecraft:trim={pattern:"minecraft:snout",material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1
execute if items entity @s container.* minecraft:leather_boots[minecraft:trim={pattern:"minecraft:spire",material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1
execute if items entity @s container.* minecraft:leather_boots[minecraft:trim={pattern:"minecraft:tide",material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1
execute if items entity @s container.* minecraft:leather_boots[minecraft:trim={pattern:"minecraft:vex",material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1
execute if items entity @s container.* minecraft:leather_boots[minecraft:trim={pattern:"minecraft:ward",material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1
execute if items entity @s container.* minecraft:leather_boots[minecraft:trim={pattern:"minecraft:wayfinder",material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1
execute if items entity @s container.* minecraft:leather_boots[minecraft:trim={pattern:"minecraft:wild",material:"minecraft:lapis"}] run scoreboard players set @s fetchr.has_item 1
