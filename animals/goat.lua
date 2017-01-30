--
--Goat
--
minetest.register_node("ccmobs:goat_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.209225, -0.25, -0.39438, 0.205956, 0.0625, 0.14237},
			{-0.1875, -0.5, -0.375, -0.0625, -0.25, -0.25},
			{0.0625, -0.5, -0.375, 0.1875, -0.25, -0.25},
			{-0.1875, -0.5, 0, -0.0625, -0.25, 0.125},
			{0.0625, -0.5, 0, 0.1875, -0.25, 0.125},
			{-0.0625, -0.125, -0.4375, 0.0625, 0, -0.375},
			{-0.0625, -0.125, 0.1875, 0.0625, -0, 0.4375},
			{-0.125, -0.125, 0.125, 0.125, 0.0625, 0.3125},
			{-0.125, -0.1875, 0.1875, 0.125, 0, 0.375},
			{-0.25, -0.0274816, 0.169995, 0.25, 0, 0.26807},
			{0.0625, 0.0625, 0.1875, 0.125, 0.125, 0.25},--
			{-0.125, 0.0625, 0.1875, -0.0625, 0.125, 0.25},--
			{-0.0625, -0.125, 0.125, 0.0625, 0.0185544, 0.375},
		},
	},
	tiles = {"ccmobs_goat_top.png", "ccmobs_goat_bottom.png", "ccmobs_goat_right_side.png",
    "ccmobs_goat_left_side.png", "ccmobs_goat_front.png", "ccmobs_goat_back.png"},
    groups = {not_in_creative_inventory = 1},
})



mobs:register_mob("ccmobs:goat", {
	type = "animal",
	hp_max = 4,
	collisionbox = {-0.525, -0.6525, -0.525, 0.525, 0.325, 0.525},
	visual = "wielditem",
	visual_size = {x=0.85, y=0.85},
	textures = {"ccmobs:goat_block"},
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
		random = "ccmobs_goat",
	},
	on_rightclick = function(self, clicker)
		tool = clicker:get_wielded_item():get_name()
		if tool == "bucket:bucket_empty" and not self.empty then
		self.empty = true
                minetest.sound_play("ccmobs_sheep_hurt",{pos=pos, max_hear_distance=3, gain=0.5, loop=false})
				clicker:get_inventory():remove_item("main", "bucket:bucket_empty")
				clicker:get_inventory():add_item("main", "ccmobs:bucket_milk")
		elseif tool == "ccmobs:cage" then
                minetest.sound_play("ccmobs_sheep_hurt",{pos=pos, max_hear_distance=3, gain=0.5, loop=false})
				clicker:get_inventory():remove_item("main", "ccmobs:cage")
				clicker:get_inventory():add_item("main", "ccmobs:goat")
				self.object:remove()
		end
	end,
})

minetest.register_craftitem("ccmobs:goat", {
	description = "Goat Spawnegg",
	inventory_image = "ccmobs_spawnegg_goat.png",
	on_place = function(itemstack, placer, pointed_thing)
		if pointed_thing.above then
			minetest.env:add_entity(pointed_thing.above, "ccmobs:goat")
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
