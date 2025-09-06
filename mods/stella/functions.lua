function sort_inventory(inv,list) --from technic_chests mod
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

function distance(a, b)
	local x = a.x - b.x
	local y = a.y - b.y
	local z = a.z - b.z
	return math.hypot(x, math.hypot(y, z))
end

function file_check(file_name)
	local file_found=io.open(file_name, "r")
	if file_found==nil then
		file_found=false
	else
		file_found=true
	end
	return file_found
end

function tickRate(tick)
    local base = 1.5
    local rate = base^(tick - 1)
    return math.floor(rate)
end

function count_item(inv, item_name)
    local count = 0
    local list = inv:get_list("inv")  -- oder anderen Inventar-Slot
    if not list then return 0 end
    for _, stack in ipairs(list) do
        if stack:get_name() == item_name then
            count = count + stack:get_count()
        end
    end
    return count
end

function spawn_particle(player, target_pos, speed, itemname, size)
    local start_pos = player:get_pos()
	start_pos.y = start_pos.y + 0.5
    local dir = {
        x = target_pos.x - start_pos.x,
        y = target_pos.y - start_pos.y,
        z = target_pos.z - start_pos.z
    }
    local length = math.sqrt(dir.x^2 + dir.y^2 + dir.z^2)
    if length == 0 then length = 1 end
    dir.x = dir.x / length
    dir.y = dir.y / length
    dir.z = dir.z / length

	local texture = itemname:gsub(":", "_") .. ".png"

    minetest.add_particle({
        pos = start_pos,
        velocity = {x = dir.x * speed, y = dir.y * speed, z = dir.z * speed},
        expirationtime = length / speed,
        size = size or 4,
        texture = texture or "default_dirt.png",
    })
end

function load_tasks()
	local worldpath = minetest.get_worldpath()
	local filepath = worldpath .. "/tasks.txt"
    local f = io.open(filepath, "r")
    if not f then return {} end
    local data = f:read("*a")
    f:close()
    return minetest.deserialize(data) or {}
end

function save_tasks(tasks)
	local worldpath = minetest.get_worldpath()
	local filepath = worldpath .. "/tasks.txt"
    local f = io.open(filepath, "w")
    if not f then return false end
    f:write(minetest.serialize(tasks))
    f:close()
    return true
end

function get_task_by_name(task_name)
    for _, task in ipairs(stella.tasks) do
        if task[1] == task_name then
            return task
        end
    end
    return nil
end

function slice(tbl, start_i, end_i)
    local res = {}
    for i = start_i, end_i do
        table.insert(res, tbl[i])
    end
    return res
end

function get_hex_bounds()
    local min_x, max_x = math.huge, -math.huge
    local min_z, max_z = math.huge, -math.huge

    for _, entry in ipairs(stella.hexagons) do
        local pos = entry[3]
        if pos.x < min_x then min_x = pos.x end
        if pos.x > max_x then max_x = pos.x end
        if pos.z < min_z then min_z = pos.z end
        if pos.z > max_z then max_z = pos.z end
    end

    return {min_x = min_x, max_x = max_x, min_z = min_z, max_z = max_z}
end

function count_item_in_list(player, listname, itemname)
    local inv = player:get_inventory()
    local list = inv:get_list(listname)
    local count = 0

    for _, stack in ipairs(list) do
        if stack:get_name() == itemname then
            count = count + stack:get_count()
        end
    end

    return count
end

function add_task(player, taskname, pos, text)
    local name = player:get_player_name()
    stella.hud[name] = stella.hud[name] or {}
    if stella.hud[name][taskname] then
        return
    end
    local id = player:hud_add({
        hud_elem_type = "waypoint",
        number = 0xFFFFFF,
        world_pos = pos,
        precision = 0,
        name = text,
    })
    stella.hud[name][taskname] = id
end

function remove_task(player, taskname)
    local name = player:get_player_name()
    if stella.hud[name] and stella.hud[name][taskname] then
        player:hud_remove(stella.hud[name][taskname])
        stella.hud[name][taskname] = nil
    end
end