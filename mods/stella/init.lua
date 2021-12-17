local hud = {}

			
minetest.register_on_joinplayer(function(player)
	local name = player:get_player_name()
	player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=10},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "For Minetest 	  :  5.4.x",
	})
	player:hud_add({
		hud_elem_type = "text",
		position = {x=0, y=0.85},
		offset = {x=0, y=30},
		alignment = {x=1, y=0},
		number = 0xFFFFFF ,
		text = "Game Version	 :  0.3.0",
	})
	hud["1"] = player:hud_add({
		hud_elem_type = "waypoint",
		number = 0xFFFFFF ,
		world_pos = {x=0, y=0, z=0},
		precision = 0,
		name = "",
	})
	hud["2"] = player:hud_add({
		hud_elem_type = "waypoint",
		number = 0xFFFFFF ,
		world_pos = {x=0, y=0, z=0},
		precision = 0,
		name = "",
	})
	hud["3"] = player:hud_add({
		hud_elem_type = "waypoint",
		number = 0xFFFFFF ,
		world_pos = {x=0, y=0, z=0},
		precision = 0,
		name = "",
	})
	hud["4"] = player:hud_add({
		hud_elem_type = "waypoint",
		number = 0xFFFFFF ,
		world_pos = {x=0, y=0, z=0},
		precision = 0,
		name = "",
	})
	hud["5"] = player:hud_add({
		hud_elem_type = "waypoint",
		number = 0xFFFFFF ,
		world_pos = {x=0, y=0, z=0},
		precision = 0,
		name = "",
	})
end)
function distance(a, b)
	local x = a.x - b.x
	local y = a.y - b.y
	local z = a.z - b.z
	return math.hypot(x, math.hypot(y, z))
end
function nextrange(x, max)
	x = x + 1
	if x > max then
		x = 0
	end
	return x
end
function screwdriver_handler(user, pointed_thing, mode)
    if pointed_thing.type ~= "node" then
		return
	end
	local pos = pointed_thing.under
	local keys = user:get_player_control()
	local player_name = user:get_player_name()
	if minetest.is_protected(pos, user:get_player_name()) then
		minetest.record_protection_violation(pos, user:get_player_name())
		return
	end
	local node = minetest.get_node(pos)
	local ndef = minetest.registered_nodes[node.name]
	if not ndef or not ndef.paramtype2 == "facedir" or
			(ndef.drawtype == "nodebox" and
			not ndef.node_box.type == "fixed") or
			node.param2 == nil then
		return
	end
	local n = node.param2
	local axisdir = math.floor(n / 4)
	local rotation = n - axisdir * 4
	if mode == 1 then
		n = axisdir * 4 + nextrange(rotation, 3)
	elseif mode == 3 then
		n = nextrange(axisdir, 5) * 4
	end
	node.param2 = n
	minetest.swap_node(pos, node)
end

local inv = {}
inv.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    local stella_inv = minetest.create_detached_inventory(player:get_player_name().."_stella_inv",{
		allow_put = function(inv, listname, index, stack, player)
			return 0
		end,
		allow_take = function(inv, listname, index, stack, player)
			return 0
		end,
		allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
			return 0
		end,
	})
	stella_inv:set_size("tool", 3)
	player_inv:set_size("tool", 3)
	stella_inv:set_size("armor", 2)
	player_inv:set_size("armor", 2)
    stella_inv:set_size("inv", 40)
	player_inv:set_size("inv", 40)
    for i=1, 3 do
		local stack = player_inv:get_stack("main", i)
		stella_inv:set_stack("tool", i, stack)
    end
	for i=1, 2 do
        local stack = player_inv:get_stack("armor", i)
		stella_inv:set_stack("armor", i, stack)
    end
	for i=1, 40 do
        local stack = player_inv:get_stack("inv", i)
		stella_inv:set_stack("inv", i, stack)
    end
	formspec = "size[8,7.5]"
        .."list[detached:"..player:get_player_name().."_stella_inv;tool;2.5,0.5;5,1]"
        .."list[detached:"..player:get_player_name().."_stella_inv;armor;1,1;1,1]"
		.."list[detached:"..player:get_player_name().."_stella_inv;armor;6,1;1,1;1]"
        .."list[detached:"..player:get_player_name().."_stella_inv;inv;0,2.7;8,5]"
	return formspec		
end

local stella_inv2 = minetest.create_detached_inventory("singleplayer_stella_inv2",{
	allow_put = function(inv, listname, index, stack, player)
		return 0
	end,
	allow_take = function(inv, listname, index, stack, player)
		return 0
	end,
	allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
		return 0
	end,
})
	
