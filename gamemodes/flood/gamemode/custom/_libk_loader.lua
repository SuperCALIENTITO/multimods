local luaroot = GM_Path .. "pointshop2/libk"
local name = "LibK"

--Shared modules
local files = file.Find( luaroot .."/shared/*.lua", "LUA" )
table.sort( files )
if #files > 0 then
	for _, file in pairs( files ) do
		Msg( "[LibK] Loading SHARED file: " .. luaroot .."/shared/" .. file .. "\n" )
		include( luaroot .."/shared/" .. file )
		if SERVER then
			AddCSLuaFile( luaroot .."/shared/" .. file )
		end
	end
end

if SERVER then
	AddCSLuaFile( )
	local folder = luaroot .. "/shared"
	local files = file.Find( folder .. "/" .. "*.lua", "LUA" )
	for _, file in ipairs( files ) do
		AddCSLuaFile( folder .. "/" .. file )
	end

	folder = luaroot .."/client"
	files = file.Find( folder .. "/" .. "*.lua", "LUA" )
	for _, file in ipairs( files ) do
		AddCSLuaFile( folder .. "/" .. file )
	end

	--Server modules
	local files = file.Find( luaroot .."/server/*.lua", "LUA" )
	if #files > 0 then
		for _, file in ipairs( files ) do
			Msg( "[LibK] Loading SERVER file: " .. luaroot .."/server/" .. file .. "\n" )
			include( luaroot .."/server/" .. file )
		end
	end
	
	local path = luaroot .. "/shared/sh_KPlayer.lua"
	Msg( "[LibK] MANUAL: Loading file: " .. path .. "\n" )
	include( path ) --Need to include models last
	
	MsgN( "LibK by Kamshak loaded" )
end

if CLIENT then
	--Client modules
	local files = file.Find( luaroot .."/client/*.lua", "LUA" )
	if #files > 0 then
		for _, file in ipairs( files ) do
			Msg( "[LibK] Loading CLIENT file: " .. luaroot .."/client/" .. file .. "\n" )
			include( luaroot .."/client/" .. file )
		end
	end
	MsgN( "LibK by Kamshak loaded" )
end