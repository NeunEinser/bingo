#> fetchr:init/fill_registries
#
# Registers everything in vanilla Fetchr.
#
# To register your own ite
#
# @within tag/function fetchr:fill_registries
# @handles #fetchr:fill_registries

#TODO versioning for most registries

#TODO make sure categories are in stable order. Pretty sure they are curremtly
# in arbitary order after having been processed,\
	meaning that if a new category
# is added which is not in the fetchr:default tag and some vanilla Fetchr items
# are added to it,\
	existing seeds might shuffle without the item pool or active
# categories actually changing.
#
# Probably should just keep the order of initial definition

# categories
#/give @p minecraft:mine_ingredient[minecraft:world_modifiers={effects:["surface_world","floating_islands_world","amplified","cave_world","shattered_blocks_world","grid_world","dark_cave_world","surface_exits","cave_exits","rare_surface_exits","sheep","cows","pigs","chickens","frogs","foxes","goats","ocelots","axolotls","armadillos","mooshrooms","pandas","parrots","rabbits","sniffers","striders","zombies","skeletons","spiders","cave_spiders","creepers","slimes","endermen","witches","magma_cubes","blazes","breezes","pillagers","vindicators","evokers","ravagers","illusioners","guardians","endermites","shulkers","ghasts","zombified_piglins","piglins","wither_skeletons","bees","hoglins","zoglins","base_stone","base_blackstone","base_diorite","base_andesite","base_granite","base_tuff","base_deepslate","base_end_stone","plains","savannas","forests","taigas","jungles","snowy","desert","badlands","swamps","dark_forests","ice_spikes","mushroom_fields","nether_barrens","nether_forests","deep_dark","end","dry_land","water_world","ultrawarm","icy","one_hp","wednesday_frogs","universal_anger","eternal_night","eternal_rain","eternal_lightning","insomniacs","no_drops","explosive_traps","fish_out_of_water","soul_link"],include_description:false}]
#region always active
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:basic_iron",\
	name: { translate: "fetchr.category.basic_iron" },\
}

data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:copper",\
	name: { translate: "fetchr.category.copper" }\
}

data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:flint",\
	name: { translate: "fetchr.category.flint" }\
}

data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:furnace",\
	name: { translate: "fetchr.category.furnace" },\
}

data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:gold",\
	name: { translate: "fetchr.category.gold" },\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:lapis",\
	name: { translate: "fetchr.category.lapis" },\
}
#endregion always active

#region basic
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:clay",\
	name: { translate: "fetchr.category.clay" },\
	requirements: [\
		"fetchr:lush_caves",\
		{\
			type: "conjunction",\
			value: [\
				[\
					"minecraft:surface_world",\
					"minecraft:amplified",\
					"minecraft:shattered_blocks_world",\
				],\
				{\
					type: "negation",\
					value: [\
						"minecraft:dry_land",\
						"minecraft:ultrawarm",\
						"minecraft:nether_barrens",\
						"minecraft:nether_forests",\
						"minecraft:end",\
					]\
				},\
				[\
					"fetchr:lukewarm_ocean",\
					"fetchr:cold_ocean",\
					"fetchr:ocean",\
					"fetchr:river",\
					"fetchr:frozen_river",\
				]\
			]\
		}\
	],\
	weight: 100\
}

data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:magma",\
	name: { translate: "fetchr.category.magma" },\
	requirements: [\
		"fetchr:ruined_portal",\
		"fetchr:nether_wastes",\
		"fetchr:basalt_deltas",\
		{\
			type: "conjunction",\
			value: [\
				[\
					"minecraft:surface_world",\
					"minecraft:amplified",\
					"minecraft:shattered_blocks_world",\
				],\
				{\
					type: "negation",\
					value: [\
						"minecraft:dry_land",\
						"minecraft:ultra_warm",\
						"minecraft:nether_barrens",\
						"minecraft:nether_forests",\
						"minecraft:end",\
					]\
				},\
				[\
					"fetchr:warm_ocean",\
					"fetchr:ocean",\
					"fetchr:frozen_ocean",\
					"fetchr:cold_ocean",\
					"fetchr:lukewarm_ocean",\
				]\
			]\
		}\
	]\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:kelp",\
	name: { translate: "fetchr.category.kelp" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			[\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:shattered_blocks_world",\
			],\
			{\
				type: "negation",\
				value: [\
					"minecraft:dry_land",\
					"minecraft:ultrawarm",\
					"minecraft:nether_barrens",\
					"minecraft:nether_forests",\
					"minecraft:end",\
				]\
			},\
			[\
				"fetchr:lukewarm_ocean",\
				"fetchr:cold_ocean",\
				"fetchr:ocean",\
			]\
		]\
	},\
	weight: 100\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:mushroom",\
	name: { translate: "fetchr.category.mushroom" },\
	requirements: [\
		"fetchr:taiga",\
		"fetchr:swamp",\
		"fetchr:dark_forest",\
		"fetchr:mushroom_fields",\
		{\
			type: "conjunction",\
			value: [\
				"minecraft:mooshrooms",\
				[\
					"minecraft:surface_world",\
					"minecraft:amplified",\
					"minecraft:floating_islands_world",\
					"minecraft:shattered_blocks_world",\
				],\
				[\
					"fetchr:plains",\
					"fetchr:savanna",\
					"fetchr:forest",\
					"fetchr:taiga",\
					"fetchr:jungle",\
					"fetchr:swamp",\
					"fetchr:dark_forest"\
				],\
			]\
		}\
	],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:glass",\
	name: { translate: "fetchr.category.glass" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			[\
				"fetchr:desert",\
				"fetchr:badlands",\
				"fetchr:beach",\
				"fetchr:snowy_beach",\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		],\
	},\
	weight: 100\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:deepslate",\
	name: { translate: "fetchr.category.deepslate" },\
	requirements: [\
		{\
			type: "conjunction",\
			value: [\
				[\
					"minecraft:surface_world",\
					"minecraft:amplified",\
					"minecraft:shattered_blocks_world",\
					"minecraft:cave_world",\
					"minecraft:dark_cave_world"\
				],\
				[\
					"minecraft:base_andesite",\
					"minecraft:base_blackstone",\
					"minecraft:base_diorite",\
					"minecraft:base_granite",\
					"minecraft:base_tuff",\
					"minecraft:base_end_stone"\
				]\
			]\
		},\
		{\
			type: "conjunction",\
			value: [\
				"minecraft:grid_world",\
				"minecraft:base_deepslate"\
			]\
		}\
	]\
}
#endregion basic

#region biomes
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:cherry_grove",\
	name: { translate: "fetchr.category.cherry_grove" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:cherry_grove",\
			[\
				"minecraft:grid_world",\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		]\
	},\
	weight: 1000\
}

data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:dripstone_cave",\
	name: { translate: "fetchr.category.dripstone_cave" },\
	requirements: [ "fetchr:dripstone_caves" ],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:lush_caves",\
	name: { translate: "fetchr.category.lush_caves" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:lush_caves",\
			{\
				type: "negation",\
				value: "minecraft:water_world",\
			}\
		]\
	},\
	weight: 1000\
}

data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:jungle",\
	name: { translate: "fetchr.category.jungle" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:jungle",\
			[\
				"minecraft:grid_world",\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		],\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:mangrove",\
	name: { translate: "fetchr.category.mangrove" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:mangrove_swamp",\
			[\
				"minecraft:grid_world",\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		],\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:oak",\
	name: { translate: "fetchr.category.oak" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			[\
				"fetchr:forest",\
				"fetchr:plains",\
			],\
			[\
				"minecraft:grid_world",\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		],\
	},\
	weight: 200\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:dark_oak",\
	name: { translate: "fetchr.category.dark_oak" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:dark_forest",\
			[\
				"minecraft:grid_world",\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		],\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:pale_garden",\
	name: { translate: "fetchr.category.pale_garden" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:pale_garden",\
			[\
				"minecraft:grid_world",\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		],\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:savanna",\
	name: { translate: "fetchr.category.savanna" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:savanna",\
			[\
				"minecraft:grid_world",\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		],\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:taiga",\
	name: { translate: "fetchr.category.taiga" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:taiga",\
			[\
				"minecraft:grid_world",\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		],\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:snow",\
	name: { translate: "fetchr.category.snow" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			[\
				"fetchr:snowy_plains",\
				"fetchr:ice_spikes",\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		],\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:desert",\
	name: { translate: "fetchr.category.desert" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			[\
				"fetchr:desert",\
				"fetchr:badlands",\
			],\
			[\
				"minecraft:grid_world",\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		],\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:swamp",\
	name: { translate: "fetchr.category.swamp" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:swamp",\
			[\
				"minecraft:grid_world",\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		],\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:soulsand_valley",\
	name: { translate: "fetchr.category.soulsand_valley" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:soul_sand_valley",\
			[\
				"minecraft:grid_world",\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
		],\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:basalt",\
	name: { translate: "fetchr.category.basalt" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:basalt_deltas",\
			[\
				"minecraft:grid_world",\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
		],\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:crimson",\
	name: { translate: "fetchr.category.crimson" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:crimson_forest",\
			[\
				"minecraft:grid_world",\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
				{\
					type: "conjunction",\
					value: [\
						[\
							"minecraft:cave_world",\
							"minecraft:dark_cave_world",\
						],\
						{\
							type: "negation",\
							value: [\
								"minecraft:water_world",\
							],\
						}\
					],\
				}\
			],\
		],\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:warped_forest",\
	name: { translate: "fetchr.category.warped_forest" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:warped_forest",\
			[\
				"minecraft:grid_world",\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
				"minecraft:shattered_blocks_world",\
				{\
					type: "conjunction",\
					value: [\
						[\
							"minecraft:cave_world",\
							"minecraft:dark_cave_world",\
						],\
						{\
							type: "negation",\
							value: [\
								"minecraft:water_world",\
							],\
						}\
					],\
				}\
			],\
		],\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:end",\
	name: { translate: "fetchr.category.end" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:end_highlands",\
			[\
				"minecraft:grid_world",\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		],\
	},\
	weight: 1000\
}
#endregion biomes

#region structures
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:ancient_city",\
	name: { translate: "fetchr.category.ancient_city" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:ancient_city",\
			[\
				"minecraft:grid_world",\
				"minecraft:floating_island_world"\
			]\
		]\
	},\
	weight: 1000\
}

