--
-- ccmobs2 
-- License:MIT
--

ccmobs2 = {}

--SPAWNING: [true --or-- false]
local COW_SPAWN = true
local DIRTMONSTER_SPAWN = false
local GOAT_SPAWN = false
local PIG_SPAWN = false
local ROCKMONSTER_SPAWN = false
local SHEEP_SPAWN = true
local TREEMONSTER_SPAWN = false


--mobs:register_spawn
if COW_SPAWN then

    dofile(minetest.get_modpath("ccmobs2").."/animals/cow.lua")

    mobs:register_egg("ccmobs2:cow", "Cow", "ccmobs2_spawnegg_cow.png", 0)

    mobs:spawn({
        name = "ccmobs2:cow",
        nodes = {"default:dirt_with_grass"},
        neighbors = {"group:grass"},
        min_light = 14,
        interval = 100,
        chance = 2400, 
        min_height = 5,
        max_height = 100,
        day_toggle = true,
    })
end

if DIRTMONSTER_SPAWN then

    dofile(minetest.get_modpath("ccmobs2").."/monsters/dirtmonster.lua")

    mobs:register_egg("ccmobs2:dirtmonster", "Dirt Monster", "ccmobs2_spawnegg_dirtmonster.png", 0)

    mobs:spawn({
        name = "ccmobs2:dirtmonster",
        nodes = {"default:dirt_with_grass"},
        neighbors = {"group:flowers"},
        min_light = 1,
        max_light = 14,
        interval = 100,
        chance = 1000, 
        min_height = 10,
        max_height = 300,
    })
end

if GOAT_SPAWN then

    dofile(minetest.get_modpath("ccmobs2").."/animals/goat.lua")

    mobs:register_egg("ccmobs2:goat", "Goat", "ccmobs2_spawnegg_goat.png", 0)

    mobs:spawn({
        name = "ccmobs2:goat",
        nodes = {"default:dirt_with_grass"},
        neighbors = {"group:grass"},
        min_light = 14,
        interval = 100,
        chance = 2800, 
        min_height = 200,
        max_height = 800,
        day_toggle = true,
    })
end

if PIG_SPAWN then

    dofile(minetest.get_modpath("ccmobs2").."/animals/pig.lua")

    mobs:register_egg("ccmobs2:pig", "Pig", "ccmobs2_spawnegg_pig.png", 0)

    mobs:spawn({
        name = "ccmobs2:pig",
        nodes = {"default:dirt_with_grass"},
        neighbors = {"group:grass"},
        min_light = 14,
        interval = 100,
        chance = 2800, 
        min_height = 10,
        max_height = 80,
        day_toggle = true,
    })
end

if SHEEP_SPAWN then

    dofile(minetest.get_modpath("ccmobs2").."/animals/sheep.lua")

    mobs:register_egg("ccmobs2:sheep", "Sheep", "ccmobs2_spawnegg_sheep.png", 0)

    mobs:spawn({
        name = "ccmobs2:sheep",
        nodes = {"default:dirt_with_grass"},
        neighbors = {"group:grass"},
        min_light = 14,
        interval = 100,
        chance = 1000, 
        min_height = 10,
        max_height = 100,
        day_toggle = true,
    })
end

if ROCKMONSTER_SPAWN then

    dofile(minetest.get_modpath("ccmobs2").."/monsters/rockmonster.lua")

    mobs:register_egg("ccmobs2:rockmonster", "Rock Monster", "ccmobs2_spawnegg_rockmonster.png", 0)

    mobs:spawn({
        name = "ccmobs2:rockmonster",
        nodes = {"default:dirt_with_grass"},
        neighbors = {"group:stone"},
        min_light = 3,
        max_light = 5,
        interval = 100,
        chance = 2800, 
        min_height = -100,
        max_height = 1200,
        day_toggle = false,
    })
end

if TREEMONSTER_SPAWN then

    dofile(minetest.get_modpath("ccmobs2").."/monsters/treemonster.lua")

    mobs:register_egg("ccmobs2:treemonster", "Tree Monster", "ccmobs2_spawnegg_treemonster.png", 0)

    mobs:spawn({
        name = "ccmobs2:treemonster",
        nodes = {"default:dirt_with_grass"},
        neighbors = {"group:leaves"},
        min_light = 3,
        max_light = 5,
        interval = 90,
        chance = 900, 
        min_height = 10,
        max_height = 300,
        day_toggle = false,
    })
end

-- animal cage
minetest.register_craft({
	output = "ccmobs2:cage",
	recipe = {
		{"group:stick", "group:stick", "group:stick"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
		{"group:stick", "group:stick", "group:stick"}
	},
})

minetest.register_craftitem("ccmobs2:cage", {
	description = "Animal Cage",
	inventory_image = "ccmobs2_cage.png"
})

-- bucket of milk
minetest.register_craftitem("ccmobs2:bucket_milk", {
	description = "Bucket of Milk",
	inventory_image = "ccmobs2_bucket_milk.png",
	stack_max = 1,
	on_use = minetest.item_eat(8, 'bucket:bucket_empty'),
})

-- capture critter (from Mobs_Redo API)
function ccmobs2:capture_mob(self, clicker, replacewith)

	local mobname = self.name

	if replacewith then
		mobname = replacewith
	end

	local name = clicker:get_player_name()
	local tool = clicker:get_wielded_item()

	if tool:get_name() ~= "ccmobs2:cage" then
		return false
	end

	if clicker:get_inventory():room_for_item("main", mobname) then

		if tool:get_name() == "ccmobs2:cage" then

			clicker:set_wielded_item(tool)

		end

			local new_stack = ItemStack(mobname)

			new_stack = ItemStack(replacewith)

			local inv = clicker:get_inventory()

			if inv:room_for_item("main", new_stack) then
				inv:add_item("main", new_stack)
			else
				minetest.add_item(clicker:get_pos(), new_stack)
                
			end

			self.object:remove()

			self:mob_sound("default_place_node_hard")

            inv:remove_item("main", "ccmobs2:cage")

			return new_stack
        end
    end