local timber1 = {}
timber1.get_formspec = function(player, pos)
	if player == nil then
        return
    end
    local player_inv = player:get_inventory()
    stella_inv2:set_size("inv", 40)
	player_inv:set_size("inv", 40)
	stella_inv2:set_size("t1_from1", 1)
	stella_inv2:set_size("t1_from2", 1)
	stella_inv2:set_size("t1_from", 1)
	stella_inv2:set_size("t1_to1", 1)
	stella_inv2:set_size("t1_to2", 1)
	
	player_inv:set_size("t1_from", 1)
	for i=1, 40 do
        local stack = player_inv:get_stack("inv", i)
		stella_inv2:set_stack("inv", i, stack)
    end
	
	local stack = player_inv:get_stack("t1_from", 1)
	stella_inv2:set_stack("t1_from", 1, stack)
		
	local purple = player_inv:get_stack("inv", 1):get_count()
	
	if purple > 2 and player_inv:get_stack("inv", 1):get_name() == "stella:resource_1" then
		stella_inv2:set_stack("t1_from1", 1, "stella:resource_1 3")
		stella_inv2:set_stack("t1_to1", 1, "stella:resource_3")
	else
		stella_inv2:set_stack("t1_from1", 1, "")
		stella_inv2:set_stack("t1_to1", 1, "")
	end
	
	if purple > 2 and player_inv:get_stack("inv", 1):get_name() == "stella:resource_1" then
		stella_inv2:set_stack("t1_from2", 1, "stella:resource_1 "..math.floor(purple/3)*3)
		stella_inv2:set_stack("t1_to2", 1, "stella:resource_3 "..math.floor(purple/3))
	else
		stella_inv2:set_stack("t1_from2", 1, "")
		stella_inv2:set_stack("t1_to2", 1, "")
	end
	
	formspec = "size[8,7.5]"
		.."list[detached:"..player:get_player_name().."_stella_inv2;t1_from1;1,0;1,1]"
		.."list[detached:"..player:get_player_name().."_stella_inv2;t1_from2;1,1;1,1]"
		.."list[detached:"..player:get_player_name().."_stella_inv2;t1_from;6,0.5;1,1]"
		.."list[detached:"..player:get_player_name().."_stella_inv2;t1_to1;4,0;1,1]"
		.."list[detached:"..player:get_player_name().."_stella_inv2;t1_to2;4,1;1,1]"
		.."button[2,0;2,1;timber1_1;-->]"
		.."button[2,1;2,1;timber1_2;-->]"
        .."list[detached:"..player:get_player_name().."_stella_inv2;inv;0,2.7;8,5]"
	return formspec		
end


minetest.register_on_player_receive_fields(function(player, formname, fields)
    local player_inv = player:get_inventory()
	local meta = player:get_meta()
    if fields.timber1_1 then
        local purple = player_inv:get_stack("inv", 1):get_count()
		if purple > 2 and player_inv:get_stack("inv", 1):get_name() == "stella:resource_1" then
			player_inv:remove_item("inv", "stella:resource_1 3")
			stella_inv2:remove_item("inv", "stella:resource_1 3")
			stella_inv2:add_item("t1_from", "stella:resource_1 3")
			player_inv:add_item("t1_from", "stella:resource_1 3")
			minetest.show_formspec(player:get_player_name(), "timber1" , timber1.get_formspec(player))
		end
	end	
	if fields.timber1_2 then
        local purple = player_inv:get_stack("inv", 1):get_count()
		if purple > 2 and player_inv:get_stack("inv", 1):get_name() == "stella:resource_1" then
			player_inv:remove_item("inv", "stella:resource_1 "..math.floor(purple/3)*3)
			stella_inv2:remove_item("inv", "stella:resource_1 "..math.floor(purple/3)*3)
			stella_inv2:add_item("t1_from", "stella:resource_1 "..math.floor(purple/3)*3)
			player_inv:add_item("t1_from", "stella:resource_1 "..math.floor(purple/3)*3)
			minetest.show_formspec(player:get_player_name(), "timber1" , timber1.get_formspec(player))
		end
	end	
end)
	
minetest.register_craftitem("stella:pick1", {
    description = "Pick 1",
	inventory_image = "stella_pick1.png",
})

minetest.register_craftitem("stella:axe1", {
    description = "Axe 1",
	inventory_image = "stella_axe1.png",
})

local resources = { --to do
	--ID  	tool	tool level	max items	needed level	textures	respawn time
	{"1", 	"axe", 	1,			6,			1,				6,			10},
}

for resource = 1, #resources do
	for i=1,resources[resource][6] do
		minetest.register_entity("stella:resource_1_"..i, {
			physical = true,
			visual_size = {x=10, y=10},
			collisionbox = {-0.5,-0.5,-0.5, 0.5,0.5,0.5},
			visual = "mesh",
			mesh = "resource_"..i..".obj",
			textures = {"stella_resource"..resources[resource][1]..".png"},
			selectionbox = {0, 0, 0, 0, 0, 0},
			hp_max = resources[resource][4]+1,
		})
	end
end




local tasks = {
	{"1.1.1.1","1.1.1.0",{x=6.5, y=2, z=3},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {10,0,0,0}},
	{"1.1.1.2","1.1.1.1",{x=9.5, y=2, z=4.75},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {25,0,0,0}},
	{"1.1.1.3","1.1.1.2",{x=9.5, y=2, z=8.25},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {25,0,0,0}},
	
	{"1.1.1.4","1.1.1.3",{x=11, y=2, z=3.875},{"stella:resource_1","","",""}, {"Purple Resource","","",""}, {10,0,0,0}},
	{"1.1.1.5","1.1.1.3",{x=3.5, y=2, z=-2.25},{"stella:resource_3","","",""}, {"Orange Resource","","",""}, {0,0,0,0}},
}

local hexagons = {
	--ID	   	need ID	  	pos 				num		Height	Sector		Spawn	Blocks
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
}


minetest.register_on_joinplayer(function(player)
	player:set_attribute("1.1.1.0", "y")
	if player:get_player_name() == "singleplayer" then
    else
        minetest.kick_player(player:get_player_name(), "you can play stella only as 'singleplayer'")
    end
	
	update_tasks(player)
	player:hud_set_hotbar_itemcount(3)
	player:hud_set_hotbar_image("stella_gui_hotbar.png")
	player:hud_set_hotbar_selected_image("stella_gui_hotbar_selected.png")
	
	local formspec = "bgcolor[#080808BB;true]"
		.."listcolors[#00000069;#5A5A5A;#141318;#30434C;#FFF] "
		.. "background9[5,5;1,1;stella_gui_formbg.png;true;10]"
	player:set_formspec_prepend(formspec)
	player:set_inventory_formspec(inv.get_formspec(player))
	stella_inv2:set_size("inv", 40)
end)


