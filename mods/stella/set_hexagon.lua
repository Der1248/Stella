function ensure(tbl, key)
    if not tbl[key] then
        tbl[key] = {}
    end
    return tbl[key]
end

sectors = {}

local array = {"2", "4", "6", "g"}

for n = 1, 3 do
	for i, v in ipairs(array) do
		index = 0
		if v == "g" then
			index = 7
		else
			index = tonumber(v)
		end
		ensure(ensure(sectors, n), index)[1] = {
			size = {x=3, y=1, z=2},
			yslice_prob = {
				{ypos=0, prob=254},
			},
			data = {
				{name="stella:block_"..n.."_"..v.."_3", prob=254, param2=3},
				{name="stella:block_"..n.."_"..v.."_2", prob=254, param2=3},
				{name="stella:block_"..n.."_"..v.."_1", prob=254, param2=3},
				{name="stella:block_"..n.."_"..v.."_6", prob=254, param2=3},
				{name="stella:block_"..n.."_"..v.."_5", prob=254, param2=3},
				{name="stella:block_"..n.."_"..v.."_4", prob=254, param2=3},
			},
		}

		ensure(ensure(sectors, n), index)[2] = {
			size = {x=3, y=1, z=2},
			yslice_prob = {
				{ypos=0, prob=254},
			},
			data = {
				{name="stella:block_"..n.."_"..v.."_10", prob=254, param2=1},
				{name="stella:block_"..n.."_"..v.."_11", prob=254, param2=1},
				{name="stella:block_"..n.."_"..v.."_12", prob=254, param2=1},
				{name="stella:block_"..n.."_"..v.."_7", prob=254, param2=1},
				{name="stella:block_"..n.."_"..v.."_8", prob=254, param2=1},
				{name="stella:block_"..n.."_"..v.."_9", prob=254, param2=1},
			},
		}

		ensure(ensure(sectors, n), index)[3] = {
			size = {x=2, y=1, z=2},
			yslice_prob = {
				{ypos=0, prob=254},
			},
			data = {
				{name="stella:block_"..n.."_"..v.."_14", prob=254, param2=1},
				{name="stella:block_"..n.."_"..v.."_13", prob=254, param2=3},
				{name="stella:block_"..n.."_"..v.."_13", prob=254, param2=1},
				{name="stella:block_"..n.."_"..v.."_14", prob=254, param2=3},
			},
		}
	end
end

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
				minetest.place_schematic({x=pos.x, y=pos.y+ground_height, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][tonumber(height)][1],"90")
				minetest.place_schematic({x=pos.x, y=pos.y-1, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][7][1],"90")
				minetest.place_schematic({x=pos.x, y=pos.y-2, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][7][1],"90")
				minetest.place_schematic({x=pos.x, y=pos.y-3, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][7][1],"90")
				if ground_height == 1 then
					minetest.place_schematic({x=pos.x, y=pos.y, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][6][1],"90")
				end
			elseif stella.hexagons[hexagonsCount][4] == 3 then
				minetest.place_schematic({x=pos.x, y=pos.y+ground_height, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][tonumber(height)][2],"90")
				minetest.place_schematic({x=pos.x, y=pos.y-1, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][7][2],"90")
				minetest.place_schematic({x=pos.x, y=pos.y-2, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][7][2],"90")
				minetest.place_schematic({x=pos.x, y=pos.y-3, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][7][2],"90")
				if ground_height == 1 then
					minetest.place_schematic({x=pos.x, y=pos.y, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][6][2],"90")
				end
			elseif stella.hexagons[hexagonsCount][4] == 4 then
				minetest.place_schematic({x=pos.x, y=pos.y+ground_height, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][tonumber(height)][3],"90")
				minetest.place_schematic({x=pos.x, y=pos.y-1, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][7][3],"90")
				minetest.place_schematic({x=pos.x, y=pos.y-2, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][7][3],"90")
				minetest.place_schematic({x=pos.x, y=pos.y-3, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][7][3],"90")
				if ground_height == 1 then
					minetest.place_schematic({x=pos.x, y=pos.y, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][6][3],"90")
				end
			elseif stella.hexagons[hexagonsCount][4] == 2 then
				minetest.place_schematic({x=pos.x, y=pos.y+ground_height, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][tonumber(height)][1],"270")
				minetest.place_schematic({x=pos.x, y=pos.y-1, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][7][1],"270")
				minetest.place_schematic({x=pos.x, y=pos.y-2, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][7][1],"270")
				minetest.place_schematic({x=pos.x, y=pos.y-3, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][7][1],"270")
				if ground_height == 1 then
					minetest.place_schematic({x=pos.x, y=pos.y, z=pos.z}, sectors[tonumber(stella.hexagons[hexagonsCount][6])][6][1],"270")
				end
			end
			if blocks then
				for i = 1, 13 do
					if stella.hexagons[hexagonsCount][8][i] then
						if stella.hexagons[hexagonsCount][8][i] == "timber1" then
							minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z+1}, {name="stella:timber1"})
						elseif stella.hexagons[hexagonsCount][8][i] == "smith1" then
							minetest.set_node({x=pos.x, y=pos.y+2, z=pos.z+1}, {name="stella:smith1"})
						elseif stella.hexagons[hexagonsCount][8][i] == "pick1" then
							minetest.set_node({x=pos.x, y=pos.y+2, z=pos.z+1}, {name="stella:pick1"})
						elseif stella.hexagons[hexagonsCount][8][i] == "tool1" then
							minetest.set_node({x=pos.x, y=pos.y+2, z=pos.z+1}, {name="stella:tool1"})
						elseif stella.hexagons[hexagonsCount][8][i] == "tool2" then
							minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z+1}, {name="stella:tool2"})
						elseif stella.hexagons[hexagonsCount][8][i] == "shop1" then
							minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z+1}, {name="stella:shop1"})
						elseif stella.hexagons[hexagonsCount][8][i] == "shop2" then
							minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z+1}, {name="stella:shop2"})
						elseif stella.hexagons[hexagonsCount][8][i] ~= "" then
							local obj = minetest.env:add_entity(block2[i][stella.hexagons[hexagonsCount][4]],"stella:resource_"..stella.hexagons[hexagonsCount][8][i])
							local luaent = obj:get_luaentity()
							luaent.hexagon = stella.hexagons[hexagonsCount][1]
							luaent.res_place = i
							luaent.res_id = stella.hexagons[hexagonsCount][8][i]
						end
					end
				end
			end
		end
	end
end