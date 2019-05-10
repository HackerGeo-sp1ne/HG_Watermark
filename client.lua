--[[
    FiveM Scripts
	The Official HackerGeo Script 
	Credits - HackerGeo
	Website - www.HackerGeo.com
	GitHub - GITHUB.com/HackerGeo-sp1ne
	Steam - SteamCommunity.com/id/HackerGeo1
	Copyright 2019 ©HackerGeo. All rights served
]]

------------------------------------------------------WARNING-----------------------------------------------------
---------------------Do not reupload/re release any part of this script without my permission---------------------
------------------------------------------------------------------------------------------------------------------



server_name = "STAYFROSTY COMMUNITY"
datetime = true

function CalculateDateToDisplay()
	if month == 1 then
		month = "Ianuarie"
	elseif month == 2 then
		month = "Februarie"
	elseif month == 3 then
		month = "Martie"
	elseif month == 4 then
		month = "Aprilie"
	elseif month == 5 then
		month = "Mai"
	elseif month == 6 then
		month = "Iunie"
	elseif month == 7 then
		month = "Iulie"
	elseif month == 8 then
		month = "August"
	elseif month == 9 then
		month = "Septembrie"
	elseif month == 10 then
		month = "Octombrie"
	elseif month == 11 then
		month = "Noiembrie"
	elseif month == 12 then
		month = "Decembrie"
	end
end

function CalculateTimeToDisplay()
	if hour <= 9 then
		hour = tonumber("0" .. hour)
	end
	if minute <= 9 then
		minute = tonumber("0" .. minute)
	end
end

local function RGBRainbow( frequency )
	local result = {}
	local curtime = GetGameTimer() / 3000

	result.r = math.floor( math.sin( curtime * frequency + 0 ) * 127 + 128 )
	result.g = math.floor( math.sin( curtime * frequency + 2 ) * 127 + 128 )
	result.b = math.floor( math.sin( curtime * frequency + 4 ) * 127 + 128 )
	
	return result
end

function drawtextt(x,y ,width,height,scale, text, r,g,b,a, outline)
    SetTextFont(7)
    SetTextProportional(0)
    SetTextScale(scale, scale)
    SetTextColour(r, g, b, a)
    SetTextDropShadow(0, 0, 0, 0,255)
    SetTextEdge(1, 0, 0, 0, 255)
	SetTextDropShadow()
    if(outline)then
	    SetTextOutline()
	end
    SetTextEntry("STRING")
    AddTextComponentString(text)
    DrawText(x - width/2, y - height/2 + 0.005)
end


Citizen.CreateThread(function()
	while true do
		local rainbow = RGBRainbow( 1 )
		Wait(1)
		year, month, dayOfWeek, hour, minute = GetLocalTime()
		CalculateTimeToDisplay()
		CalculateDateToDisplay()
		hour = hour + 3
		drawtextt(0.87,0.50,1.0,1.0,0.85, server_name, rainbow.r, rainbow.g, rainbow.b, 255)
		if (datetime == true) then
			drawtextt(0.92,0.55,1.0,1.0,0.45, "~b~ONLINE: ~o~"..GetNumberOfPlayers().." ~w~| ~y~" .. hour .. "~w~:~y~" .. minute .. " ~w~| ~r~" .. dayOfWeek .. " " .. month .. " " .. year .. "", 255, 255, 255, 255)
		end
	end
end)