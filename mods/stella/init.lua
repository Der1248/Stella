minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=10},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "For Minetest 	  :  5.5.x",
	})
	player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=30},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "Game Version	 :  1.1.0",
	})
end)

stella = stella or {}

stella.resources = { --to do
	--ID  	tool	min level	max items	needed level	textures	respawn time
	{"1", 	"axe", 	1,			15,			0.47,			6,			10},
	{"2", 	"pick", 1,			3,			2,				6,			11},
}
stella.tasks = {

	{"1.1.1.1","1.1.1.0",{x=6.5, y=2, z=3},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {15,0,0,0}},
	{"1.1.1.2","1.1.1.1",{x=9.5, y=2, z=4.75},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {50,0,0,0}},
	{"1.1.1.3","1.1.1.2",{x=9.5, y=2, z=8.25},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {75,0,0,0}},
	{"1.1.1.4","1.1.1.3",{x=11, y=2, z=3.875},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {15,0,0,0}},
	{"1.1.1.5","1.1.1.3",{x=3.5, y=2, z=-2.25},{"stella:resource_3","","",""}, {"Orange Resource","","",""}, {15,0,0,0}},
	{"1.1.1.6","1.1.2.7",{x=6.5, y=2, z=-0.5},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {35,0,0,0}},
	{"1.1.1.7","1.1.1.5",{x=11, y=2, z=7.375},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {50,0,0,0}},
	{"1.1.1.8","1.1.1.6",{x=8, y=2, z=-3.125},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {20,0,0,0}},
	{"1.1.1.9","1.1.1.6",{x=3.5, y=2, z=4.75},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {30,0,0,0}},
	{"1.1.1.10","1.1.1.8",{x=11, y=2, z=-3.125},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {30,0,0,0}},
	{"1.1.1.11","1.1.1.10",{x=14, y=2, z=-1.375},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {45,0,0,0}},  
	{"1.1.1.12","1.1.1.11",{x=12.5, y=2, z=-0.5},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {15,0,0,0}},
	{"1.1.1.13","1.1.1.9",{x=5, y=2, z=7.375},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {30,0,0,0}},
	{"1.1.1.14","1.1.1.13",{x=6.5, y=2, z=10},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {30,0,0,0}},
	{"1.1.1.15","1.1.1.14",{x=5, y=2, z=9.125},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {0,0,0,0}},	-->comming soon 45 purple --> 60 iron portal + cloud
	{"1.1.1.16","1.1.1.7",{x=14, y=2, z=9.125},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {130,0,0,0}},
	{"1.1.1.17","1.1.1.16",{x=14, y=2, z=7.375},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {50,0,0,0}},
	{"1.1.1.18","1.1.1.17",{x=12.5, y=2, z=10},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {60,0,0,0}},
	{"1.1.1.19","1.1.1.14",{x=6.5, y=2, z=13.5},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {75,0,0,0}},
	{"1.1.1.20","1.1.1.19",{x=5.0, y=2, z=14.375},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {75,0,0,0}},
	{"1.1.1.21","1.1.1.20",{x=2.0, y=2, z=12.625},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {0,0,0,0}}, --> comming soon 90 purple --> gold tresure
	{"1.1.1.22","1.1.1.11",{x=11.0, y=2, z=-4.875},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {0,0,0,0}}, -->comming soon wood blue iron


	{"1.1.2.1","1.1.1.5",{x=2, y=2, z=-4.875},{"stella:resource_2","","",""}, {"Gray Resource","","",""}, {10,0,0,0}},
	{"1.1.2.2","1.1.2.1",{x=2, y=2, z=-6.625},{"stella:resource_2","","",""}, {"Gray Resource","","",""}, {15,0,0,0}},
	{"1.1.2.3","1.1.2.2",{x=2, y=2, z=-8.375},{"stella:resource_2","","",""}, {"Gray Resource","","",""}, {15,0,0,0}},
	{"1.1.2.4","1.1.2.3",{x=2, y=2, z=-10.125},{"stella:resource_2","","",""}, {"Gray Resource","","",""}, {25,0,0,0}},
	{"1.1.2.5","1.1.2.3",{x=-1, y=2, z=-8.375},{"stella:resource_4","stella:resource_3","stella:resource_5",""}, {"Silver Resource","Orange Resource","Coin",""}, {20,30,150,0}},
	{"1.1.2.6","1.1.2.4",{x=5, y=2, z=-11.875},{"stella:resource_2","","",""}, {"Gray Resource","","",""}, {30,0,0,0}},
	{"1.1.2.7","1.1.2.6",{x=8, y=2, z=-11.875},{"stella:resource_2","","",""}, {"Gray Resource","","",""}, {75,0,0,0}},
	{"1.1.2.8","1.1.2.7",{x=5, y=2, z=-10.125},{"stella:resource_2","","",""}, {"Gray Resource","","",""}, {200,0,0,0}},	-->erledigen gibt zusätzlich cloud
	{"1.1.2.9","1.1.2.8",{x=3.5, y=2, z=-13.0},{"stella:resource_2","","",""}, {"Gray Resource","","",""}, {75,0,0,0}},	
	{"1.1.2.10","1.1.2.9",{x=5, y=2, z=-15.375},{"stella:resource_2","","",""}, {"Gray Resource","","",""}, {100,0,0,0}},
	{"1.1.2.11","1.1.2.10",{x=8, y=2, z=-15.375},{"stella:resource_2","","",""}, {"Gray Resource","","",""}, {0,0,0,0}},	--> comming soon 200 grey --> gold tresure
	{"1.1.2.12","1.1.2.5",{x=-1, y=2, z=-10.125},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {0,0,0,0}}, --> comming soon 30 purple (wood lv.2)




	
}

