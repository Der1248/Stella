function set_hexagon(id, player, blocks)
	for hexagonsCount = 1, #stella.hexagons do
		if stella.hexagons[hexagonsCount][2] == id then
			local pos = stella.hexagons[hexagonsCount][3]
			local y_pos = 2.5+0.16666666*stella.hexagons[hexagonsCount][5]
			local block2 = {
				{{x=pos.x-0.21, y=y_pos, z=pos.z}, 		{x=pos.x-0.21, y=y_pos, z=pos.z-0.5}, 	{x=pos.x-0.21, y=y_pos, z=pos.z-0.25}, 	{x=pos.x-0.21, y=y_pos, z=pos.z-0.75}},
				{{x=pos.x-0.57, y=y_pos, z=pos.z+0.63}, {x=pos.x-0.57, y=y_pos, z=pos.z+0.13}, 	{x=pos.x-0.57, y=y_pos, z=pos.z+0.38}, 	{x=pos.x-0.57, y=y_pos, z=pos.z-0.12}},
				{{x=pos.x-0.92, y=y_pos, z=pos.z+1.25}, {x=pos.x-0.92, y=y_pos, z=pos.z+0.75}, 	{x=pos.x-0.92, y=y_pos, z=pos.z+1}, 	{x=pos.x-0.92, y=y_pos, z=pos.z+0.5}},
				{{x=pos.x-0.57, y=y_pos, z=pos.z+1.87}, {x=pos.x-0.57, y=y_pos, z=pos.z+1.37}, 	{x=pos.x-0.57, y=y_pos, z=pos.z+1.62}, 	{x=pos.x-0.57, y=y_pos, z=pos.z+1.12}},
				{{x=pos.x-0.21, y=y_pos, z=pos.z+2.5}, 	{x=pos.x-0.21, y=y_pos, z=pos.z+2.0}, 	{x=pos.x-0.21, y=y_pos, z=pos.z+2.25}, 	{x=pos.x-0.21, y=y_pos, z=pos.z+1.75}},
				{{x=pos.x+0.5, y=y_pos, z=pos.z+2.5}, 	{x=pos.x+0.5, y=y_pos, z=pos.z+2.0}, 	{x=pos.x+0.5, y=y_pos, z=pos.z+2.25}, 	{x=pos.x+0.5, y=y_pos, z=pos.z+1.75}},
				{{x=pos.x+1.21, y=y_pos, z=pos.z+2.5}, 	{x=pos.x+1.21, y=y_pos, z=pos.z+2.0}, 	{x=pos.x+1.21, y=y_pos, z=pos.z+2.25}, 	{x=pos.x+1.21, y=y_pos, z=pos.z+1.75}},
				{{x=pos.x+1.57, y=y_pos, z=pos.z+1.87}, {x=pos.x+1.57, y=y_pos, z=pos.z+1.37}, 	{x=pos.x+1.57, y=y_pos, z=pos.z+1.62}, 	{x=pos.x+1.57, y=y_pos, z=pos.z+1.12}},
				{{x=pos.x+1.92, y=y_pos, z=pos.z+1.25}, {x=pos.x+1.92, y=y_pos, z=pos.z+0.75}, 	{x=pos.x+1.92, y=y_pos, z=pos.z+1}, 	{x=pos.x+1.92, y=y_pos, z=pos.z+0.5}},
				{{x=pos.x+1.57, y=y_pos, z=pos.z+0.63}, {x=pos.x+1.57, y=y_pos, z=pos.z+0.13}, 	{x=pos.x+1.57, y=y_pos, z=pos.z+0.38}, 	{x=pos.x+1.57, y=y_pos, z=pos.z-0.12}},
				{{x=pos.x+1.21, y=y_pos, z=pos.z}, 		{x=pos.x+1.21, y=y_pos, z=pos.z-0.5}, 	{x=pos.x+1.21, y=y_pos, z=pos.z-0.25}, 	{x=pos.x+1.21, y=y_pos, z=pos.z-0.75}},
				{{x=pos.x+0.5, y=y_pos, z=pos.z}, 		{x=pos.x+0.5, y=y_pos, z=pos.z-0.5}, 	{x=pos.x+0.5, y=y_pos, z=pos.z-0.25}, 	{x=pos.x+0.5, y=y_pos, z=pos.z-0.75}},
				{{x=pos.x+0.5, y=y_pos, z=pos.z+1.25}, 	{x=pos.x+0.5, y=y_pos, z=pos.z+0.75}, 	{x=pos.x+0.5, y=y_pos, z=pos.z+1}, 	{x=pos.x+0.5, y=y_pos, z=pos.z+0.5}}
			}
			local height = stella.hexagons[hexagonsCount][5]
			local ground_height = 0
			if stella.hexagons[hexagonsCount][5] > 6 then
				height = height-6
				ground_height = 1
			end
			if stella.hexagons[hexagonsCount][4] == 1 then 
				minetest.place_schematic({x=pos.x, y=pos.y+ground_height, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_"..height.."_1.mts","90")
				minetest.place_schematic({x=pos.x, y=pos.y-1, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_g_1.mts","90")
				minetest.place_schematic({x=pos.x, y=pos.y-2, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_g_1.mts","90")
				minetest.place_schematic({x=pos.x, y=pos.y-3, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_g_1.mts","90")
				if ground_height == 1 then
					minetest.place_schematic({x=pos.x, y=pos.y, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_6_1.mts","90")
				end
			elseif stella.hexagons[hexagonsCount][4] == 3 then
				minetest.place_schematic({x=pos.x, y=pos.y+ground_height, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_"..height.."_2.mts","90")
				minetest.place_schematic({x=pos.x, y=pos.y-1, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_g_2.mts","90")
				minetest.place_schematic({x=pos.x, y=pos.y-2, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_g_2.mts","90")
				minetest.place_schematic({x=pos.x, y=pos.y-3, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_g_2.mts","90")
				if ground_height == 1 then
					minetest.place_schematic({x=pos.x, y=pos.y, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_6_2.mts","90")
				end
			elseif stella.hexagons[hexagonsCount][4] == 4 then
				minetest.place_schematic({x=pos.x, y=pos.y+ground_height, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_"..height.."_3.mts","90")
				minetest.place_schematic({x=pos.x, y=pos.y-1, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_g_3.mts","90")
				minetest.place_schematic({x=pos.x, y=pos.y-2, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_g_3.mts","90")
				minetest.place_schematic({x=pos.x, y=pos.y-3, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_g_3.mts","90")
				if ground_height == 1 then
					minetest.place_schematic({x=pos.x, y=pos.y, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_6_3.mts","90")
				end
			elseif stella.hexagons[hexagonsCount][4] == 2 then
				minetest.place_schematic({x=pos.x, y=pos.y+ground_height, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_"..height.."_1.mts","270")
				minetest.place_schematic({x=pos.x, y=pos.y-1, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_g_1.mts","270")
				minetest.place_schematic({x=pos.x, y=pos.y-2, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_g_1.mts","270")
				minetest.place_schematic({x=pos.x, y=pos.y-3, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_g_1.mts","270")
				if ground_height == 1 then
					minetest.place_schematic({x=pos.x, y=pos.y, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..stella.hexagons[hexagonsCount][6].."_6_1.mts","270")
				end
			end
			if blocks then
				for i = 1, 13 do
					if stella.hexagons[hexagonsCount][8][i] then
						if stella.hexagons[hexagonsCount][8][i] ~= "" and stella.hexagons[hexagonsCount][8][i] ~= "timber1" and stella.hexagons[hexagonsCount][8][i] ~= "smith1" and stella.hexagons[hexagonsCount][8][i] ~= "pick1" and stella.hexagons[hexagonsCount][8][i] ~= "shop1" then
							minetest.env:add_entity(block2[i][stella.hexagons[hexagonsCount][4]],"stella:resource_"..stella.hexagons[hexagonsCount][8][i])
						elseif stella.hexagons[hexagonsCount][8][i] == "timber1" then
							minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z+1}, {name="stella:timber1"})
						elseif stella.hexagons[hexagonsCount][8][i] == "smith1" then
							minetest.set_node({x=pos.x, y=pos.y+2, z=pos.z+1}, {name="stella:smith1"})
						elseif stella.hexagons[hexagonsCount][8][i] == "pick1" then
							minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z+1}, {name="stella:pick_1"})
						elseif stella.hexagons[hexagonsCount][8][i] == "shop1" then
							minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z+1}, {name="stella:shop1"})
						end
					end
				end
			end
		end
	end
end