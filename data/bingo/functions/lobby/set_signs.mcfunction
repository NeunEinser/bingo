#> bingo:lobby/set_signs
#
# Places all the signs in the lobby.
#
# This is needed, since players in the lobby will be in survival mode in order
# to support trophy collection like in older Minecraft: Bingo.
#
# Hence, signs could potentially be broken by a player and we just place them
# every tick to make sure everything keeps working.
#
# @within function bingo:lobby/tick
# @context dimension bingo:lobby

#>
# @private
#declare tag bingo.sign_machinery

#>
# @private
#declare tag bingo.sign_credits_neun_einser
#>
# @private
#declare tag bingo.sign_credits_amber_wat
#>
# @private
#declare tag bingo.sign_credits_nope_name
#>
# @private
#declare tag bingo.sign_credits_dr_brian_lorgon111
#>
# @private
#declare tag bingo.sign_credits_playtesters
#>
# @private
#declare tag bingo.sign_credits_silentrob
#>
# @private
#declare tag bingo.sign_credits_muffinshire
#>
# @private
#declare tag bingo.sign_credits_gothfaerie
#>
# @private
#declare tag bingo.sign_credits_zampone
#>
# @private
#declare tag bingo.sign_credits_thomas_to_space
#>
# @private
#declare tag bingo.sign_credits_craca_croes_gazyy
#>
# @private
#declare tag bingo.sign_credits_lifeofchrome
#>
# @private
#declare tag bingo.sign_credits_tod_nl
#>
# @private
#declare tag bingo.sign_credits_no_leaf_clover

#>
# @private
#declare tag bingo.sign_credits_tools
#>
# @private
#declare tag bingo.sign_credits_tools_vscode
#>
# @private
#declare tag bingo.sign_credits_tools_datapackhelperplus
#>
# @private
#declare tag bingo.sign_credits_tools_multinoise
#>
# @private
#declare tag bingo.sign_credits_tools_nbtexplorer
#>
# @private
#declare tag bingo.sign_credits_tools_nbtstudio
#>
# @private
#declare tag bingo.sign_credits_tools_nbtviewer

#>
# @private
#declare tag bingo.sign_team_selection
#>
# @private
#declare tag bingo.sign_card_generation_crafting_table
#>
# @private
#declare tag bingo.sign_card_generation_furnace
#>
# @private
#declare tag bingo.sign_card_generation_random_card
#>
# @private
#declare tag bingo.sign_card_generation_from_seed
#>
# @private
#declare tag bingo.sign_card_generation_start_game

#>
# @private
#declare tag bingo.sign_settings_more_coming
#>
# @private
#declare tag bingo.sign_settings_automatic_pregen
#>
# @private
#declare tag bingo.sign_settings_preferences
#>
# @private
#declare tag bingo.sign_tutorial_generate_chests
#>
# @private
#declare tag bingo.sign_tutorial_generate_chests
#>
# @private
#declare tag bingo.sign_tutorial_basics
#>
# @private
#declare tag bingo.sign_tutorial_basics1
#>
# @private
#declare tag bingo.sign_tutorial_basics2
#>
# @private
#declare tag bingo.sign_tutorial_basics3
#>
# @private
#declare tag bingo.sign_tutorial_basics4
#>
# @private
#declare tag bingo.sign_tutorial_basics5
#>
# @private
#declare tag bingo.sign_tutorial_basics6
#>
# @private
#declare tag bingo.sign_tutorial_skybox
#>
# @private
#declare tag bingo.sign_tutorial_get_tools
#>
# @private
#declare tag bingo.sign_tutorial_game_info
#>
# @private
#declare tag bingo.sign_tutorial_goal_lectern
#>
# @private
#declare tag bingo.sign_tutorial_game_info_lectern

execute at @e[type=minecraft:area_effect_cloud, tag=bingo.lobby_sign] run setblock ~ ~ ~ minecraft:air

# Machinery
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_machinery, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=west]{Text1: '{"translate":"bingo.lobby.machinery.sign.line1", "bold":true, "color":"#8eedeb"}', Text2: '{"translate": "bingo.lobby.machinery.sign.line2", "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.machinery.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.machinery.sign.line4", "color":"#8eedeb"}'}

