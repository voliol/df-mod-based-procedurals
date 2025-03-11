function log_2(depth, ...)
    local s=""
	for i=0,depth do
		s=s.."\t"
	end
    local args=table.pack(...)
    for i=1,args.n do
        s=s..tostring(args[i]).." "
    end
    lua_log(s)
end

function print_table_2_inner(tbl, depth, max_depth)
    if type(tbl) ~= "table" then return end
	if depth == max_depth then
		log_2(depth, "...", #tbl + 1)
		return
	end
    for k,v in pairs(tbl) do
        log_2(depth, k,v)
        print_table_2_inner(v, depth + 1, max_depth)
    end
end

function print_table_2(tbl, max_depth)
    print_table_2_inner(tbl, 0, max_depth)
end

tests_done=false

creatures.fb.default=nil
creatures.fb.default=function(layer_type,tok)
    local tbl={}
    tbl=split_to_lines(tbl,[[[BODY:RCP_SIMPLE_BODY]])

	if not tests_done then
		log("===START===")

		log("\n===Printing all HAS_ANY_INTELLIGENT_LEARNS creature IDs===")
		i = 1
		c = world.creature.creature[i]
		while c do
			if c.flags.HAS_ANY_INTELLIGENT_LEARNS then
				log("\t"..c.token)
			end
			i = i + 1
			c = world.creature.creature[i]
		end
		
		log("\n===Printing random MEGABEAST shallowly===")
		c = world.creature.get_random_creature("MEGABEAST")
		print_table_2(c, 1)
		
		log("\n===Printing world shallowly===")
		print_table_2(world, 1)
		
		log("\n===Printing world less shallowly===")
		print_table_2(world, 2)
		
		log("\n===Printing world.creature shallowly===")
		print_table_2(world.creature, 1)
		
		log("\n===Printing world.creature less shallowly===")
		print_table_2(world.creature, 2)
		
		log("\n===Printing world.creature.creature[1] less shallowly===")
		log(world.creature.creature[1])
		log(#world.creature.creature[1] + 1)
		print_table_2(world.creature.creature[1], 2)
		
		log("\n===Printing current_definition shallowly===")
		log(world.creature.creature.TOAD.current_definition)
		log(world.creature.creature[1].current_definition)
		print_table_2(world.creature.creature.TOAD.current_definition, 1)
		
		
		log("===END===")
		tests_done=true
	end
	
	
    return {creature=tbl,weight=1}
end

