execute \
	unless entity @a[predicate=fetchr:is_in_game, limit=1] \
	run scoreboard players set $game_state fetchr.state 0

advancement revoke @s only fetchr:exit_mine