# Credits
## Main
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_neun_einser, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '[{"text":"Neun", "bold":true, "color":"red", "clickEvent": {"action": "run_command", "value": "/tellraw @s [\\"[\\", {\\"text\\":\\"Twitter/NeunEinser\\", \\"color\\": \\"#00acee\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://twitter.com/NeunEinser\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"Discord.gg/YqFtsTUSkP\\", \\"color\\": \\"#7289d9\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://discord.gg/YqFtsTUSkP\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"YouTube/NeunEinser\\", \\"color\\": \\"#FF0000\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://www.youtube.com/channel/UCrgiKpcJrNlX4hNCFqZUbwg\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"Twitch/NeunEinser\\", \\"color\\": \\"#6441a5\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://www.twitch.tv/neuneinser\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"GitHub/NeunEinser\\", \\"color\\": \\"#4078c0\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://github.com/NeunEinser\\"}}, \\"]\\"]"}}, {"text":"Einser", "bold":true, "color":"blue"}]', Text2: '{"translate": "bingo.lobby.credits.neun_einser.sign.line2", "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.neun_einser.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.neun_einser.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_amber_wat, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"text":"AmberW", "bold":true, "color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "/tellraw @s [\\"[\\", {\\"text\\":\\"GitHub/AmberWat\\", \\"color\\": \\"#4078c0\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://github.com/AmberWat\\"}}, \\"]\\"]"}}', Text2: '{"translate": "bingo.lobby.credits.amber_wat.sign.line2", "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.amber_wat.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.amber_wat.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_nope_name, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"text":"NOPEName", "bold":true, "color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "/tellraw @s [\\"[\\", {\\"text\\":\\"Twitter/NOPEname_\\", \\"color\\": \\"#00acee\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://twitter.com/NOPEname_\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"Discord.gg/bwZY534Hgt\\", \\"color\\": \\"#7289d9\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://discord.gg/bwZY534Hgt\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"YouTube/NOPEname7\\", \\"color\\": \\"#FF0000\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://www.youtube.com/user/NOPEname7\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"GitHub/NOPEname\\", \\"color\\": \\"#4078c0\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://github.com/NOPEname\\"}}, \\"]\\"]"}}', Text2: '{"translate": "bingo.lobby.credits.nope_name.sign.line2", "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.nope_name.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.nope_name.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_dr_brian_lorgon111, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"text":"Lorgon111", "bold":true, "color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "/tellraw @s [\\"[\\", {\\"text\\":\\"Twitter/lorgon111\\", \\"color\\": \\"#00acee\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://twitter.com/lorgon111\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"YouTube/lorgon111\\", \\"color\\": \\"#FF0000\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://www.youtube.com/c/lorgon111\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"Twitch/lorgon\\", \\"color\\": \\"#6441a5\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://www.twitch.tv/lorgon\\"}}, \\"]\\"]"}}', Text2: '{"translate": "bingo.lobby.credits.dr_brian_lorgon111.sign.line2", "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.dr_brian_lorgon111.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.dr_brian_lorgon111.sign.line4", "color":"#8eedeb"}'}

