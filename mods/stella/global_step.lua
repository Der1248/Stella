local timer = 0
local timer2 = 0
local timer3 = 0
minetest.register_globalstep(function(dtime)
	timer = timer + dtime
	timer2 = timer2 + dtime
	timer3 = timer3 + dtime
	local players = minetest.get_connected_players()
	for _,player in ipairs(players) do
		local keys = player:get_player_control()
		if keys["LMB"] == true and player:get_attribute("LMB") then
			if tonumber(player:get_attribute("LMB")) > 0.5 then
				player:set_attribute("LMB", 0)
			end
			if tonumber(player:get_attribute("LMB")) == 0 then
				local tool_level = tonumber(string.match(player:get_wielded_item():get_name():sub(8), "%d+"))
				local tool = player:get_wielded_item():get_name():sub(8):gsub("%d+", "")
				for resource = 1, #stella.resources do
					local all_objects = minetest.get_objects_inside_radius(player:get_pos(), 2.2)
					for k, obj in pairs(all_objects) do
						if obj:get_luaentity() ~= nil then
							if string.sub(obj:get_luaentity().name,1,18) == "stella:resource_"..stella.resources[resource][1].."_" then -- ID > 10
								if tool == stella.resources[resource][2] and tool_level >= stella.resources[resource][3] then
									if obj:get_hp() > 1 then
										local hp = obj:get_hp()
										local pos = obj:get_pos()
										local max_items = stella.resources[resource][4]
										local needed_level = stella.resources[resource][5]
										local textures = stella.resources[resource][6]
										local new_mesh = 1+math.floor((max_items*needed_level+2-obj:get_hp())*(textures-1)/(max_items*needed_level))
										obj:remove()
										local obj2 = minetest.env:add_entity(pos,"stella:resource_"..stella.resources[resource][1].."_"..new_mesh) -- ID > 10
										obj2:set_hp(hp-1)
										local count = math.floor(((max_items*needed_level)-obj2:get_hp()+1)/needed_level) - math.floor(((max_items*needed_level)-obj2:get_hp())/needed_level)
										local player_inv = player:get_inventory()
										player_inv:add_item("inv", "stella:resource_"..stella.resources[resource][1].." "..count)
										sort_inventory(player_inv, "inv")
										player:set_inventory_formspec(stella.invget_formspec(player))
									end
								end
							end
						end
					end
				end
			end
			player:set_attribute("LMB", tonumber(player:get_attribute("LMB"))+dtime)
        elseif keys["LMB"] == false and player:get_attribute("LMB") then
            player:set_attribute("LMB", tonumber(player:get_attribute("LMB"))+dtime)
		else
			player:set_attribute("LMB", 0)
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
				for tasksCount = 1, #stella.tasks do
					if stella.tasks[tasksCount][1] == activ[activCount][1] and distance(stella.tasks[tasksCount][3], player:get_pos()) < 1 then
						if activ[activCount][2] < stella.tasks[tasksCount][6][1] then
							if player_inv:contains_item("inv",stella.tasks[tasksCount][4][1]) then
								player_inv:remove_item("inv",stella.tasks[tasksCount][4][1])
								activ[activCount][2] = activ[activCount][2] + 1
							end
						end
						if activ[activCount][3] < stella.tasks[tasksCount][6][2] then
							if player_inv:contains_item("inv",stella.tasks[tasksCount][4][2]) then
								player_inv:remove_item("inv",stella.tasks[tasksCount][4][2])
								activ[activCount][3] = activ[activCount][3] + 1
							end
						end
						if activ[activCount][4] < stella.tasks[tasksCount][6][3] then
							if player_inv:contains_item("inv",stella.tasks[tasksCount][4][3]) then
								player_inv:remove_item("inv",stella.tasks[tasksCount][4][3])
								activ[activCount][4] = activ[activCount][4] + 1
							end
						end
						if activ[activCount][5] < stella.tasks[tasksCount][6][4] then
							if player_inv:contains_item("inv",stella.tasks[tasksCount][4][4]) then
								player_inv:remove_item("inv",stella.tasks[tasksCount][4][4])
								activ[activCount][5] = activ[activCount][5] + 1
							end
						end
						player:set_inventory_formspec(stella.invget_formspec(player))
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
				stella.stella_inv:remove_item("t1_from", "stella:resource_1 3")
				player_inv:remove_item("t1_from", "stella:resource_1 3")
				player_inv:add_item("inv", "stella:resource_3")
				stella.stella_inv:add_item("inv", "stella:resource_3")
				player:set_inventory_formspec(stella.invget_formspec(player))
				sort_inventory(player_inv, "inv")
				sort_inventory(stella.stella_inv, "inv")
			end
		end
	end
	if timer3 >= 3 then
		timer3 = 0
		for _,player in ipairs(players) do
			local player_inv = player:get_inventory()
			if player_inv:contains_item("s1_from", "stella:resource_2") then
				stella.stella_inv:remove_item("s1_from", "stella:resource_2 5")
				player_inv:remove_item("s1_from", "stella:resource_2 5")
				player_inv:add_item("inv", "stella:resource_4")
				stella.stella_inv:add_item("inv", "stella:resource_4")
				player:set_inventory_formspec(stella.invget_formspec(player))
				sort_inventory(player_inv, "inv")
				sort_inventory(stella.stella_inv, "inv")
			end
		end
	end
end)