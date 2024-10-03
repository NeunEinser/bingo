#> fetchr:item_detection/goals/announce_20_no_bingo
#
# Announces a 20 no bingo and plays the goal completed effect for the entire
# team
#
# @within function fetchr:item_detection/goals/bingo/detect_bingo_and_20_no_bingo

tellraw @a ["[", {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger fetchr.menu"}, "hoverEvent":{"action":"show_text", "contents":{"translate": "fetchr.game.menu.hover_text"}}}, "] ", {"translate": "fetchr.goal.20_no_bingo.chat", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=fetchr.in_current_team]"}]}]

# Work around for """WAI""" https://bugs.mojang.com/browse/MC-139625 :mad_neun:
data modify storage tmp.fetchr:item_detection team set from storage fetchr:card teams[-1]

title @a[tag=fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.you"}
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:black"} run title @a[tag=!fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.black"}
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:blue"} run title @a[tag=!fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.blue"}
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:cyan"} run title @a[tag=!fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.cyan"}
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:dark_blue"} run title @a[tag=!fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.dark_blue"}
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:dark_gray"} run title @a[tag=!fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.dark_gray"}
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:dark_red"} run title @a[tag=!fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.dark_red"}
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:gray"} run title @a[tag=!fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.gray"}
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:green"} run title @a[tag=!fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.green"}
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:light_blue"} run title @a[tag=!fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.light_blue"}
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:lime"} run title @a[tag=!fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.lime"}
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:magenta"} run title @a[tag=!fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.magenta"}
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:orange"} run title @a[tag=!fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.orange"}
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:purple"} run title @a[tag=!fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.purple"}
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:red"} run title @a[tag=!fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.red"}
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:white"} run title @a[tag=!fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.white"}
execute if data storage tmp.fetchr:item_detection team{id: "fetchr:yellow"} run title @a[tag=!fetchr.in_current_team] subtitle {"translate": "fetchr.goal.20_no_bingo.subtitle.yellow"}

title @a[tag=fetchr.in_current_team] title {"translate": "fetchr.goal.20_no_bingo.title", "color": "green"}
title @a[tag=!fetchr.in_current_team] title {"translate": "fetchr.goal.20_no_bingo.title", "color": "red"}

execute as @a[tag=fetchr.in_current_team] run function fetchr:item_detection/goals/completed_goal_effects/init
execute as @a[predicate=fetchr:is_in_game] run function fetchr:game/menu/print_without_hint
execute as @a[tag=!fetchr.in_current_team, predicate=fetchr:is_in_game] at @s run playsound minecraft:entity.wither.spawn voice @a ~ ~ ~ 1 1.5