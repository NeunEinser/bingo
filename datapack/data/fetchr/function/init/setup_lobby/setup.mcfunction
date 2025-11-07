#> fetchr:init/setup_lobby/setup
#
# This function places relevant structures in the lobby.
#
# @within function fetchr:init/init
forceload add ~14 ~
forceload add ~15 ~-24
execute \
	if loaded ~14 3 ~ \
	if loaded ~15 0 ~-24 \
	run function fetchr:init/setup_lobby/start

$execute \
	unless loaded ~14 1 ~ \
	run schedule function fetchr:init/setup_lobby/schedule_$(type) 1t
$execute \
	unless loaded ~15 0 ~-24 \
	run schedule function fetchr:init/setup_lobby/schedule_$(type) 1t