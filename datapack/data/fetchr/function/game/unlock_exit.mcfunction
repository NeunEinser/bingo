
tellraw @a [{translate: "fetchr.mine_exit_opened", with:[{selector:"@s"}]}]
execute \
	as @a \
	at @s \
	run playsound minecraft:entity.player.levelup voice @s

tag @n[type=minecraft:marker, tag=fetchr.mine_exit] add fetchr.unlocked_exit
function fetchr:game/open_exit