#> bingo:item_detection/goals/completed_goal_effects
#
# Plays the goal completed effect for @s
#
# @within function bingo:item_detection/goals/**
# @context
# 	entity Player for whom to play the effects
# 	position @s

playsound minecraft:entity.player.levelup voice @s ~ ~ ~ 1 0.95

summon minecraft:firework_rocket ~2 ~4 ~ {LifeTime:30,FireworksItem:{id:"minecraft:firework_rocket", Count:1b ,tag:{Fireworks:{Flight:3b, Explosions:[{Type:1b, Flicker:false, Trail:false, Colors:[I;16713728],FadeColors:[I;16713728]},{Type:false, Flicker:false, Trail:false, Colors:[I;8302899],FadeColors:[I;8302899]}]}}}}

summon minecraft:firework_rocket ~-2 ~4 ~2 {LifeTime:20,FireworksItem:{id:"minecraft:firework_rocket", Count:1b ,tag:{Fireworks:{Flight:3b, Explosions:[{Type:2b, Flicker:false, Trail:false, Colors:[I;16750848],FadeColors:[I;16750848]}]}}}}

summon minecraft:firework_rocket ~2 ~4 ~2 {LifeTime:23,FireworksItem:{id:"minecraft:firework_rocket", Count:1b ,tag:{Fireworks:{Flight:2b, Explosions:[{Type:2b, Flicker:false, Trail:false, Colors:[I;1279],FadeColors:[I;1279]}]}}}}

function bingo:game/bingo_menu/print_without_hint
