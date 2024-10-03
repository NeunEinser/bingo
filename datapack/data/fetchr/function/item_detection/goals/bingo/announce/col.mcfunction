#> fetchr:item_detection/goals/bingo/announce/col
#
# Announces reaching a bingo in one column
#
# @within function fetchr:item_detection/goals/bingo/detect_bingo_and_20_no_bingo

execute unless score $item_detect/announce.items fetchr.tmp matches 5 run tellraw @a ["[", {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger fetchr.menu"}, "hoverEvent":{"action":"show_text", "contents":{"translate": "fetchr.game.menu.hover_text"}}}, "] ", {"translate": "fetchr.goal.bingo.col", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=fetchr.in_current_team]"}, {"score": {"name": "$item_detect/bingo.column", "objective": "fetchr.tmp"}}]}]
execute if score $item_detect/announce.items fetchr.tmp matches 5 run tellraw @a ["[", {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger fetchr.menu"}, "hoverEvent":{"action":"show_text", "contents":{"translate": "fetchr.game.menu.hover_text"}}}, "] ", {"translate": "fetchr.goal.bingo.sniper.col", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=fetchr.in_current_team]"}, {"score": {"name": "$item_detect/bingo.column", "objective": "fetchr.tmp"}}]}]

execute as @a[tag=fetchr.in_current_team] run function fetchr:item_detection/goals/completed_goal_effects/init
execute as @a[predicate=fetchr:is_in_game] run function fetchr:game/menu/print_without_hint

data modify storage fetchr:card teams[-1].hasBingo set value true