data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:mineshaft",\
	name: { translate: "fetchr.category.mineshaft" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:mineshaft",\
			[\
				"minecraft:grid_world",\
				"minecraft:floating_island_world",\
				"fetchr:badlands"\
			]\
		]\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:end_city",\
	name: { translate: "fetchr.category.end_city" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:end_city",\
			[\
				"minecraft:grid_world",\
				"minecraft:floating_island_world",\
				"minecraft:surface_world",\
				"minecraft:shattered_blocks_world",\
				"minecraft:amplified",\
			]\
		]\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:nether_fortress",\
	name: { translate: "fetchr.category.nether_fortress" },\
	requirements: [ "fetchr:fortress" ],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:bastion_remnant",\
	name: { translate: "fetchr.category.bastion_remnant" },\
	requirements: [ "fetchr:bastion_remnant" ],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:shipwreck",\
	name: { translate: "fetchr.category.shipwreck" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:shipwreck",\
			"fetchr:burried_treasure",\
			[\
				"minecraft:grid_world",\
				"minecraft:floating_island_world",\
				"minecraft:surface_world",\
				"minecraft:shattered_blocks_world",\
				"minecraft:amplified",\
			]\
		]\
	},\
	weight: 100\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:village",\
	name: { translate: "fetchr.category.village" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"fetchr:village",\
			[\
				"minecraft:grid_world",\
				"minecraft:floating_island_world",\
				"minecraft:surface_world",\
				"minecraft:shattered_blocks_world",\
				"minecraft:amplified",\
			]\
		]\
	}\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:emerald",\
	name: { translate: "fetchr.category.emerald" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			[\
				"fetchr:cherry_grove",\
				"fetchr:meadow",\
				"fetchr:snowy_slopes",\
				"fetchr:frozen_peaks",\
				"fetchr:stony_peaks",\
				"fetchr:windswept_forest",\
				"fetchr:windswept_hills",\
				"fetchr:windswept_gravelly_hills",\
				"minecraft:pillagers",\
				"minecraft:vindicators",\
			],\
			{\
				type: "negation",\
				value:  [\
					"fetchr:shipwreck",\
					"fetchr:burried_treasure",\
					"fetchr:village",\
					"minecraft:evokers",\
				]\
			},\
		]\
	}\
}
#endregion structures

#region peaceful mobs
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:armadillo",\
	name: { translate: "fetchr.category.armadillo" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"minecraft:armadillos",\
			[\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
				"minecraft:floating_islands_world"\
			],\
			[\
				"fetchr:plains",\
				"fetchr:savanna",\
				"fetchr:forest",\
				"fetchr:taiga",\
				"fetchr:jungle",\
				"fetchr:badlands",\
				"fetchr:swamp",\
				"fetchr:dark_forest"\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		]\
	},\
	weight: 1000\
}

data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:axolotl",\
	name: { translate: "fetchr.category.axolotl" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"minecraft:axolotls",\
			"fetchr:lush_caves"\
		]\
	},\
	weight: 1000\
}

data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:chicken",\
	name: { translate: "fetchr.category.chicken" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"minecraft:chickens",\
			[\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			[\
				"fetchr:plains",\
				"fetchr:forest",\
				"fetchr:dark_forest",\
				"fetchr:swamp"\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		]\
	},\
	weight: 1000\
}

data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:hot_chicken",\
	name: { translate: "fetchr.category.hot_chicken" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"minecraft:chickens",\
			[\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			[\
				"fetchr:savanna",\
				"fetchr:jungle",\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		]\
	},\
	weight: 1000\
}

data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:cold_chicken",\
	name: { translate: "fetchr.category.cold_chicken" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"minecraft:chickens",\
			[\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			[\
				"fetchr:taiga",\
				"fetchr:snowy_taiga",\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		]\
	},\
	weight: 1000\
}

data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:parrot",\
	name: { translate: "fetchr.category.parrot" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"minecraft:parrots",\
			[\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			[\
				"fetchr:plains",\
				"fetchr:savanna",\
				"fetchr:forest",\
				"fetchr:taiga",\
				"fetchr:jungle",\
				"fetchr:swamp",\
				"fetchr:dark_forest"\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		]\
	},\
	weight: 1000\
}

data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:cow",\
	name: { translate: "fetchr.category.cow" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"minecraft:cows",\
			[\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			[\
				"fetchr:plains",\
				"fetchr:savanna",\
				"fetchr:forest",\
				"fetchr:taiga",\
				"fetchr:jungle",\
				"fetchr:swamp",\
				"fetchr:dark_forest"\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		]\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:goat",\
	name: { translate: "fetchr.category.goat" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"minecraft:goats",\
			[\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			[\
				"fetchr:plains",\
				"fetchr:savanna",\
				"fetchr:forest",\
				"fetchr:taiga",\
				"fetchr:jungle",\
				"fetchr:swamp",\
				"fetchr:dark_forest"\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		]\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:pig",\
	name: { translate: "fetchr.category.pig" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"minecraft:pigs",\
			[\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:floating_islands_world",\
				"minecraft:shattered_blocks_world",\
			],\
			[\
				"fetchr:plains",\
				"fetchr:savanna",\
				"fetchr:forest",\
				"fetchr:taiga",\
				"fetchr:jungle",\
				"fetchr:swamp",\
				"fetchr:dark_forest"\
			],\
			{\
				type: "negation",\
				value: {\
					type: "conjunction",\
					value: [\
						"minecraft:water_world",\
						{\
							type: "negation",\
							value: "minecraft:amplified"\
						}\
					],\
				}\
			}\
		]\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:sheep",\
	name: { translate: "fetchr.category.sheep" },\
	requirements: [\
		{\
			type: "conjunction",\
			value: [\
				"minecraft:sheep",\
				[\
					"minecraft:surface_world",\
					"minecraft:amplified",\
					"minecraft:floating_islands_world",\
					"minecraft:shattered_blocks_world",\
				],\
				[\
					"fetchr:plains",\
					"fetchr:savanna",\
					"fetchr:forest",\
					"fetchr:taiga",\
					"fetchr:jungle",\
					"fetchr:swamp",\
					"fetchr:dark_forest"\
				],\
				{\
					type: "negation",\
					value: {\
						type: "conjunction",\
						value: [\
							"minecraft:water_world",\
							{\
								type: "negation",\
								value: "minecraft:amplified"\
							}\
						],\
					}\
				}\
			],\
		},\
	],\
	weight: 1000\
}
#endregion peaceful mobs

