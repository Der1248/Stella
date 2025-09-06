function update_tasks(player)
	local activ = minetest.deserialize(player:get_attribute("activ_task"))
	for activCount = 1, #activ do
		for tasksCount = 1, #stella.tasks do
			if stella.tasks[tasksCount][1] == activ[activCount][1] then
				local name = ""
				if stella.tasks[tasksCount][6][3] ~= 0 then
					name = activ[activCount][2].."/"..stella.tasks[tasksCount][6][1].." "..stella.tasks[tasksCount][5][1].."\n"..activ[activCount][3].."/"..stella.tasks[tasksCount][6][2].." "..stella.tasks[tasksCount][5][2].."\n"..activ[activCount][4].."/"..stella.tasks[tasksCount][6][3].." "..stella.tasks[tasksCount][5][3]
				elseif stella.tasks[tasksCount][6][2] ~= 0 then
					name = activ[activCount][2].."/"..stella.tasks[tasksCount][6][1].." "..stella.tasks[tasksCount][5][1].."\n"..activ[activCount][3].."/"..stella.tasks[tasksCount][6][2].." "..stella.tasks[tasksCount][5][2]
				elseif stella.tasks[tasksCount][6][1] ~= 0 then
					name = activ[activCount][2].."/"..stella.tasks[tasksCount][6][1].." "..stella.tasks[tasksCount][5][1]
				else
					name = "comming soon"
				end
				remove_task(player, stella.tasks[tasksCount][1])
				add_task(player, stella.tasks[tasksCount][1], stella.tasks[tasksCount][3], name)
				if stella.tasks[tasksCount][6][1] ~= 0 and activ[activCount][2] == stella.tasks[tasksCount][6][1] and activ[activCount][3] == stella.tasks[tasksCount][6][2] and activ[activCount][4] == stella.tasks[tasksCount][6][3] and activ[activCount][5] == stella.tasks[tasksCount][6][4] then
					remove_task(player, stella.tasks[tasksCount][1])
					player:set_attribute(""..activ[activCount][1], "y")
					table.remove(activ, activCount)
					set_hexagon(stella.tasks[tasksCount][1],player, true)
					for tasksCount2 = 1, #stella.tasks do
						if stella.tasks[tasksCount2][2] == stella.tasks[tasksCount][1] then
							table.insert(activ,{stella.tasks[tasksCount2][1],0,0,0,0})
						end
					end
					player:set_attribute("activ_task", minetest.serialize(activ))
					if stella.tasks[tasksCount][1] == "1.1.1.1" then
						minetest.show_formspec(player:get_player_name(), "info2" , stella.info2(player))
					elseif stella.tasks[tasksCount][1] == "1.1.1.3" then
						minetest.show_formspec(player:get_player_name(), "info3" , stella.info3(player))
					elseif stella.tasks[tasksCount][1] == "1.1.1.5" then
						minetest.show_formspec(player:get_player_name(), "info4" , stella.info4(player))
					end
					update_tasks(player)
					return
				end
			end
		end
	end
end

function get_active_tasks(player)
    local active = {}
    for _, task in ipairs(stella.tasks) do
        local name = task[1]
        local required = task[2]
        if player:get_attribute(required) == "y" then
			if player:get_attribute(name) ~= "y" then
            	table.insert(active, name)
			end
        end
    end
    return active
end