stella.hexagons = {
	--ID	   	need ID	  	pos 				num		Height	Sector	Spawn	Blocks
	{"1.1.1.1",	"1.1.1.0",	{x=0, y=2, z=0},	1,		2,		"1",	"",		{}},
	{"1.1.1.2",	"1.1.1.0",	{x=3, y=2, z=2},	3,		2,		"1",	"",		{}},
	{"1.1.1.3",	"1.1.1.0",	{x=3, y=2, z=-1},	4,		2,		"1",	"",		{}},
	{"1.1.1.4",	"1.1.1.0",	{x=6, y=2, z=0},	1,		2,		"1",	"",		{}},
	{"1.1.1.5",	"1.1.1.0",	{x=9, y=2, z=2},	3,		2,		"1",	"",		{}},
	{"1.1.1.6",	"1.1.1.0",	{x=9, y=2, z=-1},	4,		2,		"1",	"",		{"","","","","","","","1_1","","1_1","","1_1","1_1"}},
	{"1.1.1.7",	"1.1.1.1",	{x=6, y=2, z=4},	2,		4,		"1",	"",		{"","","","","1_1","","1_1","","1_1","","1_1","","1_1"}},
	{"1.1.1.8",	"1.1.1.2",	{x=9, y=2, z=6},	4,		2,		"1",	"",		{}}, 
	{"1.1.1.9",	"1.1.1.3",	{x=9, y=2, z=9},	3,		2,		"1",	"",		{"","","","","","","","","","","","","timber1"}}, 
	{"1.1.1.10","1.1.1.4",	{x=12, y=2, z=4},	2,		2,		"1",	"",		{"","","","","","","","1_1","","1_1","","","1_1"}},
	{"1.1.1.11", "1.1.1.6",	{x=6, y=2, z=-3},	2,		2,		"1",	"",		{"","","","","","","","","","","","",""}},
	{"1.1.1.12", "1.1.1.8",	{x=9, y=2, z=-5},	3,		2,		"1",	"",		{"","","","","","","","","","","","",""}},
	{"1.1.1.13", "1.1.1.10",{x=12, y=2, z=-3},	2,		2,		"1",	"",		{"","","","","","","","","","","","",""}},
	{"1.1.1.14", "1.1.1.11",{x=15, y=2, z=-1},	4,		2,		"1",	"",		{"","","","","","","","","","","","","shop1"}},
	{"1.1.1.15", "1.1.1.12",{x=12, y=2, z=0},	1,		2,		"1",	"",		{"","","","","","","","","","","","",""}},
	{"1.1.1.16", "1.1.1.9",	{x=3, y=2, z=6},	4,		4,		"1",	"",		{"","","","","","","","","","","","",""}},
	{"1.1.1.17", "1.1.1.13",{x=6, y=2, z=7},	1,		4,		"1",	"",		{"","","","","","","","","","","","",""}},
	{"1.1.1.18", "1.1.1.14",{x=6, y=2, z=11},	2,		4,		"1",	"",		{"","","","1_1","","","","","","","","",""}},
	{"1.1.1.19", "1.1.1.7",{x=12, y=2, z=7},	1,		2,		"1",	"",		{"","","","","","","","","","","","",""}},
	{"1.1.1.20", "1.1.1.12",{x=15, y=2, z=2},	3,		2,		"1",	"",		{"","","","","","","","","","","","",""}}, -->race?
	{"1.1.1.21", "1.1.1.16",{x=15, y=2, z=9},	3,		2,		"1",	"",		{"","","","1_1","","1_1","","1_1","","","1_1","","1_1"}},
	{"1.1.1.22", "1.1.1.17",{x=15, y=2, z=6},	4,		2,		"1",	"",		{"","","1_1","","1_1","","1_1","","","","","1_1","1_1"}},
	{"1.1.1.23", "1.1.1.18",{x=12, y=2, z=11},	2,		2,		"1",	"",		{"","","1_1","","1_1","","","","1_1","","1_1","","1_1"}},
	{"1.1.1.24", "1.1.1.19",{x=6, y=2, z=14},	1,		2,		"1",	"",		{"","","","","","1_1","","1_1","","","","",""}},
	{"1.1.1.25", "1.1.1.20",{x=3, y=2, z=13},	4,		2,		"1",	"",		{"","","","","","","","","","","","",""}},


	{"1.1.2.1", "1.1.1.5",	{x=3, y=2, z=-5},	3,		4,		"2",	"",		{"","","","","","","","","2_1","","2_1","",""}},
	{"1.1.2.2", "1.1.1.6",	{x=6, y=2, z=-7},	1,		4,		"2",	"",		{"","","","","","","","","","","","","shop2"}},
	{"1.1.2.3", "1.1.2.1",	{x=0, y=2, z=-7},	1,		4,		"2",	"",		{"","","2_1","","2_1","","","","","","","","2_1"}},
	{"1.1.2.4", "1.1.2.2",	{x=3, y=2, z=-8},	4,		6,		"2",	"",		{"","","","","","","2_1","","2_1","","2_1","",""}},
	{"1.1.2.5", "1.1.2.3",	{x=0, y=2, z=-10},	2,		4,		"2",	"",		{"","","","","","","","","","","","",""}},
	{"1.1.2.6", "1.1.2.4",	{x=3, y=2, z=-12},	3,		6,		"2",	"",		{"","","","","","","","","","","","",""}},
	{"1.1.2.7", "1.1.2.6",	{x=6, y=2, z=-14},	1,		8,		"2",	"",		{"","","","","","","","","","2_1","","2_1",""}},
	{"1.1.2.8", "1.1.2.7",	{x=9, y=2, z=-12},	3,		10,		"2",	"",		{"","","","","","","","","","","","","smith1"}},
	{"1.1.2.9", "1.1.2.8",	{x=6, y=2, z=-10},	2,		6,		"2",	"",		{"2_1","","","2_1","","","2_1","","2_1","","2_1","","2_1"}},
	{"1.1.2.10", "1.1.2.9",	{x=3, y=2, z=-15},	4,		6,		"2",	"",		{"2_1","","2_1","","2_1","","","","","","","",""}},
	{"1.1.2.11", "1.1.2.10",{x=6, y=2, z=-17},	2,		6,		"2",	"",		{"2_1","","","","","","","","","","2_1","","2_1"}},
	{"1.1.2.12", "1.1.2.7",	{x=0, y=2, z=-14},	1,		8,		"2",	"",		{"","","","","","","","","","","","","tool1"}},
	

	{"1.1.3.1", "1.1.2.5",	{x=-3, y=2, z=-8},	4,		4,		"3",	"",		{"","","","","","","","","","","","","tool2"}},
	
	
}

