#> fetchr:custom_hud/update_actionbar
#
# Updates the action bar display.
# Should be called at least every 2 seconds, otherwise it starts fading out.
#
# Shouldn't be called every tick to also let vanilla action bar messages
# through.
#
# @within function fetchr:custom_hud/tick
# @context entity The current player
#
# @reads storage fetchr:custom_hud currentPlayer.components

scoreboard players set @s fetchr.hud_update 0
data modify storage tmp.fetchr:custom_hud texts set value []
data modify storage tmp.fetchr:custom_hud texts append from storage fetchr:custom_hud currentPlayer.components[].evaluated

title @s actionbar {"translate":"fetchr.technical.resourcepack_version_{NEUN_SCRIPT:rp_version}","fallback":"%2$s","with": [[{"text":"\u0001","font":"fetchr:space"},{"text":"\uffff","font":"fetchr:space"},{"storage":"tmp.fetchr:custom_hud","nbt":"texts[]","interpret":true,"separator":""},{"storage":"fetchr:tmp","nbt":"cardOffset","interpret":true},{"storage":"fetchr:card","nbt":"teams[-1].card","interpret":true},{"storage":"fetchr:tmp","nbt":"cardNegOffset","interpret":true}], {"translate":"fetchr.actionbar.wrong_resourcepack_error","fallback":"Resource pack not enabled.","color":"red"}]}
