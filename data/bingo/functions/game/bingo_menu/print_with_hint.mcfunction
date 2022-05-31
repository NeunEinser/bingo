#> bingo:game/bingo_menu/print_with_hint
#
# Display the bingo menu options and hint to @s and reset the trigger
#
# @internal
# @context
# 	entity The player to whom to display the menu options and hint

function bingo:game/bingo_menu/print_without_hint
tellraw @s {"translate": "%1074992263$s%1$s", "with": [["", {"text": "Hint: You can click", "color": "gray", "italic": true}, " [", {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger bingo.menu"}, "hoverEvent":{"action":"show_text", "contents":"Bingo Menu"}}, "] ", {"text": "anywhere to bring up the bingo menu. You may also run ", "color": "gray", "italic": true}, {"text": "/trigger bingo.<action>", "color": "white", "clickEvent": {"action": "suggest_command", "value": "/trigger bingo."}}, {"text":" manually, replacing ", "color":"gray", "italic":true}, "<action>", {"text":" with the auto-completable action.", "color":"gray", "italic":true}], [{"translate": "bingo.game.menu.hint", "color": "gray", "italic": true, "with": [[{"text":"[", "color":"white", "italic":false}, {"text":"≡", "color":"#00c3ff", "clickEvent":{"action":"run_command", "value":"/trigger bingo.menu"}, "hoverEvent":{"action":"show_text", "contents":{"translate":"bingo.game.menu.hover_text"}}}, "]"], {"text":"/trigger bingo.<", "color":"white", "italic":false, "clickEvent":{"action":"suggest_command", "value":"/trigger bingo."}, "extra":[{"translate":"bingo.game.menu.hint.action_param"}, ">"]}, [{"text":"<", "color":"white", "italic":false}, {"translate":"bingo.game.menu.hint.action_param"}, ">"]]}]]}