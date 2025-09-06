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
	description = "Timber Nr.1",
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
		minetest.show_formspec(player:get_player_name(), "timber1" , 
			make_formspec(player, "timber1", "stella:resource_1", 3, "stella:resource_3", 3)
		)
	end,
})

minetest.register_node("stella:shop2", {
	description = "Shop Nr.2",
	drawtype = "mesh",
	mesh = "shop2.obj",
	tiles = {"stella_character_shop.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {type = "fixed",fixed = 
		{0, -0.83333, -0.25, 1, 1.16667, 0.75}
	},
	collision_box = {type = "fixed",fixed = 
		{0, -0.83333, -0.25, 1, 1.16667, 0.75}
	},
	on_punch = function(pos, node, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "shop2" , 
			make_formspec(player, "shop2", "stella:resource_2", 8, "stella:resource_5", 0)
		)
	end,
})

minetest.register_node("stella:shop1", {
	description = "Shop Nr.1",
	drawtype = "mesh",
	mesh = "shop1.obj",
	tiles = {"stella_character_shop.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {type = "fixed",fixed = 
		{0, -1.16667, -1, 1, 0.83333, 0}
	},
	collision_box = {type = "fixed",fixed = 
		{0, -1.16667, -1, 1, 0.83333, 0}
	},
	on_punch = function(pos, node, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "shop1" , 
			make_formspec(player, "shop1", "stella:resource_1", 10, "stella:resource_5", 0)
		)
	end,
})

minetest.register_node("stella:smith1", {
	description = "Smith Nr.1",
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
		minetest.show_formspec(player:get_player_name(), "smith1" , 
			make_formspec(player, "smith1", "stella:resource_2", 5, "stella:resource_4", 3)
		)
	end,
})

minetest.register_node("stella:tool1", {
	description = "Pick Nr.1",
	drawtype = "mesh",
	mesh = "pick1.obj",
	tiles = {"stella_character.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {type = "fixed",fixed = 
		{0, -1.16667, -0.5, 1, 0.83333, 0.5}
	},
	collision_box = {type = "fixed",fixed = 
		{0, -1.16667, -0.5, 1, 0.83333, 0.5}
	},
	on_punch = function(pos, node, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "tool1" , 
			make_formspec(player, "tool1", "", 0, "", 0)
		)
	end,
})

minetest.register_node("stella:tool2", {
	description = "Axe Nr.1",
	drawtype = "mesh",
	mesh = "axe1.obj",
	tiles = {"stella_character.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {type = "fixed",fixed = 
		{0, -0.83333, -1, 1, 1.16667, 0}
	},
	collision_box = {type = "fixed",fixed = 
		{0, -0.83333, -1, 1, 1.16667, 0}
	},
	on_punch = function(pos, node, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "tool2" , 
			make_formspec(player, "tool2", "", 0, "", 0)
		)
	end,
})

minetest.register_node(minetest.get_current_modname()..":resource_1",{
	description = "Purple Resource",
	tiles = {"stella_resource_1.png"}, 
	stack_max = 99999,
})

minetest.register_node(minetest.get_current_modname()..":resource_2",{
	description = "Gray Resource",
	tiles = {"stella_resource_2.png"}, 
	stack_max = 99999,
})

minetest.register_node(minetest.get_current_modname()..":resource_3",{
	description = "Orange Resource",
	tiles = {"stella_resource_3.png"}, 
	stack_max = 99999,
})

minetest.register_node(minetest.get_current_modname()..":resource_4",{
	description = "Silver Resource",
	tiles = {"stella_resource_4.png"}, 
	stack_max = 99999,
})

minetest.register_craftitem(minetest.get_current_modname()..":resource_5",{
	description = "Coin",
	inventory_image = "stella_resource_5.png", 
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
			textures = {"stella_resource_"..stella.resources[resource][1]..".png"},
			selectionbox = {0, 0, 0, 0, 0, 0},
			hp_max = (stella.resources[resource][4]*stella.resources[resource][5])+1,
			on_activate = function(self, staticdata, dtime_s)
				if staticdata and staticdata ~= "" then
					local data = minetest.deserialize(staticdata)
					if data then
						local luaent = self.object:get_luaentity()
						if data.hp then
							self.object:set_hp(data.hp)
						end
						if data.hexagon then
							luaent.hexagon = data.hexagon
						end
						if data.res_place then
							luaent.res_place = data.res_place
						end
						if data.res_id then
							luaent.res_id = data.res_id
						end
					end
				end
			end,
			get_staticdata = function(self)
				local luaent = self.object:get_luaentity()
				return minetest.serialize({
					hp = self.object:get_hp(),
					hexagon = luaent.hexagon,
					res_place = luaent.res_place,
					res_id = luaent.res_id
				})
			end,
		})
	end
	minetest.register_entity("stella:resource_"..stella.resources[resource][1].."_"..stella.resources[resource][6], {
		physical = true,
		visual_size = {x=10, y=10},
		collisionbox = {0, 0, 0, 0, 0, 0},
		visual = "mesh",
		mesh = "resource_"..stella.resources[resource][6]..".obj",
		textures = {"stella_resource_"..stella.resources[resource][1]..".png"},
		selectionbox = {0, 0, 0, 0, 0, 0},
		hp_max = 1,
		timer = 0,
		on_activate = function(self, staticdata, dtime_s)
			if staticdata and staticdata ~= "" then
				local data = minetest.deserialize(staticdata)
				if data then
					local luaent = self.object:get_luaentity()
					if data.hexagon then
						luaent.hexagon = data.hexagon
					end
					if data.res_place then
						luaent.res_place = data.res_place
					end
					if data.res_id then
						luaent.res_id = data.res_id
					end
				end
			end
		end,
		get_staticdata = function(self)
			local luaent = self.object:get_luaentity()
				return minetest.serialize({
					hexagon = luaent.hexagon,
					res_place = luaent.res_place,
					res_id = luaent.res_id
				})
		end,
		on_step = function(self, dtime)
			self.timer = self.timer + dtime
			if self.timer > stella.resources[resource][7] then
				local luaent = self.object:get_luaentity()
				local obj_hexagon = luaent.hexagon
				local obj_res_place = luaent.res_place
				local obj_res_id = luaent.res_id
				local obj2 = minetest.env:add_entity(self.object:get_pos(),"stella:resource_"..stella.resources[resource][1].."_1")
				local luaent2 = obj2:get_luaentity()
				luaent2.hexagon = obj_hexagon
				luaent2.res_place = obj_res_place
				luaent2.res_id = obj_res_id
				self.object:remove()
			end
		end,
	})
end

