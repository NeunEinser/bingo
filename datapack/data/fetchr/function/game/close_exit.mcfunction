
summon minecraft:interaction ~ ~.9 ~ { height: 1.2, width: 1.2 }
summon minecraft:item_display ~-1 ~1.5 ~ { billboard: "center", item: {id:"minecraft:barrier"} }
summon minecraft:item_display ~1 ~1.5 ~ { billboard: "center", item: {id:"minecraft:barrier"} }
summon minecraft:item_display ~ ~1.5 ~-1 { billboard: "center", item: {id:"minecraft:barrier"} }
summon minecraft:item_display ~ ~1.5 ~1 { billboard: "center", item: {id:"minecraft:barrier"} }

tag @s add fetchr.closed_exit
