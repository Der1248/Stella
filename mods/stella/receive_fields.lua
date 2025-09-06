function on_traider_button(player, field, trader, input, input_count, output, duration, single)
	if field then
		local items = count_item_in_list(player, "inv", input)
		local player_inv = player:get_inventory()
		if items >= input_count then
			if single then
				player_inv:remove_item("inv", input.. " "..input_count)
				stella.stella_inv:remove_item("inv", input.. " "..input_count)
				if duration == 0 then
					player_inv:add_item("inv", output)
					stella.stella_inv:add_item("inv", output)
					player:set_inventory_formspec(stella.invget_formspec(player))
					sort_inventory(player_inv, "inv")
					sort_inventory(stella.stella_inv, "inv")
				else
					stella.stella_inv:add_item(trader.."_from", output)
					player_inv:add_item(trader.."_from", output)
				end

			else
				player_inv:remove_item("inv", input.. " "..math.floor(items/input_count)*input_count)
				stella.stella_inv:remove_item("inv", input.. " "..math.floor(items/input_count)*input_count)
				if duration == 0 then
					player_inv:add_item("inv", output.." "..math.floor(items/input_count))
					stella.stella_inv:add_item("inv", output.." "..math.floor(items/input_count))
					player:set_inventory_formspec(stella.invget_formspec(player))
					sort_inventory(player_inv, "inv")
					sort_inventory(stella.stella_inv, "inv")
				else
					stella.stella_inv:add_item(trader.."_from", output.." "..math.floor(items/input_count))
					player_inv:add_item(trader.."_from", output.." "..math.floor(items/input_count))
				end
			end
			minetest.show_formspec(player:get_player_name(), trader, 
				make_formspec(player, trader, input, input_count, output, duration)
			)
		end
	end
end	

minetest.register_on_player_receive_fields(function(player, formname, fields)
    local player_inv = player:get_inventory()
	local meta = player:get_meta()

	on_traider_button(player, fields.timber1_1, "timber1", "stella:resource_1", 3, "stella:resource_3", 3, true)
	on_traider_button(player, fields.timber1_2, "timber1", "stella:resource_1", 3, "stella:resource_3", 3, false)
	on_traider_button(player, fields.smith1_1, "smith1", "stella:resource_2", 5, "stella:resource_4", 3, true)
	on_traider_button(player, fields.smith1_2, "smith1", "stella:resource_2", 5, "stella:resource_4", 3, false)

	on_traider_button(player, fields.shop1_1, "shop1", "stella:resource_1", 10, "stella:resource_5", 0, true)
	on_traider_button(player, fields.shop1_2, "shop1", "stella:resource_1", 10, "stella:resource_5", 0, false)

	on_traider_button(player, fields.shop2_1, "shop2", "stella:resource_2", 8, "stella:resource_5", 0, true)
	on_traider_button(player, fields.shop2_2, "shop2", "stella:resource_2", 8, "stella:resource_5", 0, false)
end)