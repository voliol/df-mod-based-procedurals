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
		log_2(depth, "...", #tbl)
		return end
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
		
		log("\n===Printing all NATURAL_ANIMAL creatures===")
		i = 1
		cr1 = world.creature.creature[i]
		while cr1 do
			if (cr1.tags.NATURAL_ANIMAL) do
				log("\t"..world.creature[i].token)
			end
			i = i + 1
			cr1 = world.creature.creature[i]
		end
		
		log("\n===Printing random MEGABEAST shallowly===")
		cr1 = world.creature.random_creature("MEGABEAST")
		print_table_2(cr1, 1)
		
		log("\n===Printing world shallowly===")
		print_table_2(world, 1)
		
		log("===END===")
		tests_done=true
	end
	
	
    return {creature=tbl,weight=1}
end

