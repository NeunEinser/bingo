#> fetchr:game/menu/print_with_hint
#
# Display the menu options and hint to @s and reset the trigger
#
# @internal
# @context
# 	entity The player to whom to display the menu options and hint

function fetchr:game/menu/print_without_hint
tellraw @s {"translate": "%1162888552$s%1$s", "with": [["", {"text": "Hint: You can click", "color": "gray", "italic": true}, " [", {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger fetchr.menu"}, "hoverEvent":{"action":"show_text", "contents":"Fetchr Menu"}}, "] ", {"text": "anywhere to bring up the Fetchr menu. You may also run ", "color": "gray", "italic": true}, {"text": "/trigger fetchr.<action>", "color": "white", "clickEvent": {"action": "suggest_command", "value": "/trigger fetchr."}}, {"text":" manually, replacing ", "color":"gray", "italic":true}, "<action>", {"text":" with the auto-completable action.", "color":"gray", "italic":true}], [{"translate": "fetchr.game.menu.hint", "color": "gray", "italic": true, "with": [[{"text":"[", "color":"white", "italic":false}, {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger fetchr.menu"}, "hoverEvent":{"action":"show_text", "contents":{"translate": "fetchr.game.menu.hover_text"}}}, "]"], {"text":"/trigger fetchr.<", "color":"white", "italic":false, "clickEvent":{"action":"suggest_command", "value":"/trigger fetchr."}, "extra":[{"translate": "fetchr.game.menu.hint.action_param"}, ">"]}, [{"text":"<", "color":"white", "italic":false}, {"translate": "fetchr.game.menu.hint.action_param"}, ">"]]}]]}