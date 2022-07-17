#> fetchr:game/start/until_player_on_ground
#
# Wait for player hitting ground
#
# @within
# 	function fetchr:game/start/end_of_skybox
# 	function fetchr:game/start/until_player_on_ground

execute unless entity @a[predicate=fetchr:is_in_game, gamemode=adventure, nbt=!{OnGround: true}, limit=1] as @a[predicate=fetchr:is_in_game, gamemode=adventure, nbt={OnGround: true}, limit=1] at @a[predicate=fetchr:is_in_game, limit=1] align xz positioned ~0.5 ~ ~0.5 run function fetchr:game/start/initialize_countdown

execute if entity @a[predicate=fetchr:is_in_game, gamemode=adventure, nbt=!{OnGround: true}, limit=1] run schedule function fetchr:game/start/until_player_on_ground 1t