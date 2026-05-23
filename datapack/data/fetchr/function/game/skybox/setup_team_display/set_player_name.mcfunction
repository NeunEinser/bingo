#> fetchr:game/skybox/setup_team_display/set_team_name
#
# Sets the team name to the name of @s
#
# @within function fetchr:game/skybox/setup_team_display/*

#NEUN_SCRIPT until 69
#summon minecraft:item ~ ~ ~ { Item: { id: "minecraft:player_head" }, Tags: ["fetchr.player_head"] }

#item modify entity @e[type=minecraft:item, tag=fetchr.player_head,distance=...1, limit=1] contents { function:"fill_player_head", entity: "this" }

#data remove storage tmp.fetchr:skybox team_name.translate
#data \
	modify storage tmp.fetchr:skybox team_name.text \
	set from entity @e[type=minecraft:item, tag=fetchr.player_head, distance=...1, limit=1] Item.components.minecraft:profile.name

#kill @e[type=minecraft:item, tag=fetchr.player_head, distance=...1, limit=1]
#NEUN_SCRIPT end