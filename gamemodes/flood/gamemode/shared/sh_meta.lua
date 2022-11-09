local MetaPlayer = FindMetaTable("Player")
local EntityMeta = FindMetaTable("Entity")
local Donators = { 
	["vip"] = true
}

function MetaPlayer:IsDonator()
	return Donators[self:GetUserGroup()] or false
end

-- Player Scores
function MetaPlayer:GetScore()
	return self:GetNWInt("flood_score") or 0
end

function MetaPlayer:SetScore(score)
	self:SetNWInt("flood_score", score)
end

-- Player Color
function EntityMeta:GetPlayerColor()
	return self:GetNWVector("playerColor") or Vector()
end

function EntityMeta:SetPlayerColor(vec)
	self:SetNWVector("playerColor", vec)
end

-- Can Respawn
function MetaPlayer:CanRespawn()
	return self:GetNWBool("flood_canrespawn")
end

function MetaPlayer:SetCanRespawn(bool)
	self:SetNWBool("flood_canrespawn", bool)
end

-- Currency 
function MetaPlayer:AddCash(amount)
	if amount then
		self:SetNetworkedInt("flood_cash", self:GetNetworkedInt("flood_cash") + tonumber(amount))
		self:Save()
	else
		print("Flood: Error occured in AddCash function - No amount was passed.")
		return
	end
end

function MetaPlayer:SubCash(amount)
	if amount then 
		self:SetNetworkedInt("flood_cash", self:GetNetworkedInt("flood_cash") - tonumber(amount))
		self:Save()
	else
		print("Flood: Error occured in SubCash function - No amount was passed.")
		return
	end
end

function MetaPlayer:SetCash(amount)
	self:SetNetworkedInt("flood_cash", tonumber(amount))
end

function MetaPlayer:GetCash()
	return tonumber(self:GetNetworkedInt("flood_cash"))
end

function MetaPlayer:CanAfford(price)
	return tonumber(self:GetNetworkedInt("flood_cash")) >= tonumber(price)
end

function MetaPlayer:Save()
	
	if not self.Weapons then
		self.Weapons = {}
		table.insert(self.Weapons, "weapon_pistol")
	end

	local q = sql.Query

	q("UPDATE flood SET name = " .. self:Nick()					.. " WHERE steamid = " .. ply:SteamID64() .. ";")
	q("UPDATE flood SET cash = " .. self:GetNWInt("flood_cash") .. " WHERE steamid = " .. ply:SteamID64() .. ";")
	q("UPDATE flood SET weapons = " .. util.TableToJSON(self.Weapons) .. " WHERE steamid = " ply:SteamID64() .. ";")
end