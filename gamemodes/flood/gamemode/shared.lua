DeriveGamemode("sandbox")

GM.Name 	= "Flood"
GM.Author 	= "Mythikos & Freezebug"
GM.Version  = "2.0.1"
GM.Website 	= "www.mapping-latam.cl"

TEAM_PLAYER = 2

team.SetUp(TEAM_PLAYER, "Player", Color(16, 153, 156))

-- Format coloring because garry likes vectors for playermodels
function GM:FormatColor(col)
	col = Color(col.r * 255, col.g * 255, col.b * 255)
	return col
end