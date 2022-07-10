#> bingo:game/start/until_player_on_ground
#
# Wait for player hitting ground
#
# @within
# 	function bingo:game/start/end_of_skybox
# 	function bingo:game/start/until_player_on_ground

execute unless entity @a[predicate=bingo:is_in_game, gamemode=adventure, nbt=!{OnGround: true}, limit=1] as @a[predicate=bingo:is_in_game, gamemode=adventure, nbt={OnGround: true}, limit=1] at @a[predicate=bingo:is_in_game, limit=1] align xz positioned ~0.5 ~ ~0.5 run function bingo:game/start/initialize_countdown

execute if entity @a[predicate=bingo:is_in_game, gamemode=adventure, nbt=!{OnGround: true}, limit=1] run schedule function bingo:game/start/until_player_on_ground 1t