#region aquatic mobs
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:fish",\
	name: { translate: "fetchr.category.fish" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			[\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:shattered_blocks_world",\
			],\
			{\
				type: "negation",\
				value: [\
					"minecraft:dry_land",\
					"minecraft:ultrawarm",\
					"minecraft:nether_barrens",\
					"minecraft:nether_forests",\
					"minecraft:end",\
				]\
			},\
			"fetchr:warm_ocean",\
			[\
				"fetchr:ocean",\
				"fetchr:frozen_ocean",\
				"fetchr:cold_ocean",\
				"fetchr:lukewarm_ocean",\
			]\
		]\
	},\
	weight: 100\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:cod_salmon",\
	name: { translate: "fetchr.category.fish" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			[\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:shattered_blocks_world",\
			],\
			{\
				type: "negation",\
				value: [\
					"minecraft:dry_land",\
					"minecraft:ultrawarm",\
					"minecraft:nether_barrens",\
					"minecraft:nether_forests",\
					"minecraft:end",\
					"fetchr:warm_ocean",\
				]\
			},\
			[\
				"fetchr:lukewarm_ocean",\
				"fetchr:frozen_ocean",\
				"fetchr:cold_ocean",\
				"fetchr:ocean",\
			]\
		]\
	},\
	weight: 100\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:salmon",\
	name: { translate: "fetchr.category.fish" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			[\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:shattered_blocks_world",\
			],\
			{\
				type: "negation",\
				value: [\
					"minecraft:dry_land",\
					"minecraft:ultrawarm",\
					"minecraft:nether_barrens",\
					"minecraft:nether_forests",\
					"minecraft:end",\
					"fetchr:warm_ocean",\
					"fetchr:lukewarm_ocean",\
					"fetchr:frozen_ocean",\
					"fetchr:cold_ocean",\
					"fetchr:ocean",\
				]\
			},\
			[\
				"fetchr:frozen_river",\
				"fetchr:river",\
			]\
		]\
	},\
	weight: 100\
}

data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:ink",\
	name: { translate: "fetchr.category.ink" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			[\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:shattered_blocks_world",\
			],\
			{\
				type: "negation",\
				value: [\
					"minecraft:dry_land",\
					"minecraft:ultrawarm",\
					"minecraft:nether_barrens",\
					"minecraft:nether_forests",\
					"minecraft:end",\
				]\
			},\
			[\
				"fetchr:frozen_river",\
				"fetchr:river",\
				"fetchr:warm_ocean",\
				"fetchr:lukewarm_ocean",\
				"fetchr:frozen_ocean",\
				"fetchr:cold_ocean",\
				"fetchr:ocean",\
			]\
		]\
	},\
	weight: 100\
}

data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:glow_ink",\
	name: { translate: "fetchr.category.glow_ink" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			[\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:shattered_blocks_world",\
				"minecraft:cave_world",\
				"minecraft:dark_cave_world",\
			],\
			{\
				type: "negation",\
				value: [\
					"minecraft:dry_land",\
					"minecraft:ultrawarm",\
					"minecraft:nether_barrens",\
					"minecraft:nether_forests",\
					"minecraft:end",\
				]\
			},\
		]\
	}\
}
#endregion aquatic mobs

