#> bingo:custom_hud/components/seed/hide_component
#
# This function hides the seed from being diplayed
#
# @within function bingo:custom_hud/components/seed/update

data modify storage io.bingo:custom_hud component set value {textComponent: '""', icon: '""', iconWidth: '""', iconSeparator: '""', changed: true}
scoreboard players set $custom_hud/width.padding bingo.io 87