minetest.register_on_newplayer(function(player)
	local activ = {{"1.1.1.1",0,0,0,0}}
	player:set_attribute("activ_task", minetest.serialize(activ))
	player:set_pos({x=0.5, y=2, z=1.25})
	local player_inv = player:get_inventory()
	player_inv:set_stack("main", 1, "stella:axe1")
	player_inv:set_stack("main", 2, "stella:pick1")
	set_hexagon("1.1.1.0", player, true)
	player:set_attribute("LMB", 0)
end)

local timer = 0
local timer2 = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime
	timer2 = timer2 + dtime
	local players = minetest.get_connected_players()
	for _,player in ipairs(players) do
		local keys = player:get_player_control()
		if keys["LMB"] == true then
			if tonumber(player:get_attribute("LMB")) > 0.5 then
				player:set_attribute("LMB", 0)
			end
			if tonumber(player:get_attribute("LMB")) == 0 then
				local all_objects = minetest.get_objects_inside_radius(player:get_pos(), 2.2)
				for k, obj in pairs(all_objects) do
					if obj:get_luaentity() ~= nil then
						local tool_level = tonumber(string.match(player:get_wielded_item():get_name():sub(8), "%d+"))
						local tool = player:get_wielded_item():get_name():sub(8):gsub("%d+", "")
						for resource = 1, #resources do
							if string.sub(obj:get_luaentity().name,1,18) == "stella:resource_"..resources[resource][1].."_" then -- ID > 10
								if tool == resources[resource][2] and tool_level >= resources[resource][3] then
									if obj:get_hp() > 1 then
										local hp = obj:get_hp()
										local pos = obj:get_pos()
										local new_mesh = 1+math.floor((resources[resource][4]+2-obj:get_hp())*(resources[resource][6]-1)/resources[resource][4])
										obj:remove()
										local obj2 = minetest.env:add_entity(pos,"stella:resource_"..resources[resource][1].."_"..new_mesh) -- ID > 10
										obj2:set_hp(hp-1) --needed level
										if obj2:get_hp() == 1 then
											minetest.after(resources[resource][7], function() 
												obj2:remove()
												minetest.env:add_entity(pos,"stella:resource_"..resources[resource][1].."_1")
											end)
										end
										local player_inv = player:get_inventory()
										player_inv:add_item("inv", "stella:resource_"..resources[resource][1])
										sort_inventory(player_inv, "inv")
										player:set_inventory_formspec(inv.get_formspec(player))
									end
								end
							end
						end
					end
				end
			end
			player:set_attribute("LMB", tonumber(player:get_attribute("LMB"))+dtime)
        elseif keys["LMB"] == false then
            player:set_attribute("LMB", tonumber(player:get_attribute("LMB"))+dtime)
        end
	end
	if timer >= 0.2 then
		timer = 0
		set_hexagon("1.1.1.0", player,false)
		for _,player in ipairs(players) do
			local player_inv = player:get_inventory()
			player:hud_set_hotbar_image("stella_gui_hotbar.png")
			local activ = minetest.deserialize(player:get_attribute("activ_task"))
			for activCount = 1, #activ do
				for tasksCount = 1, #tasks do
					if tasks[tasksCount][1] == activ[activCount][1] and distance(tasks[tasksCount][3], player:get_pos()) < 1 then
						if activ[activCount][2] < tasks[tasksCount][6][1] then
							if player_inv:contains_item("inv",tasks[tasksCount][4][1]) then
								player_inv:remove_item("inv",tasks[tasksCount][4][1])
								activ[activCount][2] = activ[activCount][2] + 1
							end
						end
						if activ[activCount][3] < tasks[tasksCount][6][2] then
							if player_inv:contains_item("inv",tasks[tasksCount][4][2]) then
								player_inv:remove_item("inv",tasks[tasksCount][4][2])
								activ[activCount][3] = activ[activCount][3] + 1
							end
						end
						if activ[activCount][4] < tasks[tasksCount][6][3] then
							if player_inv:contains_item("inv",tasks[tasksCount][4][3]) then
								player_inv:remove_item("inv",tasks[tasksCount][4][3])
								activ[activCount][4] = activ[activCount][4] + 1
							end
						end
						if activ[activCount][5] < tasks[tasksCount][6][4] then
							if player_inv:contains_item("inv",tasks[tasksCount][4][4]) then
								player_inv:remove_item("inv",tasks[tasksCount][4][4])
								activ[activCount][5] = activ[activCount][5] + 1
							end
						end
						player:set_inventory_formspec(inv.get_formspec(player))
						player:set_attribute("activ_task", minetest.serialize(activ))
						update_tasks(player)
						activ = minetest.deserialize(player:get_attribute("activ_task"))
						sort_inventory(player_inv, "inv")
						return
					end
				end
			end
			
		end
	end
	if timer2 >= 1.5 then
		timer2 = 0
		for _,player in ipairs(players) do
			local player_inv = player:get_inventory()
			if player_inv:contains_item("t1_from", "stella:resource_1") then
				stella_inv2:remove_item("t1_from", "stella:resource_1 3")
				player_inv:remove_item("t1_from", "stella:resource_1 3")
				player_inv:add_item("inv", "stella:resource_3")
				stella_inv2:add_item("inv", "stella:resource_3")
				player:set_inventory_formspec(inv.get_formspec(player))
				sort_inventory(player_inv, "inv")
				sort_inventory(stella_inv2, "inv")
			end
		end
	end
