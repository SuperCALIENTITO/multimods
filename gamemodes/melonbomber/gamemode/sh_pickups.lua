

GM.Pickups = {}
if GAMEMODE then GAMEMODE.Pickups = GM.Pickups end

local function addPickup(id, name, color, model)
	local tab = {}
	tab.id = id
	tab.name = name
	tab.color = color
	tab.model = model;
	(GM or GAMEMODE).Pickups[id] = tab
	return tab
end

local pick = addPickup(1, "Velocidad", Color(0, 150, 255), "models/props_junk/Shoe001a.mdl")
pick.AddScale = 1.3
pick.NoList = true
pick.Chance = 10
pick.Description = "Aumenta tu velocidad"
function pick:OnPickup(ply)
	ply:SetRunningBoots(ply:GetRunningBoots() + 1)
end

local pick = addPickup(2, "Explosion", Color(220,50,50), "models/props_junk/gascan001a.mdl")
pick.NoList = true
pick.Chance = 10
pick.Description = "Aumenta el poder de tu explosion"
function pick:OnPickup(ply)
	ply:SetBombPower(ply:GetBombPower() + 1)
end


local pick = addPickup(3, "Sandias", Color(50,255,50), "models/props_junk/watermelon01.mdl")
pick.NoList = true
pick.Chance = 10
pick.Description = "Aumenta la cantidad de Sandias"
function pick:OnPickup(ply)
	ply:SetMaxBombs(ply:GetMaxBombs() + 1)
end

local pick = addPickup(4, "Perforador", Color(0, 70, 220), "models/props_junk/sawblade001a.mdl")
pick.AddScale = 0.6
pick.Chance = 1
pick.Description = "Las explosiones atraviesan las cajas"
function pick:OnPickup(ply)
end

local pick = addPickup(5, "Super Sandia", Color(155, 20, 80), "models/props_junk/watermelon01.mdl")
pick.ModelMaterial = "models/weapons/v_crowbar/crowbar_cyl"
pick.Chance = 1
pick.Description = "Una Super Sandia especial con poder maximo"
function pick:OnPickup(ply)
end


local pick = addPickup(6, "Sandia Linea", Color(150, 0, 180), "models/props_junk/watermelon01.mdl")
pick.Chance = 1
pick.Description = "Coloca una linea de Sandias"
function pick:OnPickup(ply)
end
function pick:DrawDecor(ent)
	local ang = Angle(0, CurTime() * 13, 0)
	local part = ent:MakeDecorPart("melon1", "models/props_junk/watermelon01.mdl")
	if IsValid(part) then
		part:SetAngles(ang)
		part:SetPos(ent:GetPos() + Vector(0, 0, 4))
		part:SetModelScale(0.5, 0)
		part:DrawModel()
	end
	local part = ent:MakeDecorPart("melon2", "models/props_junk/watermelon01.mdl")
	if IsValid(part) then
		part:SetAngles(ang)
		part:SetPos(ent:GetPos() + Vector(0, 0, 4) + ang:Forward() * 8)
		part:SetModelScale(0.5, 0)
		part:DrawModel()
	end
	local part = ent:MakeDecorPart("melon3", "models/props_junk/watermelon01.mdl")
	if IsValid(part) then
		part:SetAngles(ang)
		part:SetPos(ent:GetPos() + Vector(0, 0, 4) + ang:Forward() * -8)
		part:SetModelScale(0.5, 0)
		part:DrawModel()
	end
end

local pick = addPickup(7, "Control Remoto", Color(220, 190, 0), "models/props_rooftop/roof_dish001.mdl")
pick.AddScale = 0.4
pick.Chance = 1
pick.Description = "Controla cuando quieres explotarlas"
function pick:OnPickup(ply)
end


local pick = addPickup(8, "Zapatos Duros", Color(250, 100, 0), "models/props_junk/Shoe001a.mdl")
pick.AddScale = 1.3
pick.Chance = 3
pick.Description = "Empuja las sandias con tus zapatos"
function pick:OnPickup(ply)
end

function pick:DrawDecor(ent)
	local ang = Angle(0, CurTime() * 13, 0)
	local part = ent:MakeDecorPart("boot", "models/props_junk/Shoe001a.mdl")
	if IsValid(part) then
		part:SetAngles(ang)
		part:SetPos(ent:GetPos() + Vector(0, 0, 8) + ang:Forward() * -6)
		part:SetModelScale(1.2, 0)
		part:DrawModel()
	end
	local part = ent:MakeDecorPart("melon", "models/props_junk/watermelon01.mdl")
	if IsValid(part) then
		part:SetAngles(ang)
		part:SetPos(ent:GetPos() + Vector(0, 0, 6) + ang:Forward() * 4)
		part:SetModelScale(0.6, 0)
		part:SetColor(Color(255, 150, 0))
		part:DrawModel()
	end
end

// remote detonation
// models/props_rooftop/roof_dish001.mdl