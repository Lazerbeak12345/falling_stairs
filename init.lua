local fs="falling_stairs"
local register=function (origin,name)
	minetest.log("error","["..fs.." stair provider not found to make "..origin..":"..name.." stairs, slabs, etc")
end
if minetest.get_modpath("moreblocks") then
	function register(origin,name)
		local node = minetest.registered_nodes[origin..":"..name]
		stairsplus:register_all(
			fs,
			name,
			origin..":"..name,
			node
		)
		minetest.register_alias_force("mcl_stairs:stair_"..name,fs..":stair_"..name)
		minetest.register_alias_force("stairs:stair_"..name,fs..":stair_"..name)
		minetest.register_alias_force("mcl_stairs:stair_inner_"..name,fs..":stair_inner_"..name)
		minetest.register_alias_force("stairs:stair_inner_"..name,fs..":stair_inner_"..name)
		minetest.register_alias_force("mcl_stairs:stair_outer_"..name,fs..":stair_outer_"..name)
		minetest.register_alias_force("stairs:stair_outer_"..name,fs..":stair_outer_"..name)
		minetest.register_alias_force("mcl_stairs:slab_"..name,fs..":slab_"..name)
		minetest.register_alias_force("stairs:slab_"..name,fs..":slab_"..name)
		minetest.register_alias_force("mcl_stairs:slab_"..name.."_top",fs..":slab_"..name)
		minetest.register_alias_force("mcl_stairs:slab_"..name.."_double",origin..":"..name)
	end
elseif minetest.get_modpath("mcl_stairs") then
	function register(origin,name)
		local node = minetest.registered_nodes[origin..":"..name]
		mcl_stairs.register_stair_and_slab_simple(
			name,
			origin..":"..name,
			node.description.." Stair",
			node.description.." Slab")
		minetest.register_alias_force(fs..":stair_"..name,"mcl_stairs:stair_"..name)
		minetest.register_alias_force("stairs:stair_"..name,"mcl_stairs:stair_"..name)
		minetest.register_alias_force(fs..":stair_inner_"..name,"mcl_stairs:stair_inner_"..name)
		minetest.register_alias_force("stairs:stair_inner_"..name,"mcl_stairs:stair_inner_"..name)
		minetest.register_alias_force(fs..":stair_outer_"..name,"mcl_stairs:stair_outer_"..name)
		minetest.register_alias_force("stairs:stair_outer_"..name,"mcl_stairs:stair_outer_"..name)
		minetest.register_alias_force(fs..":slab_"..name,"mcl_stairs:slab_"..name)
		minetest.register_alias_force("stairs:slab_"..name,"mcl_stairs:slab_"..name)
	end
elseif minetest.get_modpath("stairs") then
	function register(origin,name)
		local node = minetest.registered_nodes[origin..":"..name]
		stairs.register_stair_and_slab(
			name,
			origin..":"..name,
			node.groups,
			node.tiles,
			node.description.." Stair",
			node.description.." Slab",
			node.sounds,
			false,
			"Inner "..node.description.." Stair",
			"Outer "..node.description.." Stair"
		)
		minetest.register_alias_force(fs..":stair_"..name,"stairs:stair_"..name)
		minetest.register_alias_force("mcl_stairs:stair_"..name,"stairs:stair_"..name)
		minetest.register_alias_force(fs..":stair_inner_"..name,"stairs:stair_inner_"..name)
		minetest.register_alias_force("mcl_stairs:stair_inner_"..name,"stairs:stair_inner_"..name)
		minetest.register_alias_force(fs..":stair_outer_"..name,"stairs:stair_outer_"..name)
		minetest.register_alias_force("mcl_stairs:stair_outer_"..name,"stairs:stair_outer_"..name)
		minetest.register_alias_force(fs..":slab_"..name,"stairs:slab_"..name)
		minetest.register_alias_force("mcl_stairs:slab_"..name,"stairs:slab_"..name)
		minetest.register_alias_force("mcl_stairs:slab_"..name.."_top","stairs:slab_"..name)
		minetest.register_alias_force("mcl_stairs:slab_"..name.."_double",origin..":"..name)
	end
end
if minetest.get_modpath("default") then
	register("default","gravel")
	register("default","sand")
	register("default","desert_sand")
	register("default","silver_sand")
end
if minetest.get_modpath("mcl_core") then
	register("mcl_core","gravel")
	register("mcl_core","sand")
	register("mcl_core","redsand")
end
