#> fetchr:settings/generate_dynamic_quick_actions
#
# Shows the dialog from the macro parameter
#
# @within function fetchr:settings/generate_dynamic_quick_actions
# @params dialog: #[nbt=minecraft:resource[dialog]] string
# @context entity The player to show the dialog to

$dialog show @s $(dialog)