## Playtesters
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_playtesters, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text1: '{"translate": "bingo.lobby.credits.playtesters.sign.line1", "bold":true, "color":"#8eedeb"}', Text2: '{"translate": "bingo.lobby.credits.playtesters.sign.line2", "bold":true, "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.playtesters.sign.line3", "bold":true, "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.playtesters.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_no_leaf_clover, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"no_leaf_", "bold":true, "color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "/tellraw @s [\\"[\\", {\\"text\\":\\"Twitter/noleafcloverlp\\", \\"color\\": \\"#00acee\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://twitter.com/noleafcloverlp\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"Discord.gg/rytXa5n\\", \\"color\\": \\"#7289d9\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://discord.gg/rytXa5n\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"YouTube/noleafcloverlp\\", \\"color\\": \\"#FF0000\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://www.youtube.com/c/noleafcloverlp\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"Twitch/noleafcloverlp\\", \\"color\\": \\"#6441a5\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://www.twitch.tv/noleafcloverlp\\"}}, \\"]\\"]"}}', Text3: '{"text":"clover", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_tod_nl, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"Tod_NL", "bold":true, "color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "/tellraw @s [\\"[\\", {\\"text\\":\\"YouTube/Tod_NL\\", \\"color\\": \\"#FF0000\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://www.youtube.com/channel/UCb-tIxUW4vEIQeBYSIppBNA\\"}}, \\"]\\"]"}}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_lifeofchrome, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"lifeofchrome", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_craca_croes_gazyy, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"CracaCroes", "bold":true, "color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "/tellraw @s [\\"[\\", {\\"text\\":\\"YouTube/CracaCG\\", \\"color\\": \\"#FF0000\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://www.youtube.com/channel/UCKCneKx9g2eja3DZ5zwDDfA\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"Twitch/CracaCG\\", \\"color\\": \\"#6441a5\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://www.twitch.tv/cracacg\\"}}, \\"]\\"]"}}', Text3: '{"text":"Gazyy", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_thomas_to_space, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"ThomasTo", "bold":true, "color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "/tellraw @s [\\"[\\", {\\"text\\":\\"Twitter/ThomasToSpace\\", \\"color\\": \\"#00acee\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://twitter.com/ThomasToSpace\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"Discord.gg/qSbAMYQ\\", \\"color\\": \\"#7289d9\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://discord.gg/qSbAMYQ\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"YouTube/ThomasToSpace\\", \\"color\\": \\"#FF0000\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://www.youtube.com/c/ThomasToSpace\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"Twitch/ThomasToSpace\\", \\"color\\": \\"#6441a5\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://www.twitch.tv/thomastospace\\"}}, \\"]\\"]"}}', Text3: '{"text":"Space", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_zampone, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"Zampone /", "bold":true, "color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "/tellraw @s [\\"[\\", {\\"text\\":\\"Twitter/ThatManZam\\", \\"color\\": \\"#00acee\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://twitter.com/ThatManZam\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"YouTube/ThatManZam\\", \\"color\\": \\"#FF0000\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://www.youtube.com/channel/UCWJfFMz6MfUHdHZ42CZdXOA\\"}}, \\"]\\\\n\\", \\"[\\", {\\"text\\":\\"Twitch/ThatManZam\\", \\"color\\": \\"#6441a5\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://www.twitch.tv/ThatManZam\\"}}, \\"]\\"]"}}', Text3: '{"text":"ThatManZam", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_gothfaerie, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"gothfaerie", "bold":true, "color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "/tellraw @s [\\"[\\", {\\"text\\":\\"Twitch/gothfaerie\\", \\"color\\": \\"#6441a5\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://www.twitch.tv/gothfaerie\\"}}, \\"]\\"]"}}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_muffinshire, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"Muffinshire", "bold":true, "color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "/tellraw @s [\\"[\\", {\\"text\\":\\"Twitter/Muffinshire\\", \\"color\\": \\"#00acee\\", \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://twitter.com/Muffinshire\\"}}, \\"]\\"]"}}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_silentrob, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text2: '{"text":"silentrob", "bold":true, "color":"#8eedeb"}'}

