#> fetchr:item_detection/goals/announce_20_no_bingo
#
# Announces a 20 no bingo and plays the goal completed effect for the entire
# team
#
# @within function fetchr:item_detection/goals/bingo/detect_bingo_and_20_no_bingo

tellraw @a ["[", {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger fetchr.menu"}, "hoverEvent":{"action":"show_text", "contents":{"translate": "fetchr.game.menu.hover_text"}}}, "] ", {"translate": "fetchr.got_20_no_bingo", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=fetchr.in_current_team]"}]}]
execute as @a[tag=fetchr.in_current_team] run function fetchr:item_detection/goals/completed_goal_effects/init