end)

function update_tasks(player)
	local activ = minetest.deserialize(player:get_attribute("activ_task"))
	for activCount = 1, #activ do
		for tasksCount = 1, #tasks do
			if tasks[tasksCount][1] == activ[activCount][1] then
				player:hud_change(hud[""..activCount], 'world_pos', tasks[tasksCount][3])
				local name = ""
				if tasks[tasksCount][6][3] ~= 0 then
					name = activ[activCount][2].."/"..tasks[tasksCount][6][1].." "..tasks[tasksCount][5][1].."\n"..activ[activCount][3].."/"..tasks[tasksCount][6][2].." "..tasks[tasksCount][5][2].."\n"..activ[activCount][4].."/"..tasks[tasksCount][6][3].." "..tasks[tasksCount][5][3]
				elseif tasks[tasksCount][6][2] ~= 0 then
					name = activ[activCount][2].."/"..tasks[tasksCount][6][1].." "..tasks[tasksCount][5][1].."\n"..activ[activCount][3].."/"..tasks[tasksCount][6][2].." "..tasks[tasksCount][5][2]
				elseif tasks[tasksCount][6][1] ~= 0 then
					name = activ[activCount][2].."/"..tasks[tasksCount][6][1].." "..tasks[tasksCount][5][1]
				else
					name = "comming soon"
				end
				player:hud_change(hud[""..activCount], 'name', name)
				if tasks[tasksCount][6][1] ~= 0 and activ[activCount][2] == tasks[tasksCount][6][1] and activ[activCount][3] == tasks[tasksCount][6][2] and activ[activCount][4] == tasks[tasksCount][6][3] and activ[activCount][5] == tasks[tasksCount][6][4] then
					player:set_attribute(""..activ[activCount][1], "y")
					table.remove(activ, activCount)
					set_hexagon(tasks[tasksCount][1],player, true)
					for tasksCount2 = 1, #tasks do
						if tasks[tasksCount2][2] == tasks[tasksCount][1] then
							table.insert(activ,{tasks[tasksCount2][1],0,0,0,0})
						end
					end
					player:set_attribute("activ_task", minetest.serialize(activ))
					player:hud_change(hud["1"], 'name', "")
					player:hud_change(hud["2"], 'name', "")
					player:hud_change(hud["3"], 'name', "")
					player:hud_change(hud["4"], 'name', "")
					player:hud_change(hud["5"], 'name', "")
					update_tasks(player)
					return
				end
			end
		end
	end
end

function sort_inventory(inv,list)
	local inlist = inv:get_list(list)
	local typecnt = {}
	local typekeys = {}
	for _, st in ipairs(inlist) do
		if not st:is_empty() then
			local n = st:get_name()
			local w = st:get_wear()
			local m = st:get_metadata()
			local k = string.format("%s %05d %s", n, w, m)
			if not typecnt[k] then
				typecnt[k] = {
					name = n,
					wear = w,
					metadata = m,
					stack_max = st:get_stack_max(),
					count = 0,
				}
				table.insert(typekeys, k)
			end
			typecnt[k].count = typecnt[k].count + st:get_count()
		end
	end
	table.sort(typekeys)
	local outlist = {}
	for _, k in ipairs(typekeys) do
		local tc = typecnt[k]
		while tc.count > 0 do
			local c = math.min(tc.count, tc.stack_max)
			table.insert(outlist, ItemStack({
				name = tc.name,
				wear = tc.wear,
				metadata = tc.metadata,
				count = c,
			}))
			tc.count = tc.count - c
		end
	end
	if #outlist > #inlist then return end
	while #outlist < #inlist do
		table.insert(outlist, ItemStack(nil))
	end
	inv:set_list(list, outlist)
end

