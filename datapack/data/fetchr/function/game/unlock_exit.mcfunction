
tellraw @a [{translate: "fetchr.mine_exit_opened", with:[{selector:"@s"}]}]
execute \
	as @a \
	at @s \
	run playsound minecraft:entity.player.levelup voice @s

tag @e[type=minecraft:marker, tag=fetchr.mine_exit, distance=...1] add fetchr.unlocked_exit
execute \
	as @e[type=minecraft:marker, tag=fetchr.mine_exit, distance=...1] \
	run function fetchr:game/open_exit