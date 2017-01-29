--
--SPAWNING: [true --or-- false]
--
local COW_SPAWN = true
local GOAT_SPAWN = true
local PIG_SPAWN = true
local SHEEP_SPAWN = true
local TREEMONSTER_SPAWN = true

dofile(minetest.get_modpath("ccmobs").."/api.lua")
dofile(minetest.get_modpath("ccmobs").."/animals/cow.lua")
dofile(minetest.get_modpath("ccmobs").."/animals/goat.lua")
dofile(minetest.get_modpath("ccmobs").."/animals/pig.lua")
dofile(minetest.get_modpath("ccmobs").."/animals/sheep.lua")
dofile(minetest.get_modpath("ccmobs").."/monsters/treemonster.lua")

--mobs:register_spawn(name, nodes, max_light, min_light, chance, active_object_count, max_height, spawn_func)

if COW_SPAWN then
	mobs:register_spawn("ccmobs:cow", {"default:dirt_with_grass"}, 20, 8, 10000, 1, 31000)
end

if GOAT_SPAWN then
	mobs:register_spawn("ccmobs:goat", {"default:dirt_with_grass"}, 20, 8, 20000, 1, 31000)
end

if PIG_SPAWN then
	mobs:register_spawn("ccmobs:pig", {"default:dirt_with_grass"}, 20, 8, 20000, 1, 31000)
end

if SHEEP_SPAWN then
	mobs:register_spawn("ccmobs:sheep", {"default:dirt_with_grass"}, 20, 8, 8000, 1, 31000)
end

if TREEMONSTER_SPAWN then
	mobs:register_spawn("ccmobs:treemonster", {"default:dirt_with_grass"}, 8, 1, 8000, 1, 31000)
end



minetest.register_craft({
	output = "ccmobs:cage",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"group:stick", "group:stick", "group:stick"}
	},
})

minetest.register_craftitem("ccmobs:cage", {
	description = "animal cage",
	inventory_image = "ccmobs_cage.png"
})

minetest.register_craftitem("ccmobs:meat_raw", {
	description = "raw meat",
	inventory_image = "ccmobs_meat_raw.png",
	on_use = minetest.item_eat(0),
})

minetest.register_craftitem("ccmobs:meat_cooked", {
	description = "cooked meat",
	inventory_image = "ccmobs_meat_cooked.png",
	on_use = minetest.item_eat(6),
})

minetest.register_craft({
	type = "cooking",
	recipe = "ccmobs:meat_raw",
	output = "ccmobs:meat_cooked",
})

minetest.register_craftitem("ccmobs:bucket_milk", {
	description = "bucket with milk",
	inventory_image = "ccmobs_bucket_milk.png",
	groups = {not_in_creative_inventory = 1},
	stack_max = 1,
})
