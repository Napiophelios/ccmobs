--
--Goat
--
minetest.register_node("ccmobs:goat_block", {
	drawtype = "nodebox",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.203072, -0.3125, -0.453246, 0.200683, 0, 0.0131549},
			{-0.0286689, -0.125, -0.5, 0.0334471, -0.0625, -0.4375},
			{-0.1875, -0.5, -0.4375, -0.0625, -0.3125, -0.3125},
			{0.0625, -0.5, -0.4375, 0.1875, -0.3125, -0.3125},
			{-0.1875, -0.5, -0.125, -0.0625, -0.3125, 0},
			{0.0625, -0.5, -0.125, 0.1875, -0.3125, 0},
			{-0.0831274, -0.167758, 0, 0.0812382, 0.0316038, 0.0466401},
			{-0.0750626, -0.122365, 0.0275057, 0.0734655, 0.0592087, 0.0657745},
			{-0.090785, 0, 0.0625, 0.090785, 0.0897541, 0.1875},
			{-0.109898, -0.125, 0.0625, 0.107509, 0.0633559, 0.211426},
			{0.0625, 0.0625, 0.07412, 0.113356, 0.138105, 0.116882},
			{-0.115245, 0.0625, 0.0712692, -0.0625, 0.139529, 0.116882},
			{-0.1875, 0.0131991, 0.0625, 0.1875, 0.0422372, 0.125},
			{-0.0812287, -0.113513, 0.206681, 0.0764505, -0.00142377, 0.25},
			{-0.0334471, -0.161029, 0.1875, 0.0382253, -0.108233, 0.219355},
			{-0.109577, 0.125, 0.0783961, -0.0717919, 0.190599, 0.108329},
			{0.0736812, 0.125, 0.0812469, 0.107688, 0.190784, 0.105478},
			{-0.0573379, -0.114049, 0.25, 0.0549488, -0.0137408, 0.3125},
		},
	},
	tiles = {"ccmobs_goat_top.png", "ccmobs_goat_bottom.png", "ccmobs_goat_right_side.png",
    "ccmobs_goat_left_side.png", "ccmobs_goat_front.png", "ccmobs_goat_back.png"},
    groups = {not_in_creative_inventory = 1},
})



mobs:register_mob("ccmobs:goat", {
	type = "animal",
	hp_max = 4,
--	collisionbox = {-0.25, -0.33, -0.25, 0.25, 0.33, 0.25},
	collisionbox = {-0.525, -0.6525, -0.525, 0.525, 0.325, 0.525},
	visual = "wielditem",
--	visual_size = {x=0.35, y=0.35},
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
