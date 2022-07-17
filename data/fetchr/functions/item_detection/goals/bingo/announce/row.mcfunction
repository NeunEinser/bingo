#> fetchr:item_detection/goals/bingo/announce/row
#
# Announces reaching a bingo in one row
#
# @within function fetchr:item_detection/goals/bingo/detect_bingo_and_20_no_bingo

execute unless score $item_detect/announce.items fetchr.tmp matches 5 run tellraw @a ["[", {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger fetchr.menu"}, "hoverEvent":{"action":"show_text", "contents":{"translate": "fetchr.game.menu.hover_text"}}}, "] ", {"translate": "fetchr.got_bingo.row", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=fetchr.in_current_team]"}, {"score": {"name": "$item_detect/bingo.row", "objective": "fetchr.tmp"}}]}]
execute if score $item_detect/announce.items fetchr.tmp matches 5 run tellraw @a ["[", {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger fetchr.menu"}, "hoverEvent":{"action":"show_text", "contents":{"translate": "fetchr.game.menu.hover_text"}}}, "] ", {"translate": "fetchr.got_sniper_bingo.row", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=fetchr.in_current_team]"}, {"score": {"name": "$item_detect/bingo.row", "objective": "fetchr.tmp"}}]}]

function fetchr:item_detection/goals/completed_goal_effects/init

data modify storage fetchr:card teams[-1].hasBingo set value true