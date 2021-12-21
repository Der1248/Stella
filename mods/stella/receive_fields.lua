minetest.register_on_player_receive_fields(function(player, formname, fields)
    local player_inv = player:get_inventory()
	local meta = player:get_meta()
    if fields.timber1_1 then
        local purple = player_inv:get_stack("inv", 1):get_count()
		if purple > 2 and player_inv:get_stack("inv", 1):get_name() == "stella:resource_1" then
			player_inv:remove_item("inv", "stella:resource_1 3")
			stella.stella_inv:remove_item("inv", "stella:resource_1 3")
			stella.stella_inv:add_item("t1_from", "stella:resource_1 3")
			player_inv:add_item("t1_from", "stella:resource_1 3")
			minetest.show_formspec(player:get_player_name(), "timber1" , stella.timber1get_formspec(player))
		end
	end	
	if fields.timber1_2 then
        local purple = player_inv:get_stack("inv", 1):get_count()
		if purple > 2 and player_inv:get_stack("inv", 1):get_name() == "stella:resource_1" then
			player_inv:remove_item("inv", "stella:resource_1 "..math.floor(purple/3)*3)
			stella.stella_inv:remove_item("inv", "stella:resource_1 "..math.floor(purple/3)*3)
			stella.stella_inv:add_item("t1_from", "stella:resource_1 "..math.floor(purple/3)*3)
			player_inv:add_item("t1_from", "stella:resource_1 "..math.floor(purple/3)*3)
			minetest.show_formspec(player:get_player_name(), "timber1" , stella.timber1get_formspec(player))
		end
	end	
	if fields.smith1_1 then
        local gray = player_inv:get_stack("inv", 1):get_count()
		local gray2 = player_inv:get_stack("inv", 2):get_count()
		if (gray > 4 and player_inv:get_stack("inv", 1):get_name() == "stella:resource_2") or (gray2 > 4 and player_inv:get_stack("inv", 2):get_name() == "stella:resource_2") then
			player_inv:remove_item("inv", "stella:resource_2 5")
			stella.stella_inv:remove_item("inv", "stella:resource_2 5")
			stella.stella_inv:add_item("s1_from", "stella:resource_2 5")
			player_inv:add_item("s1_from", "stella:resource_2 5")
			minetest.show_formspec(player:get_player_name(), "smith1" , stella.smith1get_formspec(player))
		end
	end	
	if fields.smith1_2 then
        local gray = player_inv:get_stack("inv", 1):get_count()
		local gray2 = player_inv:get_stack("inv", 2):get_count()
		if gray > 4 and player_inv:get_stack("inv", 1):get_name() == "stella:resource_2" then
			player_inv:remove_item("inv", "stella:resource_2 "..math.floor(gray/5)*35)
			stella.stella_inv:remove_item("inv", "stella:resource_2 "..math.floor(gray/5)*5)
			stella.stella_inv:add_item("s1_from", "stella:resource_2 "..math.floor(gray/5)*5)
			player_inv:add_item("s1_from", "stella:resource_2 "..math.floor(gray/5)*5)
			minetest.show_formspec(player:get_player_name(), "smith1" , stella.smith1get_formspec(player))
		end
		if gray2 > 4 and player_inv:get_stack("inv", 2):get_name() == "stella:resource_2" then
			player_inv:remove_item("inv", "stella:resource_2 "..math.floor(gray2/5)*5)
			stella.stella_inv:remove_item("inv", "stella:resource_2 "..math.floor(gray2/5)*5)
			stella.stella_inv:add_item("s1_from", "stella:resource_2 "..math.floor(gray2/5)*5)
			player_inv:add_item("s1_from", "stella:resource_2 "..math.floor(gray2/5)*5)
			minetest.show_formspec(player:get_player_name(), "smith1" , stella.smith1get_formspec(player))
		end
	end	
end)