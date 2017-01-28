--
--SHEEP
--
minetest.register_node("ccmobs:sheep_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.375, -0.4375, 0.3125, 0.1875, 0.1875},
			{-0.1875, -0.25, 0.125, 0.1875, 0.0625, 0.375},
			{-0.25, -0.0625, 0.1875, 0.25, 0.06, 0.3125},
			{-0.125, -0.3125, 0.3125, 0.125, 0.08995, 0.5},
			{0.0625, -0.5, -0.0625, 0.25, -0.375, 0.125},
			{-0.25, -0.5, -0.0625, -0.0625, -0.3125, 0.125},
			{0.0625, -0.5, -0.375, 0.25, -0.3125, -0.1875},
			{-0.25, -0.5, -0.375, -0.0625, -0.3125, -0.1875},
			{-0.0625, -0.1875, -0.5, 0.0625, 0.0625, -0.4375},
		},
	},
	tiles = {"ccmobs_sheep_top.png", "ccmobs_sheep_bottom.png", "ccmobs_sheep_right_side.png",
    "ccmobs_sheep_left_side.png", "ccmobs_sheep_front.png", "ccmobs_sheep_back.png"},
    groups = {not_in_creative_inventory = 1},
})

minetest.register_node("ccmobs:sheep_shaved", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.25, -0.35225, -0.375, 0.25, 0.125, 0.1875},
			{-0.1875, -0.207206, 0.125, 0.1875, 0.0207206, 0.375},
			{-0.25, -0.0625, 0.1875, 0.25, 0.06, 0.3125},
			{-0.125, -0.3125, 0.3125, 0.125, 0.08995, 0.5},
			{0.099736, -0.5, -0.027133, 0.210313, -0.375, 0.0857405},
			{-0.208145, -0.5, -0.029304, -0.106241, -0.35225, 0.08574},
			{0.110577, -0.5, -0.307146, 0.203808, -0.3125, -0.194273},
			{-0.208145, -0.5, -0.307146, -0.106241, -0.3125, -0.194273},
			{-0.0625, -0.1875, -0.4375, 0.0625, 0.0625, -0.375},
		},
	},
	tiles = {"ccmobs_sheep_shaved_top.png", "ccmobs_sheep_bottom.png", "ccmobs_sheep_shaved_right_side.png",
    "ccmobs_sheep_shaved_left_side.png", "ccmobs_sheep_shaved_front.png", "ccmobs_sheep_shaved_back.png"},
    groups = {not_in_creative_inventory = 1},
})


mobs:register_mob("ccmobs:sheep", {
	type = "animal",
	hp_max = 4,
--	collisionbox = {-0.25, -0.33, -0.25, 0.25, 0.33, 0.25},
	collisionbox = {-0.525, -0.585, -0.525, 0.525, 0.325, 0.525},
	visual = "wielditem",
--	visual_size = {x=0.35, y=0.35},
	visual_size = {x=0.75, y=0.75},
	textures = {"ccmobs:sheep_block"},
	makes_footstep_sound = false,
	walk_velocity = 0.1,
    run_velocity = 0.2,
	jump = false,
	armor = 100,
	drops = {
		{name = "ccmobs:meat_raw",
		chance = 1,
		min = 1,
		max = 1,},
		},
	drawtype = "front",
	water_damage = 2,
	lava_damage = 4,
	light_damage = 0,
    sounds = {
		random = "ccmobs_sheep",
	},
	on_rightclick = function(self, clicker)
		tool = clicker:get_wielded_item():get_name()
		if tool == "ccmobs:cage" then
				clicker:get_inventory():remove_item("main", "ccmobs:cage")
				clicker:get_inventory():add_item("main", "ccmobs:sheep")
                minetest.sound_play("ccmobs_sheep",{pos=pos, max_hear_distance=3, gain=0.5, loop=false})
				self.object:remove()
		elseif clicker:get_inventory() and not self.empty then
			self.empty = true
				clicker:get_inventory():add_item("main", "wool:white")
                minetest.sound_play("ccmobs_sheep_hurt",{pos=pos, max_hear_distance=3, gain=0.5, loop=false})
				self.object:set_properties({
					textures = {"ccmobs:sheep_shaved"},
				})
		end
	end,
})

minetest.register_craftitem("ccmobs:sheep", {
	description = "Sheep  Spawnegg",
	inventory_image = "ccmobs_spawnegg_sheep.png",
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.above then
			minetest.env:add_entity(pointed_thing.above, "ccmobs:sheep")
            minetest.sound_play("ccmobs_sheep",{pos=pos, max_hear_distance=3, gain=0.5, loop=false})
			if minetest.setting_getbool("creative_mode") then
				itemstack:take_item()
			else
				itemstack:take_item()
				placer:get_inventory():add_item("main", "ccmobs:cage")
			end
		end
		return itemstack
	end,
})