#region hostile mobs
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:creeper",\
	name: { translate: "fetchr.category.creeper" },\
	requirements: [ "minecraft:creepers" ],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:enderman",\
	name: { translate: "fetchr.category.enderman" },\
	requirements: [ "minecraft:endermen" ],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:skeleton",\
	name: { translate: "fetchr.category.skeleton" },\
	requirements: [ "minecraft:skeletons", "minecraft:wither_skeletons" ],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:spider",\
	name: { translate: "fetchr.category.spider" },\
	requirements: [ "minecraft:spiders", "minecraft:cave_spiders" ],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:zombie",\
	name: { translate: "fetchr.category.zombie" },\
	requirements: [ "minecraft:zombies", "minecraft:zombified_piglins", "minecraft:zoglins" ],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:slime",\
	name: { translate: "fetchr.category.slime" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"minecraft:slimes",\
			{\
				type: "conjunction",\
				value: [\
					[\
						"minecraft:surface_world",\
						"minecraft:amplified",\
						"minecraft:shattered_blocks_world",\
					],\
					[\
						"fetchr:swamp",\
						"fetchr:mangrove_swamp",\
					],\
					{\
						type: "negation",\
						value: {\
							type: "conjunction",\
							value: [\
								"minecraft:water_world",\
								{\
									type: "negation",\
									value: "minecraft:amplified"\
								}\
							],\
						}\
					}\
				],\
			},\
		],\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:glowstone",\
	name: { translate: "fetchr.category.slime" },\
	requirements: [\
		"minecraft:witches",\
		{\
			type: "conjunction",\
			value: [\
				"fetchr:nether_wastes",\
				[\
					"minecraft:cave_world",\
					"minecraft:dark_cave_world",\
				],\
			]\
		}\
	],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:magma_cube",\
	name: { translate: "fetchr.category.magma_cube" },\
	requirements: [ "minecraft:magma_cubes" ],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:blaze",\
	name: { translate: "fetchr.category.blazes" },\
	requirements: [ "minecraft:blazes" ],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:breeze",\
	name: { translate: "fetchr.category.breeze" },\
	requirements: [ "minecraft:breezes" ],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:evoker",\
	name: { translate: "fetchr.category.evoker" },\
	requirements: [ "minecraft:evokers" ],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:sadgle",\
	name: { translate: "fetchr.category.sadgle" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"minecraft:ravagers",\
			[\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:shattered_blocks_world",\
			],\
		]\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:guardian",\
	name: { translate: "fetchr.category.guardian" },\
	requirements: {\
		type: "conjunction",\
		value: [\
			"minecraft:guardians",\
			[\
				"minecraft:surface_world",\
				"minecraft:amplified",\
				"minecraft:shattered_blocks_world",\
				"minecraft:cave_world",\
				"minecraft:dark_cave_world",\
			],\
			{\
				type: "negation",\
				value: [\
					"minecraft:dry_land",\
					"minecraft:ultrawarm",\
					"minecraft:nether_barrens",\
					"minecraft:nether_forests",\
					"minecraft:end",\
				]\
			},\
		],\
	},\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:shulker",\
	name: { translate: "fetchr.category.shulker" },\
	requirements: [ "minecraft:shulkers" ],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:ghast",\
	name: { translate: "fetchr.category.ghast" },\
	requirements: [ "minecraft:ghasts" ],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:batering",\
	name: { translate: "fetchr.category.batering" },\
	requirements: [ "minecraft:piglins" ],\
	weight: 1000\
}
data \
	modify storage fetchr:registries categories append value {\
	id: "fetchr:hoglin",\
	name: { translate: "fetchr.category.hoglin" },\
	requirements: [ "minecraft:hoglins" ],\
	weight: 1000\
}
#endregion hostile mobs

# items

# 0001: iron_ingot
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:iron_ingot",\
	item: { id: "minecraft:iron_ingot" },\
	translation: "item.minecraft.iron_ingot",\
	icon: "0001",\
	categories: [ "fetchr:basic_iron" ]\
}

# 0002: cauldron
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:cauldron",\
	item: { id: "minecraft:cauldron" },\
	translation: "block.minecraft.cauldron",\
	icon: "0002",\
	categories: [ "fetchr:basic_iron" ]\
}

# 0003: copper_ingot
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:copper_ingot",\
	item: { id: "minecraft:copper_ingot" },\
	translation: "item.minecraft.copper_ingot",\
	icon: "0003",\
	categories: [ "fetchr:copper" ]\
}

# 0004: flint
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:flint",\
	item: { id: "minecraft:flint" },\
	translation: "item.minecraft.flint",\
	icon: "0004",\
	categories: [ "fetchr:flint" ]\
}

# 0005: flint_and_steel
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:flint_and_steel",\
	item: { id: "minecraft:flint_and_steel" },\
	translation: "item.minecraft.flint_and_steel",\
	icon: "0005",\
	categories: [ "fetchr:flint" ]\
}

# 0006: gold_ingot
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:gold_ingot",\
	item: { id: "minecraft:gold_ingot" },\
	translation: "item.minecraft.gold_ingot",\
	icon: "0006",\
	categories: [ "fetchr:gold" ]\
}

# 0007: golden_shovel
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:golden_shovel",\
	item: { id: "minecraft:golden_shovel" },\
	translation: "item.minecraft.golden_shovel",\
	icon: "0007",\
	categories: [ "fetchr:gold" ]\
}

# 0008: lapis_lazuli
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:lapis_lazuli",\
	item: { id: "minecraft:lapis_lazuli" },\
	translation: "item.minecraft.lapis_lazuli",\
	icon: "0008",\
	categories: [ "fetchr:lapis" ]\
}

# 0009: clay_ball
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:clay_ball",\
	item: { id: "minecraft:clay_ball" },\
	translation: "item.minecraft.clay_ball",\
	icon: "0009",\
	categories: [ "fetchr:clay" ]\
}

# 000a: brick
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:brick",\
	item: { id: "minecraft:brick" },\
	translation: "item.minecraft.brick",\
	icon: "000a",\
	categories: [ "fetchr:clay" ]\
}

# 000b: flower_pot
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:flower_pot",\
	item: { id: "minecraft:flower_pot" },\
	translation: "block.minecraft.flower_pot",\
	icon: "000b",\
	categories: [ "fetchr:clay" ]\
}

# 000c: kelp
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:kelp",\
	item: { id: "minecraft:kelp" },\
	translation: "block.minecraft.kelp",\
	icon: "000c",\
	categories: [ "fetchr:kelp" ]\
}

# 000d: dried_kelp
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:dried_kelp",\
	item: { id: "minecraft:dried_kelp" },\
	translation: "item.minecraft.dried_kelp",\
	icon: "000d",\
	categories: [ "fetchr:kelp" ]\
}

# 000e: red_mushroom
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:red_mushroom",\
	item: { id: "minecraft:red_mushroom" },\
	translation: "block.minecraft.red_mushroom",\
	icon: "000e",\
	categories: [ "fetchr:mushroom" ]\
}

# 000f: brown_mushroom
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:brown_mushroom",\
	item: { id: "minecraft:brown_mushroom" },\
	translation: "block.minecraft.brown_mushroom",\
	icon: "000f",\
	categories: [ "fetchr:mushroom" ]\
}

# 0010: mushroom_stew
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:mushroom_stew",\
	item: { id: "minecraft:mushroom_stew" },\
	translation: "item.minecraft.mushroom_stew",\
	icon: "0010",\
	categories: [ "fetchr:mushroom" ]\
}

# 0011: carrot
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:carrot",\
	item: { id: "minecraft:carrot" },\
	translation: "item.minecraft.carrot",\
	icon: "0011",\
	categories: [ "fetchr:shipwreck" ]\
}

# 0012: potato
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:potato",\
	item: { id: "minecraft:potato" },\
	translation: "item.minecraft.potato",\
	icon: "0012",\
	categories: [ "fetchr:village", "fetchr:shipwreck" ]\
}

# 0013: glass_bottle
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:glass_bottle",\
	item: { id: "minecraft:glass_bottle" },\
	translation: "item.minecraft.glass_bottle",\
	icon: "0013",\
	categories: [ "fetchr:glass" ]\
}

# 0014: cherry_sapling
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:cherry_sapling",\
	item: { id: "minecraft:cherry_sapling" },\
	translation: "block.minecraft.cherry_sapling",\
	icon: "0014",\
	categories: [ "fetchr:cherry_grove" ]\
}

# 0015: cherry_chest_boat
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:cherry_chest_boat",\
	item: { id: "minecraft:cherry_chest_boat" },\
	translation: "item.minecraft.cherry_chest_boat",\
	icon: "0015",\
	categories: [ "fetchr:cherry_grove" ]\
}

# 0016: pink_petals
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:pink_petals",\
	item: { id: "minecraft:pink_petals" },\
	translation: "block.minecraft.pink_petals",\
	icon: "0016",\
	categories: [ "fetchr:cherry_grove" ]\
}

# 0017: pointed_dripstone
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:pointed_dripstone",\
	item: { id: "minecraft:pointed_dripstone" },\
	translation: "block.minecraft.pointed_dripstone",\
	icon: "0017",\
	categories: [ "fetchr:dripstone_cave" ]\
}

# 0018: glow_berries
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:glow_berries",\
	item: { id: "minecraft:glow_berries" },\
	translation: "item.minecraft.glow_berries",\
	icon: "0018",\
	categories: [ "fetchr:lush_caves" ]\
}

# 0019: fern
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:fern",\
	item: { id: "minecraft:fern" },\
	translation: "block.minecraft.fern",\
	icon: "0019",\
	categories: [ "fetchr:jungle", "fetchr:taiga" ]\
}

# 001a: melon_slice
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:melon_slice",\
	item: { id: "minecraft:melon_slice" },\
	translation: "item.minecraft.melon_slice",\
	icon: "001a",\
	categories: [ "fetchr:jungle" ]\
}

# 001b: cocoa_beans
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:cocoa_beans",\
	item: { id: "minecraft:cocoa_beans" },\
	translation: "item.minecraft.cocoa_beans",\
	icon: "001b",\
	categories: [ "fetchr:jungle" ]\
}

# 001c: bamboo
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:bamboo",\
	item: { id: "minecraft:bamboo" },\
	translation: "block.minecraft.bamboo",\
	icon: "001c",\
	categories: [ "fetchr:jungle" ]\
}

# 001d: mangrove_propagule
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:mangrove_propagule",\
	item: { id: "minecraft:mangrove_propagule" },\
	translation: "block.minecraft.mangrove_propagule",\
	icon: "001d",\
	categories: [ "fetchr:mangrove" ]\
}

# 001e: apple
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:apple",\
	item: { id: "minecraft:apple" },\
	translation: "item.minecraft.apple",\
	icon: "001e",\
	categories: [ "fetchr:oak", "fetchr:dark_oak" ]\
}

# 001f: oak_sapling
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:oak_sapling",\
	item: { id: "minecraft:oak_sapling" },\
	translation: "block.minecraft.oak_sapling",\
	icon: "001f",\
	categories: [ "fetchr:oak" ]\
}

# 0020: dark_oak_sapling
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:dark_oak_sapling",\
	item: { id: "minecraft:dark_oak_sapling" },\
	translation: "block.minecraft.dark_oak_sapling",\
	icon: "0020",\
	categories: [ "fetchr:dark_oak" ]\
}

# 0021: pale_hanging_moss
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:pale_hanging_moss",\
	item: { id: "minecraft:pale_hanging_moss" },\
	translation: "block.minecraft.pale_hanging_moss",\
	icon: "0021",\
	categories: [ "fetchr:pale_garden" ]\
}

# 0022: resin_clump
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:resin_clump",\
	item: { id: "minecraft:resin_clump" },\
	translation: "block.minecraft.resin_clump",\
	icon: "0022",\
	categories: [ "fetchr:pale_garden" ]\
}

# 0023: acacia_sapling
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:acacia_sapling",\
	item: { id: "minecraft:acacia_sapling" },\
	translation: "block.minecraft.acacia_sapling",\
	icon: "0023",\
	categories: [ "fetchr:savanna" ]\
}

# 0024: acacia_hanging_sign
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:acacia_hanging_sign",\
	item: { id: "minecraft:acacia_hanging_sign" },\
	translation: "block.minecraft.acacia_hanging_sign",\
	icon: "0024",\
	categories: [ "fetchr:savanna" ]\
}

# 0025: spruce_sapling
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:spruce_sapling",\
	item: { id: "minecraft:spruce_sapling" },\
	translation: "block.minecraft.spruce_sapling",\
	icon: "0025",\
	categories: [ "fetchr:taiga" ]\
}

# 0026: cactus_flower
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:cactus_flower",\
	item: { id: "minecraft:cactus_flower" },\
	translation: "block.minecraft.cactus_flower",\
	icon: "0026",\
	categories: [ "fetchr:desert" ]\
}

# 0027: short_dry_grass
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:short_dry_grass",\
	item: { id: "minecraft:short_dry_grass" },\
	translation: "block.minecraft.short_dry_grass",\
	icon: "0027",\
	categories: [ "fetchr:desert" ]\
}

# 0028: tall_dry_grass
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:tall_dry_grass",\
	item: { id: "minecraft:tall_dry_grass" },\
	translation: "block.minecraft.tall_dry_grass",\
	icon: "0028",\
	categories: [ "fetchr:desert" ]\
}

# 0029: dead_bush
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:dead_bush",\
	item: { id: "minecraft:dead_bush" },\
	translation: "block.minecraft.dead_bush",\
	icon: "0029",\
	categories: [ "fetchr:desert" ]\
}

# 002a: lily_pad
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:lily_pad",\
	item: { id: "minecraft:lily_pad" },\
	translation: "block.minecraft.lily_pad",\
	icon: "002a",\
	categories: [ "fetchr:swamp" ]\
}

# 002b: firefly_bush
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:firefly_bush",\
	item: { id: "minecraft:firefly_bush" },\
	translation: "block.minecraft.firefly_bush",\
	icon: "002b",\
	categories: [ "fetchr:swamp" ]\
}

# 002c: vine
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:vine",\
	item: { id: "minecraft:vine" },\
	translation: "block.minecraft.vine",\
	icon: "002c",\
	categories: [ "fetchr:swamp", "fetchr:jungle" ]\
}

# 002d: green_dye
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:green_dye",\
	item: { id: "minecraft:green_dye" },\
	translation: "item.minecraft.green_dye",\
	icon: "002d",\
	categories: [ "fetchr:desert" ]\
}
 
# 002e: soul_torch
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:soul_torch",\
	item: { id: "minecraft:soul_torch" },\
	translation: "block.minecraft.soul_torch",\
	icon: "002e",\
	categories: [ "fetchr:soulsand_valley", "fetchr:nether_fortress", "fetchr:ancient_city" ]\
}

# 002f: soul_campfire
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:soul_campfire",\
	item: { id: "minecraft:soul_campfire" },\
	translation: "block.minecraft.soul_campfire",\
	icon: "002f",\
	categories: [ "fetchr:soulsand_valley", "fetchr:nether_fortress", "fetchr:ancient_city" ]\
}

# 0030: crimson_fungus
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:crimson_fungus",\
	item: { id: "minecraft:crimson_fungus" },\
	translation: "block.minecraft.crimson_fungus",\
	icon: "0030",\
	categories: [ "fetchr:crimson" ]\
}

# 0031: crimson_roots
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:crimson_roots",\
	item: { id: "minecraft:crimson_roots" },\
	translation: "block.minecraft.crimson_roots",\
	icon: "0031",\
	categories: [ "fetchr:crimson" ]\
}

# 0032: warped_fungus
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:warped_fungus",\
	item: { id: "minecraft:warped_fungus" },\
	translation: "block.minecraft.warped_fungus",\
	icon: "0032",\
	categories: [ "fetchr:warped_forest" ]\
}

# 0033: warped_roots
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:warped_roots",\
	item: { id: "minecraft:warped_roots" },\
	translation: "block.minecraft.warped_roots",\
	icon: "0033",\
	categories: [ "fetchr:warped_forest" ]\
}

# 0034: chorus_fruit
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:chorus_fruit",\
	item: { id: "minecraft:chorus_fruit" },\
	translation: "item.minecraft.chorus_fruit",\
	icon: "0034",\
	categories: [ "fetchr:end" ]\
}

# 0035: candle
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:candle",\
	item: { id: "minecraft:candle" },\
	translation: "block.minecraft.candle",\
	icon: "0035",\
	categories: [ "fetchr:ancient_city" ]\
}

# 0036: experience_bottle
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:experience_bottle",\
	item: { id: "minecraft:experience_bottle" },\
	translation: "item.minecraft.experience_bottle",\
	icon: "0036",\
	categories: [ "fetchr:ancient_city" ]\
}

# 0037: echo_shard
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:echo_shard",\
	item: { id: "minecraft:echo_shard" },\
	translation: "item.minecraft.echo_shard",\
	icon: "0037",\
	categories: [ "fetchr:ancient_city" ]\
}

# 0038: disc_fragment_5
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:disc_fragment_5",\
	item: { id: "minecraft:disc_fragment_5" },\
	translation: "item.minecraft.disc_fragment_5",\
	icon: "0038",\
	categories: [ "fetchr:ancient_city" ]\
}

# 0039: string
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:string",\
	item: { id: "minecraft:string" },\
	translation: "item.minecraft.string",\
	icon: "0039",\
	categories: [ "fetchr:mineshaft", "fetchr:spider" ]\
}

# 003a: spider_eye
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:spider_eye",\
	item: { id: "minecraft:spider_eye" },\
	translation: "item.minecraft.spider_eye",\
	icon: "003a",\
	categories: [ "fetchr:mineshaft", "fetchr:spider" ]\
}

# 003b: cobweb
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:cobweb",\
	item: { id: "minecraft:cobweb" },\
	translation: "block.minecraft.cobweb",\
	icon: "003b",\
	categories: [ "fetchr:mineshaft" ]\
}

# 003c: arrow
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:arrow",\
	item: { id: "minecraft:arrow" },\
	translation: "item.minecraft.arrow",\
	icon: "003c",\
	categories: [ "fetchr:skeleton" ]\
}

# 003d: shulker_shell
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:shulker_shell",\
	item: { id: "minecraft:shulker_shell" },\
	translation: "item.minecraft.shulker_shell",\
	icon: "003d",\
	categories: [ "fetchr:end_city", "fetchr:shulker" ]\
}

# 003e: nether_wart
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:nether_wart",\
	item: { id: "minecraft:nether_wart" },\
	translation: "block.minecraft.nether_wart",\
	icon: "003e",\
	categories: [ "fetchr:nether_fortress" ]\
}

# 003f: blaze_rod
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:blaze_rod",\
	item: { id: "minecraft:blaze_rod" },\
	translation: "item.minecraft.blaze_rod",\
	icon: "003f",\
	categories: [ "fetchr:nether_fortress", "fetchr:blaze" ]\
}

# 0040: blaze_powder
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:blaze_powder",\
	item: { id: "minecraft:blaze_powder" },\
	translation: "item.minecraft.blaze_powder",\
	icon: "0040",\
	categories: [ "fetchr:nether_fortress", "fetchr:blaze" ]\
}

# 0041: emerald
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:emerald",\
	item: { id: "minecraft:emerald" },\
	translation: "item.minecraft.emerald",\
	icon: "0041",\
	categories: [ "fetchr:emerald", "fetchr:shipwreck", "fetchr:village", "fetchr:evoker" ]\
}

# 0042: heart_of_the_sea
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:heart_of_the_sea",\
	item: { id: "minecraft:heart_of_the_sea" },\
	translation: "item.minecraft.heart_of_the_sea",\
	icon: "0042",\
	categories: [ "fetchr:shipwreck" ]\
}

# 0043: bell
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:bell",\
	item: { id: "minecraft:bell" },\
	translation: "block.minecraft.bell",\
	icon: "0043",\
	categories: [ "fetchr:village" ]\
}

# 0044: armadillo_scute
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:armadillo_scute",\
	item: { id: "minecraft:armadillo_scute" },\
	translation: "item.minecraft.armadillo_scute",\
	icon: "0044",\
	categories: [ "fetchr:armadillo" ]\
}

# 0045: axolotl_bucket
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:axolotl_bucket",\
	item: { id: "minecraft:axolotl_bucket" },\
	translation: "item.minecraft.axolotl_bucket",\
	icon: "0045",\
	categories: [ "fetchr:axolotl" ]\
}

# 0046: feather
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:feather",\
	item: { id: "minecraft:feather" },\
	translation: "item.minecraft.feather",\
	icon: "0046",\
	categories: [ "fetchr:chicken", "fetchr:hot_chicken", "fetchr:cold_chicken", "fetchr:parrot" ]\
}

# 0047: egg
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:egg",\
	item: { id: "minecraft:egg" },\
	translation: "item.minecraft.egg",\
	icon: "0047",\
	categories: [ "fetchr:chicken" ]\
}

# 0048: cooked_chicken
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:cooked_chicken",\
	item: { id: "minecraft:cooked_chicken" },\
	translation: "item.minecraft.cooked_chicken",\
	icon: "0048",\
	categories: [ "fetchr:chicken" ]\
}

# 0049: blue_egg
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:blue_egg",\
	item: { id: "minecraft:blue_egg" },\
	translation: "item.minecraft.blue_egg",\
	icon: "0049",\
	categories: [ "fetchr:cold_chicken" ]\
}

# 004a: brown_egg
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:brown_egg",\
	item: { id: "minecraft:brown_egg" },\
	translation: "item.minecraft.brown_egg",\
	icon: "004a",\
	categories: [ "fetchr:hot_chicken" ]\
}

# 004b: leather
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:leather",\
	item: { id: "minecraft:leather" },\
	translation: "item.minecraft.leather",\
	icon: "004b",\
	categories: [ "fetchr:cow", "fetchr:hoglin", "fetchr:batering" ]\
}

# 004c: cooked_beef
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:cooked_beef",\
	item: { id: "minecraft:cooked_beef" },\
	translation: "item.minecraft.cooked_beef",\
	icon: "004c",\
	categories: [ "fetchr:cow" ]\
}

# 004d: milk_bucket
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:milk_bucket",\
	item: { id: "minecraft:milk_bucket" },\
	translation: "item.minecraft.milk_bucket",\
	icon: "004d",\
	categories: [ "fetchr:cow", "fetchr:goat" ]\
}

# 004e: goat_horn
# CANNOT RESIST D:
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:goat_horn",\
	item: { id: "minecraft:goat_horn" },\
	translation: "item.minecraft.goat_horn",\
	icon: "004e",\
	categories: [ "fetchr:goat" ]\
}

# 004f: porkchop
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:porkchop",\
	item: { id: "minecraft:porkchop" },\
	translation: "item.minecraft.porkchop",\
	icon: "004f",\
	categories: [ "fetchr:pig", "fetchr:hoglin" ]\
}

# 0050: cooked_porkchop
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:cooked_porkchop",\
	item: { id: "minecraft:cooked_porkchop" },\
	translation: "item.minecraft.cooked_porkchop",\
	icon: "0050",\
	categories: [ "fetchr:pig", "fetchr:hoglin" ]\
}

# 0051: painting
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:painting",\
	item: { id: "minecraft:painting" },\
	translation: "item.minecraft.painting",\
	icon: "0051",\
	categories: [ "fetchr:sheep", "fetchr:spider" ]\
}

# 0052: cod
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:cod",\
	item: { id: "minecraft:cod" },\
	translation: "item.minecraft.cod",\
	icon: "0052",\
	categories: [ "fetchr:fish", "fetchr:cod_salmon", "fetchr:guardian" ]\
}

# 0053: salmon
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:salmon",\
	item: { id: "minecraft:salmon" },\
	translation: "item.minecraft.salmon",\
	icon: "0053",\
	categories: [ "fetchr:fish", "fetchr:cod_salmon", "fetchr:salmon", "fetchr:guardian" ]\
}

# 0054: tropical_fish
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:tropical_fish",\
	item: { id: "minecraft:tropical_fish" },\
	translation: "item.minecraft.tropical_fish",\
	icon: "0054",\
	categories: [ "fetchr:fish", "fetchr:guardian" ]\
}

# 0055: ink_sac
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:ink_sac",\
	item: { id: "minecraft:ink_sac" },\
	translation: "item.minecraft.ink_sac",\
	icon: "0055",\
	categories: [ "fetchr:ink" ]\
}

# 0056: black_dye
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:black_dye",\
	item: { id: "minecraft:black_dye" },\
	translation: "item.minecraft.black_dye",\
	icon: "0056",\
	categories: [ "fetchr:ink" ]\
}

# 0057: glow_ink_sac
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:glow_ink_sac",\
	item: { id: "minecraft:glow_ink_sac" },\
	translation: "item.minecraft.glow_ink_sac",\
	icon: "0057",\
	categories: [ "fetchr:glow_ink" ]\
}

# 0058: gunpowder
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:gunpowder",\
	item: { id: "minecraft:gunpowder" },\
	translation: "item.minecraft.gunpowder",\
	icon: "0058",\
	categories: [ "fetchr:creeper", "fetchr:ghast" ]\
}

# 0059: ender_pearl
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:ender_pearl",\
	item: { id: "minecraft:ender_pearl" },\
	translation: "item.minecraft.ender_pearl",\
	icon: "0059",\
	categories: [ "fetchr:enderman", "fetchr:batering" ]\
}

# 005a: bone
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:bone",\
	item: { id: "minecraft:bone" },\
	translation: "item.minecraft.bone",\
	icon: "005a",\
	categories: [ "fetchr:skeleton" ]\
}

# 005b: bone_meal
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:bone_meal",\
	item: { id: "minecraft:bone_meal" },\
	translation: "item.minecraft.bone_meal",\
	icon: "005b",\
	categories: [ "fetchr:skeleton", "fetchr:soulsand_valley" ]\
}

# 005c: rotten_flesh
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:rotten_flesh",\
	item: { id: "minecraft:rotten_flesh" },\
	translation: "item.minecraft.rotten_flesh",\
	icon: "005c",\
	categories: [ "fetchr:zombie" ]\
}

# 005d: slime_ball
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:slime_ball",\
	item: { id: "minecraft:slime_ball" },\
	translation: "item.minecraft.slime_ball",\
	icon: "005d",\
	categories: [ "fetchr:slime" ]\
}

# 005e: glowstone_dust
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:glowstone_dust",\
	item: { id: "minecraft:glowstone_dust" },\
	translation: "item.minecraft.glowstone_dust",\
	icon: "005e",\
	categories: [ "fetchr:glowstone" ]\
}

# 005f: magma_cream
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:magma_cream",\
	item: { id: "minecraft:magma_cream" },\
	translation: "item.minecraft.magma_cream",\
	icon: "005f",\
	categories: [ "fetchr:magma_cube" ]\
}

# 0060: brewing_stand
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:brewing_stand",\
	item: { id: "minecraft:brewing_stand" },\
	translation: "block.minecraft.brewing_stand",\
	icon: "0060",\
	categories: [ "fetchr:blaze", "fetchr:nether_fortress" ]\
}

# 0061: breeze_rod
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:breeze_rod",\
	item: { id: "minecraft:breeze_rod" },\
	translation: "item.minecraft.breeze_rod",\
	icon: "0061",\
	categories: [ "fetchr:breeze" ]\
}

# 0062: wind_charge
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:wind_charge",\
	item: { id: "minecraft:wind_charge" },\
	translation: "item.minecraft.wind_charge",\
	icon: "0062",\
	categories: [ "fetchr:breeze" ]\
}

# 0063: totem_of_undying
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:totem_of_undying",\
	item: { id: "minecraft:totem_of_undying" },\
	translation: "item.minecraft.totem_of_undying",\
	icon: "0063",\
	categories: [ "fetchr:evoker" ]\
}

# 0064: sadgle
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:sadgle",\
	item: { id: "minecraft:saddle" },\
	translation: "item.minecraft.saddle",\
	icon: "0064",\
	categories: [ "fetchr:sadgle" ]\
}

# 0065: prismarine_shard
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:prismarine_shard",\
	item: { id: "minecraft:prismarine_shard" },\
	translation: "item.minecraft.prismarine_shard",\
	icon: "0065",\
	categories: [ "fetchr:guardian" ]\
}

# 0066: prismarine_crystals
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:prismarine_crystals",\
	item: { id: "minecraft:prismarine_crystals" },\
	translation: "item.minecraft.prismarine_crystals",\
	icon: "0066",\
	categories: [ "fetchr:guardian" ]\
}

# 0067: ghast_tear
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:ghast_tear",\
	item: { id: "minecraft:ghast_tear" },\
	translation: "item.minecraft.ghast_tear",\
	icon: "0067",\
	categories: [ "fetchr:ghast" ]\
}

# 0068: fire_charge
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:fire_charge",\
	item: { id: "minecraft:fire_charge" },\
	translation: "item.minecraft.fire_charge",\
	icon: "0068",\
	categories: [ "fetchr:batering" ]\
}

# 0100: iron_block
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:iron_block",\
	item: { id: "minecraft:iron_block" },\
	translation: "block.minecraft.iron_block",\
	icon: "0100",\
	categories: [ "fetchr:basic_iron" ]\
}

# 0101: raw_iron_block
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:raw_iron_block",\
	item: { id: "minecraft:raw_iron_block" },\
	translation: "block.minecraft.raw_iron_block",\
	icon: "0101",\
	categories: [ "fetchr:basic_iron" ]\
}

# 0102: lodestone
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:lodestone",\
	item: { id: "minecraft:lodestone" },\
	translation: "block.minecraft.lodestone",\
	icon: "0102",\
	categories: [ "fetchr:basic_iron" ]\
}

# 0103: cut_copper
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:cut_copper",\
	item: { id: "minecraft:cut_copper" },\
	translation: "block.minecraft.cut_copper",\
	icon: "0103",\
	categories: [ "fetchr:copper" ]\
}

# 0104: raw_copper_block
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:raw_copper_block",\
	item: { id: "minecraft:raw_copper_block" },\
	translation: "block.minecraft.raw_copper_block",\
	icon: "0104",\
	categories: [ "fetchr:copper" ]\
}

# 0105: fletching_table
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:fletching_table",\
	item: { id: "minecraft:fletching_table" },\
	translation: "block.minecraft.fletching_table",\
	icon: "0105",\
	categories: [ "fetchr:flint", "fetchr:village" ]\
}

# 0106: furnace
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:furnace",\
	item: { id: "minecraft:furnace" },\
	translation: "block.minecraft.furnace",\
	icon: "0106",\
	categories: [ "fetchr:furnace" ]\
}

# 0107: smoker
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:smoker",\
	item: { id: "minecraft:smoker" },\
	translation: "block.minecraft.smoker",\
	icon: "0107",\
	categories: [ "fetchr:furnace" ]\
}

# 0108: raw_gold_block
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:raw_gold_block",\
	item: { id: "minecraft:raw_gold_block" },\
	translation: "block.minecraft.raw_gold_block",\
	icon: "0108",\
	categories: [ "fetchr:gold" ]\
}

# 0109: gold_block
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:gold_block",\
	item: { id: "minecraft:gold_block" },\
	translation: "block.minecraft.gold_block",\
	icon: "0109",\
	categories: [ "fetchr:gold" ]\
}

# 010a: lapis_block
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:lapis_block",\
	item: { id: "minecraft:lapis_block" },\
	translation: "block.minecraft.lapis_block",\
	icon: "010a",\
	categories: [ "fetchr:lapis" ]\
}

# 010b: magma_block
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:magma_block",\
	item: { id: "minecraft:magma_block" },\
	translation: "block.minecraft.magma_block",\
	icon: "010b",\
	categories: [ "fetchr:magma", "fetchr:magma_cube" ]\
}

# 010c: glass
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:glass",\
	item: { id: "minecraft:glass" },\
	translation: "block.minecraft.glass",\
	icon: "010c",\
	categories: [ "fetchr:glass" ]\
}

# 010d: cobbled_deepslate
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:cobbled_deepslate",\
	item: { id: "minecraft:cobbled_deepslate" },\
	translation: "block.minecraft.cobbled_deepslate",\
	icon: "010d",\
	categories: [ "fetchr:deepslate" ]\
}

# 010e: deepslate
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:deepslate",\
	item: { id: "minecraft:deepslate" },\
	translation: "block.minecraft.deepslate",\
	icon: "010e",\
	categories: [ "fetchr:deepslate" ]\
}

# 010f: cracked_deepslate_bricks
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:cracked_deepslate_bricks",\
	item: { id: "minecraft:cracked_deepslate_bricks" },\
	translation: "block.minecraft.cracked_deepslate_bricks",\
	icon: "010f",\
	categories: [ "fetchr:deepslate" ]\
}

# 0110: cherry_leaves
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:cherry_leaves",\
	item: { id: "minecraft:cherry_leaves" },\
	translation: "block.minecraft.cherry_leaves",\
	icon: "0110",\
	categories: [ "fetchr:cherry_grove" ]\
}

# 0111: dripstone_block
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:dripstone_block",\
	item: { id: "minecraft:dripstone_block" },\
	translation: "block.minecraft.dripstone_block",\
	icon: "0111",\
	categories: [ "fetchr:dripstone_cave" ]\
}

# 0112: flowering_azalea
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:flowering_azalea",\
	item: { id: "minecraft:flowering_azalea" },\
	translation: "block.minecraft.flowering_azalea",\
	icon: "0112",\
	categories: [ "fetchr:lush_caves" ]\
}

# 0113: big_dripleaf
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:big_dripleaf",\
	item: { id: "minecraft:big_dripleaf" },\
	translation: "block.minecraft.big_dripleaf",\
	icon: "0113",\
	categories: [ "fetchr:lush_caves" ]\
}

# 0114: jungle_leaves
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:jungle_leaves",\
	item: { id: "minecraft:jungle_leaves" },\
	translation: "block.minecraft.jungle_leaves",\
	icon: "0114",\
	categories: [ "fetchr:jungle" ]\
}

# 0115: mud
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:mud",\
	item: { id: "minecraft:mud" },\
	translation: "block.minecraft.mud",\
	icon: "0115",\
	categories: [ "fetchr:mangrove" ]\
}

# 0116: muddy_mangrove_roots
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:muddy_mangrove_roots",\
	item: { id: "minecraft:muddy_mangrove_roots" },\
	translation: "block.minecraft.muddy_mangrove_roots",\
	icon: "0116",\
	categories: [ "fetchr:mangrove" ]\
}

# 0117: oak_leaves
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:oak_leaves",\
	item: { id: "minecraft:oak_leaves" },\
	translation: "block.minecraft.oak_leaves",\
	icon: "0117",\
	categories: [ "fetchr:oak" ]\
}

# 0118: dark_oak_leaves
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:dark_oak_leaves",\
	item: { id: "minecraft:dark_oak_leaves" },\
	translation: "block.minecraft.dark_oak_leaves",\
	icon: "0118",\
	categories: [ "fetchr:dark_oak" ]\
}

# 0119: pale_moss_carpet
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:pale_moss_carpet",\
	item: { id: "minecraft:pale_moss_carpet" },\
	translation: "block.minecraft.pale_moss_carpet",\
	icon: "0119",\
	categories: [ "fetchr:pale_garden" ]\
}

# 011a: acacia_leaves
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:acacia_leaves",\
	item: { id: "minecraft:acacia_leaves" },\
	translation: "block.minecraft.acacia_leaves",\
	icon: "011a",\
	categories: [ "fetchr:savanna" ]\
}

# 011b: spruce_leaves
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:spruce_leaves",\
	item: { id: "minecraft:spruce_leaves" },\
	translation: "block.minecraft.spruce_leaves",\
	icon: "011b",\
	categories: [ "fetchr:taiga" ]\
}

# 011c: snow
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:snow",\
	item: { id: "minecraft:snow" },\
	translation: "block.minecraft.snow",\
	icon: "011c",\
	categories: [ "fetchr:snow" ]\
}

# 011d: snow_block
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:snow_block",\
	item: { id: "minecraft:snow_block" },\
	translation: "block.minecraft.snow_block",\
	icon: "011d",\
	categories: [ "fetchr:snow" ]\
}

# 011e: cactus
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:cactus",\
	item: { id: "minecraft:cactus" },\
	translation: "block.minecraft.cactus",\
	icon: "011e",\
	categories: [ "fetchr:desert" ]\
}

# 011f: soul_sand
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:soul_sand",\
	item: { id: "minecraft:soul_sand" },\
	translation: "block.minecraft.soul_sand",\
	icon: "011f",\
	categories: [ "fetchr:soulsand_valley", "fetchr:nether_fortress" ]\
}

# 0120: soul_soil
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:soul_soil",\
	item: { id: "minecraft:soul_soil" },\
	translation: "block.minecraft.soul_soil",\
	icon: "0120",\
	categories: [ "fetchr:soulsand_valley" ]\
}

# 0121: basalt
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:basalt",\
	item: { id: "minecraft:basalt" },\
	translation: "block.minecraft.basalt",\
	icon: "0121",\
	categories: [ "fetchr:basalt" ]\
}

# 0122: smooth_basalt
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:smooth_basalt",\
	item: { id: "minecraft:smooth_basalt" },\
	translation: "block.minecraft.smooth_basalt",\
	icon: "0122",\
	categories: [ "fetchr:basalt" ]\
}

# 0123: polished_basalt
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:polished_basalt",\
	item: { id: "minecraft:polished_basalt" },\
	translation: "block.minecraft.polished_basalt",\
	icon: "0123",\
	categories: [ "fetchr:basalt" ]\
}

# 0124: nether_wart_block
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:nether_wart_block",\
	item: { id: "minecraft:nether_wart_block" },\
	translation: "block.minecraft.nether_wart_block",\
	icon: "0124",\
	categories: [ "fetchr:crimson", "fetchr:nether_fortress" ]\
}

# 0125: warped_wart_block
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:warped_wart_block",\
	item: { id: "minecraft:warped_wart_block" },\
	translation: "block.minecraft.warped_wart_block",\
	icon: "0125",\
	categories: [ "fetchr:warped_forest" ]\
}

# 0126: chorus_flower
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:chorus_flower",\
	item: { id: "minecraft:chorus_flower" },\
	translation: "block.minecraft.chorus_flower",\
	icon: "0126",\
	categories: [ "fetchr:end" ]\
}

# 0127: sculk_sensor
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:sculk_sensor",\
	item: { id: "minecraft:sculk_sensor" },\
	translation: "block.minecraft.sculk_sensor",\
	icon: "0127",\
	categories: [ "fetchr:ancient_city" ]\
}

# 0128: sculk
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:sculk",\
	item: { id: "minecraft:sculk" },\
	translation: "block.minecraft.sculk",\
	icon: "0128",\
	categories: [ "fetchr:ancient_city" ]\
}

# 0129: shulker_box
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:shulker_box",\
	item: { id: "minecraft:shulker_box" },\
	translation: "block.minecraft.shulker_box",\
	icon: "0129",\
	categories: [ "fetchr:end_city", "fetchr:shulker" ]\
}

# 012a: gilded_blackstone
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:gilded_blackstone",\
	item: { id: "minecraft:gilded_blackstone" },\
	translation: "block.minecraft.gilded_blackstone",\
	icon: "012a",\
	categories: [ "fetchr:bastion_remnant" ]\
}

# 012b: white_wool
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:white_wool",\
	item: { id: "minecraft:white_wool" },\
	translation: "block.minecraft.white_wool",\
	icon: "012b",\
	categories: [ "fetchr:sheep", "fetchr:spider" ]\
}

# 012c: bone_block
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:bone_block",\
	item: { id: "minecraft:bone_block" },\
	translation: "block.minecraft.bone_block",\
	icon: "012c",\
	categories: [ "fetchr:skeleton", "fetchr:soulsand_valley" ]\
}

# 012d: slime_block
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:slime_block",\
	item: { id: "minecraft:slime_block" },\
	translation: "block.minecraft.slime_block",\
	icon: "012d",\
	categories: [ "fetchr:slime" ]\
}

# 012e: glowstone
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:glowstone",\
	item: { id: "minecraft:glowstone" },\
	translation: "block.minecraft.glowstone",\
	icon: "012e",\
	categories: [ "fetchr:glowstone" ]\
}

# 012f: end_rod
data \
	modify storage fetchr:registries items append value {\
	id: "fetchr:end_rod",\
	item: { id: "minecraft:end_rod" },\
	translation: "block.minecraft.end_rod",\
	icon: "012f",\
	categories: [ "fetchr:end_city" ]\
}


# structures
data modify storage fetchr:registries structures append value "fetchr:credits"
data modify storage fetchr:registries structures append value "fetchr:card_generation"
data modify storage fetchr:registries structures append value "fetchr:tutorial"

# hud components

# preference pages
data \
	modify storage fetchr:registries hud_components append value {\
	id: "fetchr:timer",\
	addByDefault: true,\
	preferredColumn: 0,\
	name: { translate: "fetchr.custom_hud.components.timer" },\
	iconWidth: "\u0008",\
	iconSeparator: " ",\
	iconFont: [\
		{ text: "", font: "fetchr:clock/line0" },\
		{ text: "", font: "fetchr:clock/line1" },\
		{ text: "", font: "fetchr:clock/line2" },\
		{ text: "", font: "fetchr:clock/line3" },\
		{ text: "", font: "fetchr:clock/line4" },\
		{ text: "", font: "fetchr:clock/line5" },\
		{ text: "", font: "fetchr:clock/line6" },\
		{ text: "", font: "fetchr:clock/line7" },\
		{ text: "", font: "fetchr:clock/line8" },\
		{ text: "", font: "fetchr:clock/line9" },\
		{ text: "", font: "fetchr:clock/line10" }\
	]\
}
data \
	modify storage fetchr:registries hud_components append value {\
	id: "fetchr:y_position",\
	addByDefault: true,\
	preferredColumn: 1,\
	name: { translate: "fetchr.custom_hud.components.y_position" }\
}
data \
	modify storage fetchr:registries hud_components append value {\
	id: "fetchr:player_chunk_position",\
	addByDefault: true,\
	preferredColumn: 1,\
	name: { translate: "fetchr.custom_hud.components.player_chunk_position" },\
	settingsClickEvent: { text: "", click_event: { action: "run_command", command: "trigger fetchr.pref set 70" }},\
	iconWidth: "\u0008",\
	iconSeparator: " ",\
	iconFont: [\
		{ text: "", font: "fetchr:position/line0" },\
		{ text: "", font: "fetchr:position/line1" },\
		{ text: "", font: "fetchr:position/line2" },\
		{ text: "", font: "fetchr:position/line3" },\
		{ text: "", font: "fetchr:position/line4" },\
		{ text: "", font: "fetchr:position/line5" },\
		{ text: "", font: "fetchr:position/line6" },\
		{ text: "", font: "fetchr:position/line7" },\
		{ text: "", font: "fetchr:position/line8" },\
		{ text: "", font: "fetchr:position/line9" },\
		{ text: "", font: "fetchr:position/line10" }\
	],\
	icon: "c"\
}
data \
	modify storage fetchr:registries hud_components append value {\
	id: "fetchr:player_position",\
	addByDefault: true,\
	preferredColumn: 1,\
	name: { translate: "fetchr.custom_hud.components.player_position" },\
	settingsClickEvent: { text: "", click_event: { action: "run_command", command: "trigger fetchr.pref set 72" }},\
	iconWidth: "\u000a",\
	iconSeparator: " ",\
	iconFont: [\
		{ text: "", font: "fetchr:position/line0" },\
		{ text: "", font: "fetchr:position/line1" },\
		{ text: "", font: "fetchr:position/line2" },\
		{ text: "", font: "fetchr:position/line3" },\
		{ text: "", font: "fetchr:position/line4" },\
		{ text: "", font: "fetchr:position/line5" },\
		{ text: "", font: "fetchr:position/line6" },\
		{ text: "", font: "fetchr:position/line7" },\
		{ text: "", font: "fetchr:position/line8" },\
		{ text: "", font: "fetchr:position/line9" },\
		{ text: "", font: "fetchr:position/line10" }\
	]\
}
data \
	modify storage fetchr:registries hud_components append value {\
	id: "fetchr:seed",\
	addByDefault: true,\
	preferredColumn: 1,\
	icon: "s",\
	iconWidth: "\u0009",\
	iconSeparator: " ",\
	name: { translate: "fetchr.custom_hud.components.seed" },\
	settingsClickEvent: { text: "", click_event: { action: "run_command", command: "trigger fetchr.pref set 74" }},\
	iconFont: [\
		{ text: "", font: "fetchr:seed/line0" },\
		{ text: "", font: "fetchr:seed/line1" },\
		{ text: "", font: "fetchr:seed/line2" },\
		{ text: "", font: "fetchr:seed/line3" },\
		{ text: "", font: "fetchr:seed/line4" },\
		{ text: "", font: "fetchr:seed/line5" },\
		{ text: "", font: "fetchr:seed/line6" },\
		{ text: "", font: "fetchr:seed/line7" },\
		{ text: "", font: "fetchr:seed/line8" },\
		{ text: "", font: "fetchr:seed/line9" },\
		{ text: "", font: "fetchr:seed/line10" }\
	]\
}

# preference pages
data \
	modify storage fetchr:registries preferences.main append value {\
	id: "fetchr:spectator_mode",\
	textComponent: [{ translate: "fetchr.preferences.spectator_mode.title" }, ": ", { translate: "fetchr.preferences.spectator_mode.enabled" }],\
	hoverText: { translate: "fetchr.preferences.spectator_mode.description" },\
	clickEvent: { text: "", click_event: { action: "run_command", command: "trigger fetchr.pref set 2" }}\
}
data \
	modify storage fetchr:registries preferences.main append value {\
	id: "fetchr:custom_hud",\
	textComponent: { translate: "fetchr.preferences.custom_hud.title" },\
	hoverText: { translate: "fetchr.preferences.custom_hud.description" },\
	clickEvent: { text: "", click_event: { action: "run_command", command: "trigger fetchr.pref set 5" }}\
}
data \
	modify storage fetchr:registries preferences.custom_hud append value {\
	id: "fetchr:custom_hud/add_disabled",\
	textComponent: { translate: "fetchr.preferences.custom_hud.add_disabled.title" },\
	hoverText: { translate: "fetchr.preferences.custom_hud.add_disabled.description" },\
	disabledHoverText: { translate: "fetchr.preferences.custom_hud.add_disabled.disabled" },\
	clickEvent: { text: "", click_event: { action: "run_command", command: "trigger fetchr.pref set 6" }}\
}
data \
	modify storage fetchr:registries preferences.custom_hud append value {\
	id: "fetchr:custom_hud/adjust_col0",\
	textComponent: { translate: "fetchr.preferences.custom_hud.adjust_col0.title" },\
	hoverText: { translate: "fetchr.preferences.custom_hud.adjust_col.description" },\
	disabledHoverText: { translate: "fetchr.preferences.custom_hud.adjust_col.disabled" },\
	clickEvent: { text: "", click_event: { action: "run_command", command: "trigger fetchr.pref set 9" }}\
}
data \
	modify storage fetchr:registries preferences.custom_hud append value {\
	id: "fetchr:custom_hud/adjust_col1",\
	textComponent: { translate: "fetchr.preferences.custom_hud.adjust_col1.title" },\
	hoverText: { translate: "fetchr.preferences.custom_hud.adjust_col.description" },\
	disabledHoverText: { translate: "fetchr.preferences.custom_hud.adjust_col.disabled" },\
	clickEvent: { text: "", click_event: { action: "run_command", command: "trigger fetchr.pref set 10" }}\
}
data \
	modify storage fetchr:registries preferences.custom_hud append value {\
	id: "fetchr:custom_hud/adjust_card",\
	textComponent: { translate: "fetchr.preferences.custom_hud.adjust_card.title" },\
	hoverText: { translate: "fetchr.preferences.custom_hud.adjust_card.description" },\
	clickEvent: { text: "", click_event: { action: "run_command", command: "trigger fetchr.pref set 11" }}\
}
data \
	modify storage fetchr:registries preferences.adjust_card append value {\
	id: "fetchr:custom_hud/adjust_card/left_of_hotbar",\
	textComponent: { translate: "fetchr.preferences.custom_hud.adjust_card.left_of_hotbar.title" },\
	hoverText: { translate: "fetchr.preferences.custom_hud.adjust_card.left_of_hotbar.description" },\
	clickEvent: { text: "", click_event: { action: "run_command", command: "trigger fetchr.pref set 67" }}\
}
data \
	modify storage fetchr:registries preferences.adjust_card append value {\
	id: "fetchr:custom_hud/adjust_card/right_of_hotbar_no_attack",\
	textComponent: { translate: "fetchr.preferences.custom_hud.adjust_card.right_of_hotbar_no_attack.title" },\
	hoverText: { translate: "fetchr.preferences.custom_hud.adjust_card.right_of_hotbar_no_attack.description" },\
	clickEvent: { text: "", click_event: { action: "run_command", command: "trigger fetchr.pref set 68" }}\
}
data \
	modify storage fetchr:registries preferences.adjust_card append value {\
	id: "fetchr:custom_hud/adjust_card/right_of_hotbar_with_attack",\
	textComponent: { translate: "fetchr.preferences.custom_hud.adjust_card.right_of_hotbar_with_attack.title" },\
	hoverText: { translate: "fetchr.preferences.custom_hud.adjust_card.right_of_hotbar_with_attack.description" },\
	clickEvent: { text: "", click_event: { action: "run_command", command: "trigger fetchr.pref set 69" }}\
}
