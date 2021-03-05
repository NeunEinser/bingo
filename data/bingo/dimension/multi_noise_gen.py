import random
import os

def write_biome(name, temperature, altitude, humidity, weirdness, offset):
	file.write('\n\t\t\t\t{{\n\t\t\t\t\t"biome": "{}",'.format(name))
	file.write('\n\t\t\t\t\t"parameters": {{\n\t\t\t\t\t\t"temperature": {},'.format(temperature))
	file.write('\n\t\t\t\t\t\t"altitude": {},'.format(altitude))
	file.write('\n\t\t\t\t\t\t"humidity": {},'.format(humidity))
	file.write('\n\t\t\t\t\t\t"weirdness": {},'.format(weirdness))
	file.write('\n\t\t\t\t\t\t"offset": {}\n\t\t\t\t\t}}\n\t\t\t\t}}'.format(offset))
def write_biome_list(temperature, climate_biomes, hill_biomes, altitude, hill_altitude, iterations):
	iterations = int(iterations / len(climate_biomes))

	for i in range(iterations):
		cur_biomes = climate_biomes.copy()
		cur_hill_biomes = hill_biomes.copy()
		step = 4.0 / (iterations * len(climate_biomes))

		for j in range (len(cur_biomes)):
			biome_index = random.randint(0, len(cur_biomes) - 1)
			humidity = 2.0 - ((i * len(climate_biomes) + j + 0.5) * step)

			write_biome(cur_biomes[biome_index], temperature, altitude, humidity, 0, 0)
			file.write(',')

			hill_biome = cur_hill_biomes[biome_index]
			if isinstance(hill_biome, list):
				hill_biome = hill_biome[random.randint(0, len(hill_biome) - 1)]
			write_biome(hill_biome, temperature, hill_altitude, humidity, 0, 0)

			cur_biomes.remove(cur_biomes[biome_index])
			cur_hill_biomes.remove(cur_hill_biomes[biome_index])
			if not (i == iterations - 1 and len(cur_biomes) == 0):
				file.write(',')
def write_biome_list_for_temperature (temperature, climate_biomes, hill_biomes, ocean_biomes, deep_ocean_biomes, iterations):
	write_biome_list(temperature, climate_biomes, hill_biomes, 0.1, 2, iterations)
	file.write(",")
	write_biome_list(temperature, ocean_biomes, deep_ocean_biomes, -0.25, -1.3, iterations)

file = open(os.path.dirname(__file__) + "/multi_noise.json", "w")
file.write('{\n\t"type": "minecraft:overworld",\n\t"generator": {\n\t\t"type": "minecraft:noise",\n\t\t"seed": 91,\n\t\t"settings": "minecraft:overworld",\n\t\t"biome_source": {\n\t\t\t"type": "minecraft:multi_noise",\n\t\t\t"seed": 91,\n\t\t\t"temperature_noise": {\n\t\t\t\t"firstOctave": -8,\n\t\t\t\t"amplitudes": [ 0, 0, 7, -2 ]\n\t\t\t},\n\t\t\t"altitude_noise": {\n\t\t\t\t"firstOctave": -7,\n\t\t\t\t"amplitudes": [ 0, 5, -10, 0.1, -1, 1 ]\n\t\t\t},\n\t\t\t"humidity_noise": {\n\t\t\t\t"firstOctave": -5,\n\t\t\t\t"amplitudes": [ 1.5, 1, -1.5, 0, 1.5, 1.1, -1.5, 0.5 ]\n\t\t\t},\n\t\t\t"weirdness_noise": {\n\t\t\t\t"firstOctave": -6,\n\t\t\t\t"amplitudes": [ 3 ]\n\t\t\t},\n\t\t\t"biomes": [')

warm_biomes = [
	"minecraft:desert", "minecraft:desert", "minecraft:desert",
	"minecraft:savanna", "minecraft:savanna",
	"minecraft:plains"
]
warm_hill_biomes = [
	"minecraft:desert_hills", "minecraft:desert_hills", "minecraft:desert_hills",
	"minecraft:savanna_plateau", "minecraft:savanna_plateau",
	[ "minecraft:forest", "minecraft:forest", "minecraft:wooded_hills" ]
]
warm_ocean_biomes = [
	"minecraft:warm_ocean",
	"minecraft:lukewarm_ocean"
]
warm_deep_ocean_biomes = [
	"minecraft:deep_warm_ocean",
	"minecraft:deep_lukewarm_ocean"
]


medium_biomes = [
	"minecraft:forest",
	"minecraft:dark_forest",
	"minecraft:mountains",
	"minecraft:plains",
	"minecraft:birch_forest",
	"minecraft:swamp"
]
medium_hill_biomes = [
	"minecraft:wooded_hills",
	"minecraft:plains",
	"minecraft:wooded_mountains",
	[ "minecraft:forest", "minecraft:forest", "minecraft:wooded_hills" ],
	"minecraft:birch_forest_hills",
	"minecraft:swamp"
]
medium_ocean_biomes = [
	"minecraft:ocean", "minecraft:ocean", "minecraft:ocean", "minecraft:ocean",
	"minecraft:lukewarm_ocean",
	"minecraft:cold_ocean"
]
medium_deep_ocean_biomes = [
	"minecraft:deep_ocean", "minecraft:deep_ocean", "minecraft:deep_ocean", "minecraft:deep_ocean",
	"minecraft:deep_lukewarm_ocean",
	"minecraft:deep_cold_ocean"
]

cold_biomes = [
	"minecraft:forest",
	"minecraft:mountains",
	"minecraft:taiga",
	"minecraft:plains"
]
cold_hill_biomes = [
	"minecraft:wooded_hills",
	"minecraft:wooded_mountains",
	"minecraft:taiga_hills",
	[ "minecraft:forest", "minecraft:forest", "minecraft:wooded_hills" ]
]
cold_ocean_biomes = [
	"minecraft:cold_ocean", "minecraft:cold_ocean", "minecraft:cold_ocean", "minecraft:cold_ocean",
	"minecraft:ocean"
]
cold_deep_ocean_biomes = [
	"minecraft:deep_cold_ocean", "minecraft:deep_cold_ocean", "minecraft:deep_cold_ocean", "minecraft:deep_cold_ocean",
	"minecraft:deep_ocean"
]

ice_biomes = [
	"minecraft:snowy_tundra", "minecraft:snowy_tundra", "minecraft:snowy_tundra",
	"minecraft:snowy_taiga"
]
ice_hill_biomes = [
	"minecraft:snowy_mountains", "minecraft:snowy_mountains", "minecraft:snowy_mountains",
	"minecraft:snowy_taiga_hills"
]
ice_ocean_biomes = [
	"minecraft:frozen_ocean"
]
ice_deep_ocean_biomes = [
	"minecraft:deep_frozen_ocean"
]

random.seed(91)
write_biome_list_for_temperature(0.6, warm_biomes, warm_hill_biomes, warm_ocean_biomes, warm_deep_ocean_biomes, 13)
file.write(',')
write_biome_list_for_temperature(0.25, medium_biomes, medium_hill_biomes, medium_ocean_biomes, medium_deep_ocean_biomes, 13)
file.write(',')
write_biome_list_for_temperature(-0.25, cold_biomes, cold_hill_biomes, cold_ocean_biomes, cold_deep_ocean_biomes, 13)
file.write(',')
write_biome_list_for_temperature(-0.6, ice_biomes, ice_hill_biomes, ice_ocean_biomes, ice_deep_ocean_biomes, 13)

file.write('\n\t\t\t]\n\t\t}\n\t}\n}')
file.close()