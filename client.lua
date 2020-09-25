local function RGBRainbow( frequency )
	local result = {}
	local curtime = GetGameTimer() / 1000

	result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
	result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
	result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
	
	return result
end

Citizen.CreateThread( function()
	while true do
		Wait( 0 )
		
		SetTextFont( 1 )
		SetTextScale( 0.37, 0.37 )
		local rainbow = RGBRainbow( 1 )
		SetTextColour( rainbow.r, rainbow.g, rainbow.b, 255 )
		SetTextOutline()
		SetTextEntry( "STRING" )
		AddTextComponentString( "ID: ~w~" .. tostring(GetPlayerServerId(PlayerId())))
		DrawText( 0.023, 0.81 )
	end
end )