## Tools
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_tools, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{Text1: '{"translate": "bingo.lobby.credits.tools.sign.line1", "bold":true, "color":"#8eedeb"}', Text2: '{"translate": "bingo.lobby.credits.tools.sign.line2", "bold":true, "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.tools.sign.line3", "bold":true, "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.tools.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_tools_vscode, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{Text1: '{"text": "Visual Studio", "bold":true, "color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "/tellraw @s {\\"text\\":\\"https://code.visualstudio.com/\\", \\"color\\": \\"#00c3ff\\", \\"underlined\\": true, \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://code.visualstudio.com/\\"}}"}}', Text2: '{"text": "Code", "bold":true, "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.tools.vscode.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.tools.vscode.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_tools_datapackhelperplus, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{Text1: '{"text": "Data Pack", "bold":true, "color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "/tellraw @s {\\"text\\":\\"https://marketplace.visualstudio.com/items?itemName=SPGoding.datapack-language-server\\", \\"color\\": \\"#00c3ff\\", \\"underlined\\": true, \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://marketplace.visualstudio.com/items?itemName=SPGoding.datapack-language-server\\"}}"}}', Text2: '{"text": "Helper Plus", "bold":true, "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.tools.datapack_helper_plus.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.tools.datapack_helper_plus.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_tools_multinoise, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{Text1: '{"text": "Multi Noise", "bold":true, "color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "/tellraw @s {\\"text\\":\\"https://github.com/jacobsjo/MinecraftMultiNoiseVisualization\\", \\"color\\": \\"#00c3ff\\", \\"underlined\\": true, \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://github.com/jacobsjo/MinecraftMultiNoiseVisualization\\"}}"}}', Text2: '{"text": "Visualization", "bold":true, "color":"#8eedeb"}', Text3: '{"translate": "bingo.lobby.credits.tools.minecraft_multi_noise_visualizer.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.tools.minecraft_multi_noise_visualizer.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_tools_nbtexplorer, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{Text2: '{"text": "NBTExplorer", "bold":true, "color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "/tellraw @s {\\"text\\":\\"https://github.com/jaquadro/NBTExplorer\\", \\"color\\": \\"#00c3ff\\", \\"underlined\\": true, \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://github.com/jaquadro/NBTExplorer\\"}}"}}', Text3: '{"translate": "bingo.lobby.credits.tools.nbt_explorer.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.tools.nbt_explorer.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_tools_nbtstudio, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{Text2: '{"text": "NBT Studio", "bold":true, "color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "/tellraw @s {\\"text\\":\\"https://github.com/tryashtar/nbt-studio\\", \\"color\\": \\"#00c3ff\\", \\"underlined\\": true, \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://github.com/tryashtar/nbt-studio\\"}}"}}', Text3: '{"translate": "bingo.lobby.credits.tools.nbt_studio.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.tools.nbt_studio.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_credits_tools_nbtviewer, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=east]{Text2: '{"text": "NBT Viewer", "bold":true, "color":"#8eedeb", "clickEvent": {"action": "run_command", "value": "/tellraw @s {\\"text\\":\\"https://marketplace.visualstudio.com/items?itemName=Misodee.vscode-nbt\\", \\"color\\": \\"#00c3ff\\", \\"underlined\\": true, \\"clickEvent\\": {\\"action\\":\\"open_url\\", \\"value\\": \\"https://marketplace.visualstudio.com/items?itemName=Misodee.vscode-nbt\\"}}"}}', Text3: '{"translate": "bingo.lobby.credits.tools.nbt_viewer.sign.line3", "color":"#8eedeb"}', Text4: '{"translate": "bingo.lobby.credits.tools.nbt_viewer.sign.line4", "color":"#8eedeb"}'}

# Card Generation
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_card_generation_furnace, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"translate":"bingo.lobby.card_generation.furnace.sign.line1", "bold":true, "color":"#8eedeb"}', Text2:'{"translate":"bingo.lobby.card_generation.furnace.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.card_generation.furnace.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.card_generation.furnace.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_card_generation_crafting_table, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"translate":"bingo.lobby.card_generation.crafting_table.sign.line1", "bold":true, "color":"#8eedeb"}', Text2:'{"translate":"bingo.lobby.card_generation.crafting_table.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.card_generation.crafting_table.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.card_generation.crafting_table.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_team_selection, limit=2] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text1: '{"translate":"bingo.lobby.team_selection.sign.line1", "bold":true, "color":"#8eedeb"}', Text2:'{"translate":"bingo.lobby.team_selection.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.team_selection.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.team_selection.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_card_generation_random_card, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"translate":"bingo.lobby.card_generation.random_card.sign.line1", "bold":true, "color":"#8eedeb", "clickEvent":{"action":"run_command","value":"/function bingo:card_generation/random_card"}}', Text2:'{"translate":"bingo.lobby.card_generation.random_card.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.card_generation.random_card.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.card_generation.random_card.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_card_generation_from_seed, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"translate":"bingo.lobby.card_generation.from_seed.sign.line1", "bold":true, "color":"#8eedeb", "clickEvent":{"action":"run_command","value":"/tellraw @s [{\\"translate\\": \\"bingo.lobby.card_generation.from_seed.instructions\\", \\"with\\": [{\\"translate\\": \\"bingo.lobby.card_generation.from_seed.instructions.link\\", \\"color\\":\\"#00c3ff\\", \\"clickEvent\\": {\\"action\\": \\"suggest_command\\", \\"value\\": \\"/trigger bingo.seed set \\"}}]}, \\"\\\\n\\", {\\"translate\\": \\"bingo.lobby.card_generation.from_seed.explanation\\", \\"italic\\": true, \\"color\\": \\"gray\\"}]"}}', Text2:'{"translate":"bingo.lobby.card_generation.from_seed.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.card_generation.from_seed.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.card_generation.from_seed.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_card_generation_start_game, limit=3] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"translate":"bingo.lobby.card_generation.start_game.sign.line1", "bold":true, "color":"#8eedeb", "clickEvent":{"action":"run_command","value":"/function bingo:game/start/check_and_start"}}', Text2:'{"translate":"bingo.lobby.card_generation.start_game.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.card_generation.start_game.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.card_generation.start_game.sign.line4", "bold":true, "color":"#8eedeb"}'}

#Tutorial / Game Info / Settings
## Settings
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_settings_preferences, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"translate":"bingo.lobby.settings.preferences.sign.line1", "bold":true, "color":"#8eedeb", "clickEvent":{"action":"run_command","value":"/trigger bingo.pref set 1"}}', Text2:'{"translate":"bingo.lobby.settings.preferences.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.settings.preferences.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.settings.preferences.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute if score $automatically_pregen bingo.settings matches 0 at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_settings_automatic_pregen, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"translate":"bingo.lobby.settings.automatic_pregen.sign.line1", "bold":true, "color":"#8eedeb", "clickEvent":{"action":"run_command","value":"/function bingo:lobby/settings/change_pregen_behavior"}}', Text2:'{"translate":"bingo.lobby.settings.automatic_pregen.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.settings.automatic_pregen.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.settings.automatic_pregen.sign.off", "color":"red"}'}
execute if score $automatically_pregen bingo.settings matches 1 at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_settings_automatic_pregen, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"translate":"bingo.lobby.settings.automatic_pregen.sign.line1", "bold":true, "color":"#8eedeb", "clickEvent":{"action":"run_command","value":"/function bingo:lobby/settings/change_pregen_behavior"}}', Text2:'{"translate":"bingo.lobby.settings.automatic_pregen.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.settings.automatic_pregen.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.settings.automatic_pregen.sign.on", "color":"green"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_settings_more_coming, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text2: '{"text":"More Settings", "bold":true, "color":"#8eedeb", "clickEvent":{"action":"run_command", "value": "/tellraw @s [{\\"text\\": \\"Do you want to change future settings? \\"}, {\\"text\\": \\"[Yes]\\", \\"color\\": \\"green\\", \\"clickEvent\\": {\\"action\\": \\"run_command\\", \\"value\\": \\"/tellraw @s {\\\\\\"text\\\\\\":\\\\\\"Error accessing the future. Please talk to your local time machine operator.\\\\\\", \\\\\\"obfuscated\\\\\\": true}\\"}}, {\\"text\\": \\" [No]\\", \\"color\\": \\"red\\", \\"clickEvent\\": {\\"action\\": \\"run_command\\", \\"value\\": \\"/tellraw @s {\\\\\\"text\\\\\\":\\\\\\"Good decision. Who knows, maybe these settings are awful.\\\\\\"}\\"}}]"}}', Text3:'{"text":"Coming Soon", "bold":true, "color":"#8eedeb"}'}

## Tutorial
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_tutorial_generate_chests, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=west]{Text1: '{"translate":"bingo.lobby.tutorial.generate_chests.sign.line1", "bold":true, "color":"#8eedeb", "clickEvent":{"action":"run_command","value":"/trigger bingo.pref set 1"}}', Text2:'{"translate":"bingo.lobby.tutorial.generate_chests.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.tutorial.generate_chests.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.tutorial.generate_chests.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_tutorial_basics, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text1: '{"translate":"bingo.lobby.tutorial.basics.sign.line1", "bold":true, "color":"#8eedeb", "clickEvent":{"action":"run_command","value":"/trigger bingo.pref set 1"}}', Text2:'{"translate":"bingo.lobby.tutorial.basics.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.tutorial.basics.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.tutorial.basics.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_tutorial_basics1, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text1: '{"translate":"bingo.lobby.tutorial.basics1.sign.line1", "color":"#8eedeb"}', Text2:'{"translate":"bingo.lobby.tutorial.basics1.sign.line2", "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.tutorial.basics1.sign.line3", "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.tutorial.basics1.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_tutorial_basics2, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text1: '{"translate":"bingo.lobby.tutorial.basics2.sign.line1", "color":"#8eedeb"}', Text2:'{"translate":"bingo.lobby.tutorial.basics2.sign.line2", "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.tutorial.basics2.sign.line3", "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.tutorial.basics2.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_tutorial_basics3, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text1: '{"translate":"bingo.lobby.tutorial.basics3.sign.line1", "color":"#8eedeb"}', Text2:'{"translate":"bingo.lobby.tutorial.basics3.sign.line2", "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.tutorial.basics3.sign.line3", "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.tutorial.basics3.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_tutorial_basics4, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text1: '{"translate":"bingo.lobby.tutorial.basics4.sign.line1", "color":"#8eedeb"}', Text2:'{"translate":"bingo.lobby.tutorial.basics4.sign.line2", "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.tutorial.basics4.sign.line3", "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.tutorial.basics4.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_tutorial_basics5, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text1: '{"translate":"bingo.lobby.tutorial.basics5.sign.line1", "color":"#8eedeb"}', Text2:'{"translate":"bingo.lobby.tutorial.basics5.sign.line2", "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.tutorial.basics5.sign.line3", "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.tutorial.basics5.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_tutorial_basics6, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text1: '{"translate":"bingo.lobby.tutorial.basics6.sign.line1", "color":"#8eedeb"}', Text2:'{"translate":"bingo.lobby.tutorial.basics6.sign.line2", "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.tutorial.basics6.sign.line3", "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.tutorial.basics6.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_tutorial_skybox, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"translate":"bingo.lobby.tutorial.skybox.sign.line1", "color":"#8eedeb"}', Text2:'{"translate":"bingo.lobby.tutorial.skybox.sign.line2", "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.tutorial.skybox.sign.line3", "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.tutorial.skybox.sign.line4", "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_tutorial_get_tools, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=south]{Text1: '{"translate":"bingo.lobby.tutorial.get_tools.sign.line1", "color":"#8eedeb"}', Text2:'{"translate":"bingo.lobby.tutorial.get_tools.sign.line2", "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.tutorial.get_tools.sign.line3", "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.tutorial.get_tools.sign.line4", "color":"#8eedeb"}'}

## Game info
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_tutorial_game_info, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text1: '{"translate":"bingo.lobby.tutorial.game_info.sign.line1", "bold":true, "color":"#8eedeb"}', Text2:'{"translate":"bingo.lobby.tutorial.game_info.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.tutorial.game_info.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.tutorial.game_info.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_tutorial_goal_lectern, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text1: '{"translate":"bingo.lobby.tutorial.goals.sign.line1", "bold":true, "color":"#8eedeb"}', Text2:'{"translate":"bingo.lobby.tutorial.goals.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.tutorial.goals.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.tutorial.goals.sign.line4", "bold":true, "color":"#8eedeb"}'}
execute at @e[type=minecraft:area_effect_cloud, tag=bingo.sign_tutorial_game_info_lectern, limit=1] run setblock ~ ~ ~ minecraft:warped_wall_sign[facing=north]{Text1: '{"translate":"bingo.lobby.tutorial.game_info.sign.line1", "bold":true, "color":"#8eedeb"}', Text2:'{"translate":"bingo.lobby.tutorial.game_info.sign.line2", "bold":true, "color":"#8eedeb"}', Text3:'{"translate":"bingo.lobby.tutorial.game_info.sign.line3", "bold":true, "color":"#8eedeb"}', Text4:'{"translate":"bingo.lobby.tutorial.game_info.sign.line4", "bold":true, "color":"#8eedeb"}'}