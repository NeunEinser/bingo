#> fetchr:custom_hud/components/seed/hide_component
#
# This function hides the seed from being diplayed
#
# @within function fetchr:custom_hud/components/seed/update

data modify storage io.fetchr:custom_hud component set value {textComponent: '""', icon: '""', iconWidth: '""', iconSeparator: '""', changed: true}
scoreboard players set $custom_hud/width.padding fetchr.io 87