function set_hexagon(id, player, blocks)
	for hexagonsCount = 1, #hexagons do
		if hexagons[hexagonsCount][2] == id then
			local pos = hexagons[hexagonsCount][3]
			local y_pos = 2.5+0.16666666*hexagons[hexagonsCount][5]
			local block2 = {
				{{}, {x=pos.x-0.21, y=y_pos, z=pos.z-0.5}, 	{}, 	{x=pos.x-0.21, y=y_pos, z=pos.z-0.75}},
				{{}, {x=pos.x-0.57, y=y_pos, z=pos.z+0.13}, {}, 	{x=pos.x-0.57, y=y_pos, z=pos.z-0.12}},
				{{}, {x=pos.x-0.92, y=y_pos, z=pos.z+0.75}, {}, 	{x=pos.x-0.92, y=y_pos, z=pos.z+0.5}},
				{{}, {x=pos.x-0.57, y=y_pos, z=pos.z+1.37}, {}, 	{x=pos.x-0.57, y=y_pos, z=pos.z+1.12}},
				{{}, {x=pos.x-0.21, y=y_pos, z=pos.z+2.0}, 	{}, 	{x=pos.x-0.21, y=y_pos, z=pos.z+1.75}},
				{{}, {x=pos.x+0.5, y=y_pos, z=pos.z+2.0}, 	{}, 	{x=pos.x+0.5, y=y_pos, z=pos.z+1.75}},
				{{}, {x=pos.x+1.21, y=y_pos, z=pos.z+2.0}, 	{}, 	{x=pos.x+1.21, y=y_pos, z=pos.z+1.75}},
				{{}, {x=pos.x+1.57, y=y_pos, z=pos.z+1.37}, {}, 	{x=pos.x+1.57, y=y_pos, z=pos.z+1.12}},
				{{}, {x=pos.x+1.92, y=y_pos, z=pos.z+0.75}, {}, 	{x=pos.x+1.92, y=y_pos, z=pos.z+0.5}},
				{{}, {x=pos.x+1.57, y=y_pos, z=pos.z+0.13}, {}, 	{x=pos.x+1.57, y=y_pos, z=pos.z-0.12}},
				{{}, {x=pos.x+1.21, y=y_pos, z=pos.z-0.5}, 	{}, 	{x=pos.x+1.21, y=y_pos, z=pos.z-0.75}},
				{{}, {x=pos.x+0.5, y=y_pos, z=pos.z-0.5}, 	{}, 	{x=pos.x+0.5, y=y_pos, z=pos.z-0.75}},
				{{}, {x=pos.x+0.5, y=y_pos, z=pos.z+0.75}, 	{}, 	{x=pos.x+0.5, y=y_pos, z=pos.z+0.5}}
			}
			if hexagons[hexagonsCount][4] == 1 then
				minetest.place_schematic({x=pos.x, y=pos.y, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..hexagons[hexagonsCount][6].."_"..hexagons[hexagonsCount][5].."_1.mts","90")
				minetest.place_schematic({x=pos.x, y=pos.y-1, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..hexagons[hexagonsCount][6].."_g_1.mts","0")
				minetest.place_schematic({x=pos.x, y=pos.y-2, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..hexagons[hexagonsCount][6].."_g_1.mts","0")
				minetest.place_schematic({x=pos.x, y=pos.y-3, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..hexagons[hexagonsCount][6].."_g_1.mts","0")
			elseif hexagons[hexagonsCount][4] == 3 then
				minetest.place_schematic({x=pos.x, y=pos.y, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..hexagons[hexagonsCount][6].."_"..hexagons[hexagonsCount][5].."_2.mts","90")
				minetest.place_schematic({x=pos.x, y=pos.y-1, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..hexagons[hexagonsCount][6].."_g_2.mts","90")
				minetest.place_schematic({x=pos.x, y=pos.y-2, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..hexagons[hexagonsCount][6].."_g_2.mts","90")
				minetest.place_schematic({x=pos.x, y=pos.y-3, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..hexagons[hexagonsCount][6].."_g_2.mts","90")
			elseif hexagons[hexagonsCount][4] == 4 then
				minetest.place_schematic({x=pos.x, y=pos.y, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..hexagons[hexagonsCount][6].."_"..hexagons[hexagonsCount][5].."_3.mts","90")
				minetest.place_schematic({x=pos.x, y=pos.y-1, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..hexagons[hexagonsCount][6].."_g_3.mts","90")
				minetest.place_schematic({x=pos.x, y=pos.y-2, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..hexagons[hexagonsCount][6].."_g_3.mts","90")
				minetest.place_schematic({x=pos.x, y=pos.y-3, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..hexagons[hexagonsCount][6].."_g_3.mts","90")
			elseif hexagons[hexagonsCount][4] == 2 then
				minetest.place_schematic({x=pos.x, y=pos.y, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..hexagons[hexagonsCount][6].."_"..hexagons[hexagonsCount][5].."_1.mts","270")
				minetest.place_schematic({x=pos.x, y=pos.y-1, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..hexagons[hexagonsCount][6].."_g_1.mts","180")
				minetest.place_schematic({x=pos.x, y=pos.y-2, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..hexagons[hexagonsCount][6].."_g_1.mts","180")
				minetest.place_schematic({x=pos.x, y=pos.y-3, z=pos.z}, minetest.get_modpath("stella").."/schems/sector_"..hexagons[hexagonsCount][6].."_g_1.mts","180")
			end
			if blocks then
				for i = 1, 13 do
					if hexagons[hexagonsCount][8][i] then
						if hexagons[hexagonsCount][8][i] ~= "" and hexagons[hexagonsCount][8][i] ~= "timber1" then
							minetest.env:add_entity(block2[i][hexagons[hexagonsCount][4]],"stella:resource_"..hexagons[hexagonsCount][8][i])
						elseif hexagons[hexagonsCount][8][i] == "timber1" then
							minetest.set_node({x=pos.x, y=pos.y+1, z=pos.z+1}, {name="stella:timber1"})
						end
					end
				end
			end
		end
	end
end

minetest.register_node(minetest.get_current_modname()..":ground",{
	description = "Ground",
	tiles = {"stella_ground.png"}, 
	selection_box = {type = "fixed",fixed = {}--{-0.5, -0.5, -0.5, 0.5, -0.16667, 0.5}
	},
})

minetest.register_node(minetest.get_current_modname()..":resource_1",{
	description = "Purple Resource",
	tiles = {"stella_resource1.png"}, 
	stack_max = 99999,
})

minetest.register_node(minetest.get_current_modname()..":resource_3",{
	description = "Orange Resource",
	tiles = {"stella_resource3.png"}, 
	stack_max = 99999,
})

local box2 = {}
local box4 = {}
local box6 = {}
local boxg = {}
for i=1,18 do
	box2[i] = {}
	box4[i] = {}
	box6[i] = {}
	boxg[i] = {}
end
for i=1,10 do
	table.insert(box2[1], 	{-0.5-0.2*i/3.5, 		-0.5, 	-0.6+0.1*i, 	0.5, 					-0.16667, 	-0.5+0.1*i})
	table.insert(box2[4], 	{-0.5, 					-0.5, 	-0.6+0.1*i, 	0.5+0.2*i/3.5, 			-0.16667, 	-0.5+0.1*i})
	table.insert(box2[7], 	{-0.5-0.2*i/3.5, 		-0.5, 	-0.85+0.1*i, 	0.5, 					-0.16667, 	-0.75+0.1*i})
	table.insert(box2[10], 	{-0.5, 					-0.5, 	-0.85+0.1*i, 	0.5+0.2*i/3.5, 			-0.16667, 	-0.75+0.1*i})
	table.insert(box4[1], 	{-0.5-0.2*i/3.5, 		-0.5, 	-0.6+0.1*i, 	0.5, 					0.16667, 	-0.5+0.1*i})
	table.insert(box4[4], 	{-0.5, 					-0.5, 	-0.6+0.1*i, 	0.5+0.2*i/3.5, 			0.16667, 	-0.5+0.1*i})
	table.insert(box4[7], 	{-0.5-0.2*i/3.5, 		-0.5, 	-0.85+0.1*i, 	0.5, 					0.16667, 	-0.75+0.1*i})
	table.insert(box4[10], 	{-0.5, 					-0.5, 	-0.85+0.1*i, 	0.5+0.2*i/3.5, 			0.16667, 	-0.75+0.1*i})
	table.insert(box6[1], 	{-0.5-0.2*i/3.5, 		-0.5, 	-0.6+0.1*i, 	0.5, 					0.5, 		-0.5+0.1*i})
	table.insert(box6[4], 	{-0.5, 					-0.5, 	-0.6+0.1*i, 	0.5+0.2*i/3.5, 			0.5, 		-0.5+0.1*i})
	table.insert(box6[7], 	{-0.5-0.2*i/3.5, 		-0.5, 	-0.85+0.1*i, 	0.5, 					0.5, 		-0.75+0.1*i})
	table.insert(box6[10], 	{-0.5, 					-0.5, 	-0.85+0.1*i, 	0.5+0.2*i/3.5, 			0.5, 		-0.75+0.1*i})
end

for i=1,17 do
	table.insert(box2[13], 	{-0.5-0.2*i/3.5, 		-0.5, 	-1.35+0.1*i, 	0.5, 					-0.16667, 	-1.25+0.1*i})
	table.insert(box2[14], 	{-0.5, 					-0.5, 	-1.35+0.1*i, 	0.5+0.2*i/3.5, 			-0.16667, 	-1.25+0.1*i})
	table.insert(box4[13], 	{-0.5-0.2*i/3.5, 		-0.5, 	-1.35+0.1*i, 	0.5, 					0.16667, 	-1.25+0.1*i})
	table.insert(box4[14], 	{-0.5, 					-0.5, 	-1.35+0.1*i, 	0.5+0.2*i/3.5, 			0.16667, 	-1.25+0.1*i})
	table.insert(box6[13], 	{-0.5-0.2*i/3.5, 		-0.5, 	-1.35+0.1*i, 	0.5, 					0.5, 		-1.25+0.1*i})
	table.insert(box6[14], 	{-0.5, 					-0.5, 	-1.35+0.1*i, 	0.5+0.2*i/3.5, 			0.5, 		-1.25+0.1*i})
end
table.insert(box2[13], 	{-0.5-0.2*17.5/3.5, 		-0.5, 	-1.3+0.1*17.5, 	0.5, 					-0.16667, 	-1.25+0.1*17.5})
table.insert(box2[14], 	{-0.5, 						-0.5, 	-1.3+0.1*17.5, 	0.5+0.2*17.5/3.5, 		-0.16667, 	-1.25+0.1*17.5})
table.insert(box4[13], 	{-0.5-0.2*17.5/3.5, 		-0.5, 	-1.3+0.1*17.5, 	0.5, 					0.16667, 	-1.25+0.1*17.5})
table.insert(box4[14], 	{-0.5, 						-0.5, 	-1.3+0.1*17.5, 	0.5+0.2*17.5/3.5, 		0.16667, 	-1.25+0.1*17.5})
table.insert(box6[13], 	{-0.5-0.2*17.5/3.5, 		-0.5, 	-1.3+0.1*17.5, 	0.5, 					0.5, 		-1.25+0.1*17.5})
table.insert(box6[14], 	{-0.5, 						-0.5, 	-1.3+0.1*17.5, 	0.5+0.2*17.5/3.5, 		0.5, 		-1.25+0.1*17.5})

for i=1,18 do
	table.insert(boxg[13], 	{-0.5-0.2*i/3.5, 		-0.5, 	-1.45+0.1*i, 	0.5, 					0.5, 		-1.35+0.1*i})
	table.insert(boxg[14], 	{-0.5, 					-0.5, 	-1.45+0.1*i, 	0.5+0.2*i/3.5, 			0.5, 		-1.35+0.1*i})
end
table.insert(boxg[13], 	{-0.5-0.2*18.5/3.5, 		-0.5, 	-1.3+0.1*17.5, 	0.5, 					0.5, 		-1.25+0.1*17.5})
table.insert(boxg[14], 	{-0.5, 						-0.5, 	-1.3+0.1*17.5, 	0.5+0.2*18.5/3.5, 		0.5, 		-1.25+0.1*17.5})

for i=1,11 do
	table.insert(boxg[1], 	{-0.5-0.2*i/3.5, 		-0.5, 	-0.7+0.1*i, 	0.5, 					0.5, 		-0.6+0.1*i})
	table.insert(boxg[4], 	{-0.5, 					-0.5, 	-0.7+0.1*i, 	0.5+0.2*i/3.5, 			0.5, 		-0.6+0.1*i})
	table.insert(boxg[7], 	{-0.5-0.2*i/3.5, 		-0.5, 	-0.95+0.1*i, 	0.5, 					0.5, 		-0.85+0.1*i})
	table.insert(boxg[10], 	{-0.5, 					-0.5, 	-0.95+0.1*i, 	0.5+0.2*i/3.5, 			0.5, 		-0.85+0.1*i})
end

for i=1,8 do
	table.insert(box2[2], 	{-0.5-0.2*(i+10)/3.5, 	-0.5, 	-0.6+0.1*i, 	0.5, 					-0.16667, 	-0.5+0.1*i})
	table.insert(box2[5], 	{-0.5, 					-0.5, 	-0.6+0.1*i, 	0.5+0.2*(i+10)/3.5, 	-0.16667, 	-0.5+0.1*i})
	table.insert(box2[8], 	{-0.5-0.2*(i+10)/3.5, 	-0.5, 	-0.85+0.1*i, 	0.5, 					-0.16667, 	-0.75+0.1*i})
	table.insert(box2[11], 	{-0.5, 					-0.5, 	-0.85+0.1*i, 	0.5+0.2*(i+10)/3.5, 	-0.16667, 	-0.75+0.1*i})
	table.insert(box4[2], 	{-0.5-0.2*(i+10)/3.5, 	-0.5, 	-0.6+0.1*i, 	0.5, 					0.16667, 	-0.5+0.1*i})
	table.insert(box4[5], 	{-0.5, 					-0.5, 	-0.6+0.1*i, 	0.5+0.2*(i+10)/3.5, 	0.16667, 	-0.5+0.1*i})
	table.insert(box4[8], 	{-0.5-0.2*(i+10)/3.5, 	-0.5, 	-0.85+0.1*i, 	0.5, 					0.16667, 	-0.75+0.1*i})
	table.insert(box4[11], 	{-0.5, 					-0.5, 	-0.85+0.1*i, 	0.5+0.2*(i+10)/3.5, 	0.16667, 	-0.75+0.1*i})
	table.insert(box6[2], 	{-0.5-0.2*(i+10)/3.5, 	-0.5, 	-0.6+0.1*i, 	0.5, 					0.5, 		-0.5+0.1*i})
	table.insert(box6[5], 	{-0.5, 					-0.5, 	-0.6+0.1*i, 	0.5+0.2*(i+10)/3.5, 	0.5, 		-0.5+0.1*i})
	table.insert(box6[8], 	{-0.5-0.2*(i+10)/3.5, 	-0.5, 	-0.85+0.1*i, 	0.5, 					0.5, 		-0.75+0.1*i})
	table.insert(box6[11], 	{-0.5, 					-0.5, 	-0.85+0.1*i, 	0.5+0.2*(i+10)/3.5, 	0.5, 		-0.75+0.1*i})
end

for i=1,9 do
	table.insert(boxg[2], 	{-0.5-0.2*(i+10)/3.5, 	-0.5, 	-0.7+0.1*i, 	0.5, 					0.5, 		-0.6+0.1*i})
	table.insert(boxg[5], 	{-0.5, 					-0.5, 	-0.7+0.1*i, 	0.5+0.2*(i+10)/3.5, 	0.5, 		-0.6+0.1*i})
	table.insert(boxg[8], 	{-0.5-0.2*(i+10)/3.5, 	-0.5, 	-0.95+0.1*i, 	0.5, 					0.5, 		-0.85+0.1*i})
	table.insert(boxg[11], 	{-0.5, 					-0.5, 	-0.95+0.1*i, 	0.5+0.2*(i+10)/3.5, 	0.5, 		-0.85+0.1*i})
end

for i=6,7 do
	table.insert(box2[2], 	{-0.5-0.2*(i+10)/3.5, 	-0.5, 	1.1-0.1*i, 		0.5, 					-0.16667, 	1.0-0.1*i})
	table.insert(box2[5], 	{-0.5, 					-0.5, 	1.1-0.1*i, 		0.5+0.2*(i+10)/3.5, 	-0.16667, 	1.0-0.1*i})
	table.insert(box2[8], 	{-0.5-0.2*(i+10)/3.5, 	-0.5, 	0.85-0.1*i, 	0.5, 					-0.16667, 	0.75-0.1*i})
	table.insert(box2[11], 	{-0.5, 					-0.5, 	0.85-0.1*i, 	0.5+0.2*(i+10)/3.5, 	-0.16667, 	0.75-0.1*i})
	table.insert(box4[2], 	{-0.5-0.2*(i+10)/3.5, 	-0.5, 	1.1-0.1*i, 		0.5, 					0.16667, 	1.0-0.1*i})
	table.insert(box4[5], 	{-0.5, 					-0.5, 	1.1-0.1*i, 		0.5+0.2*(i+10)/3.5, 	0.16667, 	1.0-0.1*i})
	table.insert(box4[8], 	{-0.5-0.2*(i+10)/3.5, 	-0.5, 	0.85-0.1*i, 	0.5, 					0.16667, 	0.75-0.1*i})
	table.insert(box4[11], 	{-0.5, 					-0.5, 	0.85-0.1*i, 	0.5+0.2*(i+10)/3.5, 	0.16667, 	0.75-0.1*i})
	table.insert(box6[2], 	{-0.5-0.2*(i+10)/3.5, 	-0.5, 	1.1-0.1*i, 		0.5, 					0.5, 		1.0-0.1*i})
	table.insert(box6[5], 	{-0.5, 					-0.5, 	1.1-0.1*i, 		0.5+0.2*(i+10)/3.5, 	0.5, 		1.0-0.1*i})
	table.insert(box6[8], 	{-0.5-0.2*(i+10)/3.5, 	-0.5, 	0.85-0.1*i, 	0.5, 					0.5, 		0.75-0.1*i})
	table.insert(box6[11], 	{-0.5, 					-0.5, 	0.85-0.1*i, 	0.5+0.2*(i+10)/3.5, 	0.5, 		0.75-0.1*i})
end

for i=6,8 do
	table.insert(boxg[2], 	{-0.5-0.2*(i+10)/3.5, 	-0.5, 	1.2-0.1*i, 		0.5, 					0.5, 		1.1-0.1*i})
	table.insert(boxg[5], 	{-0.5, 					-0.5, 	1.2-0.1*i, 		0.5+0.2*(i+10)/3.5, 	0.5, 		1.1-0.1*i})
	table.insert(boxg[8], 	{-0.5-0.2*(i+10)/3.5, 	-0.5, 	0.95-0.1*i, 	0.5, 					0.5, 		0.85-0.1*i})
	table.insert(boxg[11], 	{-0.5, 					-0.5, 	0.95-0.1*i, 	0.5+0.2*(i+10)/3.5, 	0.5, 		0.85-0.1*i})
end

for i=1,15 do
	table.insert(box2[3], 	{-0.5-0.2*i/3.5, 		-0.5, 	1.1-0.1*i, 		0.5, 					-0.16667, 	1.0-0.1*i})
	table.insert(box2[6], 	{-0.5, 					-0.5, 	1.1-0.1*i, 		0.5+0.2*i/3.5, 			-0.16667, 	1.0-0.1*i})
	table.insert(box2[9], 	{-0.5-0.2*i/3.5, 		-0.5, 	0.85-0.1*i, 	0.5, 					-0.16667, 	0.75-0.1*i})
	table.insert(box2[12], 	{-0.5, 					-0.5, 	0.85-0.1*i, 	0.5+0.2*i/3.5, 			-0.16667, 	0.75-0.1*i})
	table.insert(box4[3], 	{-0.5-0.2*i/3.5, 		-0.5, 	1.1-0.1*i, 		0.5, 					0.16667, 	1.0-0.1*i})
	table.insert(box4[6], 	{-0.5, 					-0.5, 	1.1-0.1*i, 		0.5+0.2*i/3.5, 			0.16667, 	1.0-0.1*i})
	table.insert(box4[9], 	{-0.5-0.2*i/3.5, 		-0.5, 	0.85-0.1*i, 	0.5, 					0.16667, 	0.75-0.1*i})
	table.insert(box4[12], 	{-0.5, 					-0.5, 	0.85-0.1*i, 	0.5+0.2*i/3.5, 			0.16667, 	0.75-0.1*i})
	table.insert(box6[3], 	{-0.5-0.2*i/3.5, 		-0.5, 	1.1-0.1*i, 		0.5, 					0.5, 		1.0-0.1*i})
	table.insert(box6[6], 	{-0.5, 					-0.5, 	1.1-0.1*i, 		0.5+0.2*i/3.5, 			0.5, 		1.0-0.1*i})
	table.insert(box6[9], 	{-0.5-0.2*i/3.5, 		-0.5, 	0.85-0.1*i, 	0.5, 					0.5, 		0.75-0.1*i})
	table.insert(box6[12], 	{-0.5, 					-0.5, 	0.85-0.1*i, 	0.5+0.2*i/3.5, 			0.5, 		0.75-0.1*i})
end

for i=1,16 do
	table.insert(boxg[3], 	{-0.5-0.2*i/3.5, 		-0.5, 	1.2-0.1*i, 		0.5, 					0.5, 		1.1-0.1*i})
	table.insert(boxg[6], 	{-0.5, 					-0.5, 	1.2-0.1*i, 		0.5+0.2*i/3.5, 			0.5, 		1.1-0.1*i})
	table.insert(boxg[9], 	{-0.5-0.2*i/3.5, 		-0.5, 	0.95-0.1*i, 	0.5, 					0.5, 		0.85-0.1*i})
	table.insert(boxg[12], 	{-0.5, 					-0.5, 	0.95-0.1*i, 	0.5+0.2*i/3.5, 			0.5, 		0.85-0.1*i})
end


for i=1,14 do
	minetest.register_node(minetest.get_current_modname()..":block_1_2_"..i,{
		description = "Sector 1 Block 2."..i,
		tiles = {"stella_sector1.png"}, 
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
	
	minetest.register_node(minetest.get_current_modname()..":block_1_4_"..i,{
		description = "Sector 1 Block 4."..i,
		tiles = {"stella_sector1.png"}, 
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
	
	minetest.register_node(minetest.get_current_modname()..":block_1_6_"..i,{
		description = "Sector 1 Block 6."..i,
		tiles = {"stella_sector1.png"}, 
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
	
	minetest.register_node(minetest.get_current_modname()..":block_1_g_"..i,{
		description = "Sector 1 Block Ground."..i,
		tiles = {"stella_sector1.png"}, 
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

minetest.register_node("stella:timber1", {
	description = "Timber lv.1",
	drawtype = "mesh",
	mesh = "timber1.obj",
	tiles = {"stella_character.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	selection_box = {type = "fixed",fixed = 
		{0, -1.16667, -0.5, 1, 0.83333, 0.5}
	},
	collision_box = {type = "fixed",fixed = 
		{}
	},
	on_punch = function(pos, node, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "timber1" , timber1.get_formspec(player))
	end,
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

