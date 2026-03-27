

execute \
	as @e[tag=fetchr.mine_exit,distance=...1] \
	unless entity @s[tag=fetchr.closed_exit] \
	run function fetchr:game/close_exit

execute \
	if entity @s[tag=fetchr.exit_barrel_open] \
	run function fetchr:game/check_barrels