#> fetchr:item_detection/goals/announce_blackout
#
# Announces a blackout and plays the goal completed effect for the entire team
#
# @within function fetchr:item_detection/announce

tellraw @a ["[", {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger fetchr.menu"}, "hoverEvent":{"action":"show_text", "contents":{"translate": "fetchr.game.menu.hover_text"}}}, "] ", {"translate": "fetchr.got_blackout", "with": [{"storage": "neun_einser.timer:display", "nbt": "\"hh:mm:ss.s\"", "interpret": true}, {"selector": "@a[tag=fetchr.in_current_team]"}]}]
function fetchr:item_detection/goals/completed_goal_effects/init

tag @a[tag=fetchr.in_current_team] add fetchr.spectator