dofile(minetest.get_modpath("stella").."/functions.lua")
dofile(minetest.get_modpath("stella").."/nodebox.lua")
dofile(minetest.get_modpath("stella").."/hexagon_nodes.lua")
dofile(minetest.get_modpath("stella").."/inv.lua")
dofile(minetest.get_modpath("stella").."/nodes.lua")
dofile(minetest.get_modpath("stella").."/on_join.lua")
dofile(minetest.get_modpath("stella").."/on_new.lua")
dofile(minetest.get_modpath("stella").."/receive_fields.lua")
dofile(minetest.get_modpath("stella").."/set_hexagon.lua")
dofile(minetest.get_modpath("stella").."/tools.lua")
dofile(minetest.get_modpath("stella").."/update_tasks.lua")
dofile(minetest.get_modpath("stella").."/global_step.lua")


minetest.register_chatcommand("additems", {
    params = "<itemname> <count>",
    description = "Gives resources to player",
    func = function(name, param)
        local itemname, count = param:match("^(%S+)%s+(%d+)$")
        if not (itemname and count) then
            return false, "Wrong parameters. Syntax: /additems <item> <count>"
        end
        local player = minetest.get_player_by_name(name)
        if not player then
            return false, "Player not found."
        end
        count = tonumber(count)
        local inv = player:get_inventory()
		inv:add_item("inv", itemname .. " " .. count)
		sort_inventory(inv, "inv")
		sort_inventory(stella.stella_inv, "inv")
		player:set_inventory_formspec(stella.invget_formspec(player))
		return true, itemname .. " " .. count
    end,
})

