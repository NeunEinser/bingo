#> fetchr:game/menu/print_with_hint
#
# Display the menu options and hint to @s and reset the trigger
#
# @internal
# @context
# 	entity The player to whom to display the menu options and hint

function fetchr:game/menu/print_without_hint
tellraw @s {"translate": "fetchr.game.menu.hint", "fallback": "Hint: You can click %s anywhere to bring up the Fetchr menu. You may also run %s manually, replacing %s with the auto-completable action.", "color": "gray", "italic": true, "with": [[{"text":"[", "color":"white", "italic":false}, {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger fetchr.menu"}, "hoverEvent":{"action":"show_text", "contents":{"translate": "fetchr.game.menu.hover_text", "fallback": "Fetchr Menu"}}}, "]"], {"text":"/trigger fetchr.<", "color":"white", "italic":false, "clickEvent":{"action":"suggest_command", "value":"/trigger fetchr."}, "extra":[{"translate": "fetchr.game.menu.hint.action_param", "fallback": "fetchr.game.menu.hint.action_param"}, ">"]}, [{"text":"<", "color":"white", "italic":false}, {"translate": "fetchr.game.menu.hint.action_param", "fallback": "fetchr.game.menu.hint.action_param"}, ">"]]}