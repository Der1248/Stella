local timer = 0
local timer2 = 0
local timer3 = 0
local tick = 1

local trader_timer = {
	smith1 = 0,
	timber1 = 0,
}

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
										local luaent = obj:get_luaentity()
										obj:remove()
										local obj_hexagon = luaent.hexagon
										local obj_res_place = luaent.res_place
										local obj_res_id = luaent.res_id
										local obj2 = minetest.env:add_entity(pos,"stella:resource_"..stella.resources[resource][1].."_"..new_mesh) -- ID > 10
										obj2:set_hp(hp-1)
										local luaent2 = obj2:get_luaentity()
										luaent2.hexagon = obj_hexagon
										luaent2.res_place = obj_res_place
										luaent2.res_id = obj_res_id
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
		minetest.set_timeofday(0.5)
		set_hexagon("1.1.1.0", player,false)
		for _,player in ipairs(players) do

			local all_objects = minetest.get_objects_inside_radius(player:get_pos(), 16)
			for resource = 1, #stella.resources do
				for k, obj in pairs(all_objects) do
					if obj:get_luaentity() ~= nil then
						local luaent = obj:get_luaentity()
						local obj_hexagon = luaent.hexagon
						local obj_res_place = luaent.res_place
						local obj_res_id = luaent.res_id
						if obj_hexagon == nil then
							obj:remove()
						else
							for hexagonsCount = 1, #stella.hexagons do
								if stella.hexagons[hexagonsCount][1] == obj_hexagon then
									if stella.hexagons[hexagonsCount][8][obj_res_place] ~= obj_res_id then
										obj:remove()
									end
								end
							end
						end
					end
				end
			end

			local do_tick = false
			local player_inv = player:get_inventory()
			local pos = player:get_pos()
			player:hud_set_hotbar_image("stella_gui_hotbar.png")
			local activ = minetest.deserialize(player:get_attribute("activ_task"))
			for activCount = 1, #activ do
				for tasksCount = 1, #stella.tasks do
					if stella.tasks[tasksCount][1] == activ[activCount][1] and distance(stella.tasks[tasksCount][3], pos) < 1 then
						ticknum = tickRate(tick)
						if activ[activCount][2] < stella.tasks[tasksCount][6][1] then
							if count_item(player_inv, stella.tasks[tasksCount][4][1]) > 0 then
								do_tick = true
								available = count_item(player_inv, stella.tasks[tasksCount][4][1])
								remain = stella.tasks[tasksCount][6][1] - activ[activCount][2]
								add = math.min(available, remain, ticknum)
								player_inv:remove_item("inv",stella.tasks[tasksCount][4][1].." "..add)
								activ[activCount][2] = activ[activCount][2] + add
								spawn_particle(player, stella.tasks[tasksCount][3], 4, stella.tasks[tasksCount][4][1], 4)
							end
						end
						if activ[activCount][3] < stella.tasks[tasksCount][6][2] then
							if count_item(player_inv, stella.tasks[tasksCount][4][2]) > 0 then
								do_tick = true
								available = count_item(player_inv, stella.tasks[tasksCount][4][2])
								remain = stella.tasks[tasksCount][6][2] - activ[activCount][3]
								add = math.min(available, remain, ticknum)
								player_inv:remove_item("inv",stella.tasks[tasksCount][4][2].." "..add)
								activ[activCount][3] = activ[activCount][3] + add
							end
						end
						if activ[activCount][4] < stella.tasks[tasksCount][6][3] then
							if count_item(player_inv, stella.tasks[tasksCount][4][3]) > 0 then
								do_tick = true
								available = count_item(player_inv, stella.tasks[tasksCount][4][3])
								remain = stella.tasks[tasksCount][6][3] - activ[activCount][4]
								add = math.min(available, remain, ticknum)
								player_inv:remove_item("inv",stella.tasks[tasksCount][4][3].." "..add)
								activ[activCount][4] = activ[activCount][4] + add
							end
						end
						if activ[activCount][5] < stella.tasks[tasksCount][6][4] then
							if count_item(player_inv, stella.tasks[tasksCount][4][4]) > 0 then
								do_tick = true
								available = count_item(player_inv, stella.tasks[tasksCount][4][4])
								remain = stella.tasks[tasksCount][6][4] - activ[activCount][5]
								add = math.min(available, remain, ticknum)
								player_inv:remove_item("inv",stella.tasks[tasksCount][4][4].." "..add)
								activ[activCount][5] = activ[activCount][5] + add
							end
						end
						tick = tick + 1
						sort_inventory(player_inv, "inv")
						player:set_inventory_formspec(stella.invget_formspec(player))
					end
				end
				player:set_attribute(activ[activCount][1], minetest.serialize(slice(activ[activCount], 2, 5)))
			end
			player:set_attribute("activ_task", minetest.serialize(activ))
			update_tasks(player)
			if not do_tick then
				tick = 1
			end
		end
	end
	on_trader_timer(trader_timer, "timber1", "stella:resource_3", 3)
	on_trader_timer(trader_timer, "smith1", "stella:resource_4", 3)
	trader_timer["timber1"] = trader_timer["timber1"] + dtime
	trader_timer["smith1"] = trader_timer["smith1"] + dtime
end)


function on_trader_timer(trader_timer, trader, output, duration)
	local players = minetest.get_connected_players()
	if trader_timer[trader] >= duration then
		trader_timer[trader] = 0
		for _,player in ipairs(players) do
			local player_inv = player:get_inventory()
			if player_inv:contains_item(trader.."_from", output) then
				stella.stella_inv:remove_item(trader.."_from", output)
				player_inv:remove_item(trader.."_from", output)
				player_inv:add_item("inv", output)
				stella.stella_inv:add_item("inv", output)
				player:set_inventory_formspec(stella.invget_formspec(player))
				sort_inventory(player_inv, "inv")
				sort_inventory(stella.stella_inv, "inv")
			end
		end
	end
end