minetest.register_chatcommand("update", {
    params = "",
    description = "Update Map",
    func = function(name, param)
		update(name)
    end,
})

function update(name)
	local player = minetest.get_player_by_name(name)
	local vm = minetest.get_voxel_manip()
	local pos1 = {x=get_hex_bounds().min_x-10, y=-1, z=get_hex_bounds().min_z-10}
	local pos2 = {x=get_hex_bounds().max_x+10, y=5, z=get_hex_bounds().max_z+10}
	local vm, emin, emax
	vm = minetest.get_voxel_manip()
	emin, emax = vm:read_from_map(pos1, pos2)
	local area = VoxelArea:new{MinEdge=emin, MaxEdge=emax}
	local data = vm:get_data()
	for z = pos1.z, pos2.z do
		for y = pos1.y, pos2.y do
			local vi = area:index(pos1.x, y, z)
			local node = "stella:water"
			for x = pos1.x, pos2.x do
				if node then
					if y < 2 then
						data[vi] = minetest.get_content_id("stella:water")
					else
						data[vi] = minetest.get_content_id("air")
					end
				end
				vi = vi + 1
			end
		end
	end
	for _, obj in ipairs(minetest.get_objects_inside_radius(
		{x=(pos1.x+pos2.x)/2, y=(pos1.y+pos2.y)/2, z=(pos1.z+pos2.z)/2},
		math.max(math.abs(pos2.x - pos1.x), math.abs(pos2.y - pos1.y), math.abs(pos2.z - pos1.z))/2
		)) do
		if obj:is_player() == false then
			obj:remove()
		end
	end
	vm:set_data(data)
	vm:write_to_map(data)
	set_hexagon("1.1.1.0", player,true)
	for hexagon_id = 1, #stella.tasks do
		if player:get_attribute(stella.tasks[hexagon_id][1]) == "y" then
			set_hexagon(stella.tasks[hexagon_id][1], player,true)
		end
	end
end