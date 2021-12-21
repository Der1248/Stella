local box2 = get_nodebox()[1]
local box4 = get_nodebox()[2]
local box6 = get_nodebox()[3]
local boxg = get_nodebox()[4]
for j=1,2 do
	for i=1,14 do
		minetest.register_node(minetest.get_current_modname()..":block_"..j.."_2_"..i,{
			description = "Sector "..j.." Block 2."..i,
			tiles = {"stella_sector"..j..".png"}, 
			mesh = "block_2_"..i..".obj",
			drawtype = "mesh",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {cracky=2},	
			selection_box = {type = "fixed",fixed = {}
			},
			collision_box = {type = "fixed",fixed = box2[i]
			},
		})
		minetest.register_node(minetest.get_current_modname()..":block_"..j.."_4_"..i,{
			description = "Sector "..j.." Block 4."..i,
			tiles = {"stella_sector"..j..".png"}, 
			mesh = "block_4_"..i..".obj",
			drawtype = "mesh",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {cracky=2},	
			selection_box = {type = "fixed",fixed = {}
			},
			collision_box = {type = "fixed",fixed = box4[i]
			},
		})
		minetest.register_node(minetest.get_current_modname()..":block_"..j.."_6_"..i,{
			description = "Sector "..j.." Block 6."..i,
			tiles = {"stella_sector"..j..".png"}, 
			mesh = "block_6_"..i..".obj",
			drawtype = "mesh",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {cracky=2},	
			selection_box = {type = "fixed",fixed = {}
			},
			collision_box = {type = "fixed",fixed = box6[i]
			},
		})
		minetest.register_node(minetest.get_current_modname()..":block_"..j.."_g_"..i,{
			description = "Sector "..j.." Block Ground."..i,
			tiles = {"stella_sector"..j..".png"}, 
			mesh = "block_6_"..i..".obj",
			drawtype = "mesh",
			paramtype = "light",
			paramtype2 = "facedir",
			groups = {cracky=2},	
			selection_box = {type = "fixed",fixed = {}
			},
			collision_box = {type = "fixed",fixed = boxg[i]
			},
		})
	end
end