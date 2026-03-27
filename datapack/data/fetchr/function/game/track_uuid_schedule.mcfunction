
function fetchr:game/track_uuid_macro with storage fetchr:card dimension
execute \
	if score $game_state fetchr.state matches 4 \
	run schedule function fetchr:game/track_uuid_schedule 3s