# Modifying the item pool

It is impossible to modify the item pool in-game and there are technical reasons that make it impossible with the constraints of a vanilla Minecraft map.

In order to modify the item pool, you will thus need to create a resource pack and either modify the Fetchr datapack or also create an own datapack.

## Resource Pack

The resource pack is needed to make it possible to render the item's icon on the Bingo card displayed on the HUD. If you are not looking to add any new item and only want to modify properties of existing items or remove some, you can skip this step.

For the resource pack you need a texture file that looks like this: [2d_items.png](/resources/assets/fetchr/textures/font/2d_items.png). There are some gaps between the icons and those are important for technical reasons. If you use gimp (or prbly photoshop could also import it), you can also use [2d_items.xcf](/resources/assets/fetchr/textures/font/2d_items.xcf), remove all the icons and turn the grid to visible to give a visual guideline. each item should be placed at the top of a gridcell with empty space below.

Place this texture file somewhere in a resourcepack ([see Minecraft wiki](<https://minecraft.wiki/w/Resource_pack>)) in the `assets/<your namespace>/textures/path/to/your/file.png` (everything after textures can be anything you want. Namespace could be your username, or a name to the modification you are making, or anything really. For the entire path you can only use lowercase, numbers, underscores and dots)

You will also need a font file that looks like this inside of `assets/<your namespace>/font/path/to/your/file.json`:
```json
{
	"providers": [
		{
			"type": "bitmap",
			"file": "<namespace>:<path/from/textures/file_name_without_png_suffix>",
			"ascent": 37,
			"height": 48,
			"chars": [
				"\u0000\u0001\u0002\u0003\u0004\u0005\u0006\u0007\u0008\u0009\u000a\u000b\u000c\u000d\u000e\u000f",
				"\u0010\u0011\u0012\u0013\u0014\u0015\u0016\u0017\u0018\u0019\u001a\u001b\u001c\u001d\u001e\u001f",
				"\u0020\u0021\u0022\u0023\u0024\u0025\u0026\u0027\u0028\u0029\u002a\u002b\u002c\u002d\u002e\u002f",
				"\u0030\u0031\u0032\u0033\u0034\u0035\u0036\u0037\u0038\u0039\u003a\u003b\u003c\u003d\u003e\u003f",
				"\u0040\u0041\u0042\u0043\u0044\u0045\u0046\u0047\u0048\u0049\u004a\u004b\u004c\u004d\u004e\u004f",
				"\u0050\u0051\u0052\u0053\u0054\u0055\u0056\u0057\u0058\u0059\u005a\u005b\u005c\u005d\u005e\u005f",
				"\u0060\u0061\u0062\u0063\u0064\u0065\u0066\u0067\u0068\u0069\u006a\u006b\u006c\u006d\u006e\u006f",
				"\u0070\u0071\u0072\u0073\u0074\u0075\u0076\u0077\u0078\u0079\u007a\u007b\u007c\u007d\u007e\u007f",
				"\u0080\u0081\u0082\u0083\u0084\u0085\u0086\u0087\u0088\u0089\u008a\u008b\u008c\u008d\u008e\u008f",
				"\u0090\u0091\u0092\u0093\u0094\u0095\u0096\u0097\u0098\u0099\u009a\u009b\u009c\u009d\u009e\u009f",
				"\u00a0\u00a1\u00a2\u00a3\u00a4\u00a5\u00a6\u00a7\u00a8\u00a9\u00aa\u00ab\u00ac\u00ad\u00ae\u00af",
				"\u00b0\u00b1\u00b2\u00b3\u00b4\u00b5\u00b6\u00b7\u00b8\u00b9\u00ba\u00bb\u00bc\u00bd\u00be\u00bf",
				"\u00c0\u00c1\u00c2\u00c3\u00c4\u00c5\u00c6\u00c7\u00c8\u00c9\u00ca\u00cb\u00cc\u00cd\u00ce\u00cf",
				"\u00d0\u00d1\u00d2\u00d3\u00d4\u00d5\u00d6\u00d7\u00d8\u00d9\u00da\u00db\u00dc\u00dd\u00de\u00df",
				"\u00e0\u00e1\u00e2\u00e3\u00e4\u00e5\u00e6\u00e7\u00e8\u00e9\u00ea\u00eb\u00ec\u00ed\u00ee\u00ef",
				"\u00f0\u00f1\u00f2\u00f3\u00f4\u00f5\u00f6\u00f7\u00f8\u00f9\u00fa\u00fb\u00fc\u00fd\u00fe\u00ff"
			]
		}
	]
}
```

You need to create 5 of these files with different ascent values. This example has ascent 37 and is for the first row. The values you need are:
- `37`
- `16`
- `-5`
- `-26`
- `-47`

## Datapack
To actually add an item to the item pool you need to register it to the item pool. You can do so by either creating an own datapack or modifying the existing datapack. In any case [`fetchr:init/fill_registries`](/datapack/data/fetchr/function/init/fill_registries.mcfunction) is were the default items are defined and should help you a lot in figuring out how to set things up.

Creating a separate datapack has the advantage that it might be easier to maintain for you throughout versions (you can simply add the datapack into a new world when an update comes without needing to merge), and it could be compatible with other packs modifiying the item pool.

Modifying the existing file has the advantage that it is easier to remove or modify existing items.

To add an item in its simplest form, you can add a line like this to your function file:
```mcfunction
data modify storage fetchr:registries items append value {\
	id: "fetchr:pumpkin_seeds",\
	item: {id: "minecraft:pumpkin_seeds"},\
	translation: "item.minecraft.pumpkin_seeds",\
	icon: "0001",\
	categories: ["fetchr:pumpkin"],\
	weight: 1,\
	icon_font: {\
		actionbar: [\
			"<namespace:path/to/font/file_for_first_row>",\
			"<namespace:path/to/font/file_for_second_row>",\
			"<namespace:path/to/font/file_for_third_row>",\
			"<namespace:path/to/font/file_for_fourth_row>",\
			"<namespace:path/to/font/file_for_fifth_row>"\
		]\
	}\
}
```

- `id` is basically anything you want, but it should be unique and you should use your own namespace.
- `item` is the minecraft item definition. You can also specify components for complex items.
- `translation` is a valid translation key, most of the times you can just specify the vanilla translation key. This should be the name of the item. In general the name follows the format `item.minecraft.<item_id>` for items or `block.minecraft.<item_id>` for blocks.
- `icon` this is a hex number corresponding to the placement of the item texture in your texture file. If you map the texture file like shown above, the very first grid cell would be `0000`, but also `0000` is the only code that cannot be used, so you would leave it empty in your texture file. In `00ab` `a` is the row number and `b` is the column number. since we are counting hexadecimal, you are using 0-9 and then a-f. so `002c` would be the third row (since you start counting at 0) and the thirteenth column (0 is the first, so 9 is the tenth, a elventh, b twelveth and c thirteenth)
- `categories` is the categories the item is in. All items within this category are mutually exculsive, meaning for each category at most one item of that category can appear on a card at once. You can also specify an object with `{id: "...", weight: 1}` here to specify a weight per category.
- `weight` is how likely it is for an item to appear within its category. Higher weight means more likely.
- `icon_font` specifies the font json text files you specified earlier with the different ascent values.

For `categories` you can either use one of the existing categories or specify an own one like so:
```mcfunction
data modify storage fetchr:registries categories append value {\
	id: ":armadillo",\
	name: '{"translate": "fetchr.category.armadillo"}',\
	tags: ["fetchr:default"]\
}
```
- `id` is what you reference in the item
- `name` is used for display purposes
- `tags` you probably just want to keep `fetchr:default`. If you want to dynamically switch between item pools, there is some functionality attached to this as well, but probably you don't need this until the normal map actually starts using this feature.

If you are modifying the existing datapack, you are done now.

If you created your own, you now need to create a new function tag inside the fetchr namespace so your file is called during item registration:

`data/fetchr/tags/function/fill_registries.json`:
```json
{
	"values": [
		"namespace:path/to/your/function"
	]
}
```

If you want to create an own datapack while also modifying the existing items, you can also create another function tag `data/fetchr/tags/function/post_registration.json` which specifies a different function. To remove an item you could for instance do a `data remove storage fetchr:registries items[{id: "fetchr:exposed_cut_copper"}]`
