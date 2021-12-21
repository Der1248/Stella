minetest.register_node(minetest.get_current_modname()..":ground",{
	description = "Ground",
	tiles = {"stella_ground.png"}, 
	selection_box = {type = "fixed",fixed = {}--{-0.5, -0.5, -0.5, 0.5, -0.16667, 0.5}
	},
})

minetest.register_node("stella:water", {
	description = "Water",
	drawtype = "liquid",
	waving = 3,
	tiles = {
		{
			name = "stella_water.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
		{
			name = "stella_water.png",
			backface_culling = true,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 2.0,
			},
		},
	},
	use_texture_alpha = "blend",
	paramtype = "light",
	walkable = false,
	pointable = false,
	diggable = false,
	buildable_to = true,
	is_ground_content = false,
	drop = "",
	drowning = 1,
	liquidtype = "source",
	liquid_viscosity = 1,
	post_effect_color = {a = 103, r = 30, g = 60, b = 90}, 
})

minetest.register_node("stella:timber1", {
	description = "Timber lv.1",
	drawtype = "mesh",
	mesh = "timber1.obj",
	tiles = {"stella_character_timber.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {type = "fixed",fixed = 
		{0, -1.16667, -0.5, 1, 0.83333, 0.5}
	},
	collision_box = {type = "fixed",fixed = 
		{0, -1.16667, -0.5, 1, 0.83333, 0.5}
	},
	on_punch = function(pos, node, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "timber1" , stella.timber1get_formspec(player))
	end,
})

minetest.register_node("stella:pick_1", {
	description = "Pickshop lv.1",
	drawtype = "mesh",
	mesh = "pick1.obj",
	tiles = {"stella_character.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {type = "fixed",fixed = 
		{0, -1.16667, -0.25, 1, 0.83333, 0.75}
	},
	collision_box = {type = "fixed",fixed = 
		{0, -1.16667, -0.25, 1, 0.83333, 0.75}
	},
	on_punch = function(pos, node, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "pick1" , stella.shop1get_formspec(player))
	end,
})

minetest.register_node("stella:shop1", {
	description = "Shop Nr.1",
	drawtype = "mesh",
	mesh = "shop1.obj",
	tiles = {"stella_character.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {type = "fixed",fixed = 
		{0, -1.16667, -1, 1, 0.83333, 0}
	},
	collision_box = {type = "fixed",fixed = 
		{0, -1.16667, -1, 1, 0.83333, 0}
	},
	on_punch = function(pos, node, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "shop1" , stella.shop1get_formspec(player))
	end,
})

minetest.register_node("stella:smith1", {
	description = "Smith lv.1",
	drawtype = "mesh",
	mesh = "smith1.obj",
	tiles = {"stella_character_smith.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {type = "fixed",fixed = 
		{0, -0.83333, -0.5, 1, 1.16667, 0.5}
	},
	collision_box = {type = "fixed",fixed = 
		{0, -0.83333, -0.5, 1, 1.16667, 0.5}
	},
	on_punch = function(pos, node, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "smith1" , stella.smith1get_formspec(player))
	end,
})

minetest.register_node(minetest.get_current_modname()..":resource_1",{
	description = "Purple Resource",
	tiles = {"stella_resource1.png"}, 
	stack_max = 99999,
})

minetest.register_node(minetest.get_current_modname()..":resource_2",{
	description = "Gray Resource",
	tiles = {"stella_resource2.png"}, 
	stack_max = 99999,
})

minetest.register_node(minetest.get_current_modname()..":resource_3",{
	description = "Orange Resource",
	tiles = {"stella_resource3.png"}, 
	stack_max = 99999,
})

minetest.register_node(minetest.get_current_modname()..":resource_4",{
	description = "Silver Resource",
	tiles = {"stella_resource4.png"}, 
	stack_max = 99999,
})

for resource = 1, #stella.resources do
	for i=1,stella.resources[resource][6]-1 do
		minetest.register_entity("stella:resource_"..stella.resources[resource][1].."_"..i, {
			physical = true,
			visual_size = {x=10, y=10},
			collisionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
			visual = "mesh",
			mesh = "resource_"..i..".obj",
			textures = {"stella_resource"..stella.resources[resource][1]..".png"},
			selectionbox = {0, 0, 0, 0, 0, 0},
			hp_max = (stella.resources[resource][4]*stella.resources[resource][5])+1,
		})
	end
	minetest.register_entity("stella:resource_"..stella.resources[resource][1].."_"..stella.resources[resource][6], {
		physical = true,
		visual_size = {x=10, y=10},
		collisionbox = {0, 0, 0, 0, 0, 0},
		visual = "mesh",
		mesh = "resource_"..stella.resources[resource][6]..".obj",
		textures = {"stella_resource"..stella.resources[resource][1]..".png"},
		selectionbox = {0, 0, 0, 0, 0, 0},
		hp_max = 1,
		timer = 0,
		on_step = function(self, dtime)
			self.timer = self.timer + dtime
			if self.timer > stella.resources[resource][7] then
				minetest.env:add_entity(self.object:get_pos(),"stella:resource_"..stella.resources[resource][1].."_1")
				self.object:remove()
			end
		end,
	})
end

