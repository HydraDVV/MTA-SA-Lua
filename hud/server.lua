function deneme(p)
local agirlik =  " Taşınan Ağırlık: "..("%.2f/%.2f" ):format( exports["items"]:getCarriedWeight( p), exports["items"]:getMaxWeight( p) ).." kg(s)"
setElementData(p, "agirlik", agirlik)
end
addCommandHandler("stats", deneme)



function deneme2 (thePlayer)
local dbid = tonumber(getElementData(thePlayer, "dbid"))
	local carids = ""
	local numcars = 0
	local printCar = ""
	for key, value in ipairs(exports.pool:getPoolElementsByType("vehicle")) do
		local owner = tonumber(getElementData(value, "owner"))

		if (owner) and (owner==dbid) then
			local id = getElementData(value, "dbid")
			carids = carids.. "\n vin: ".. id .. " "
			numcars = numcars + 1
			exports.anticheat:changeProtectedElementDataEx(value, "owner_last_login", exports.datetime:now(), true)
		end
	end
	printCar = numcars .. "/" .. getElementData(thePlayer, "maxvehicles")
	local alke = (" Araçlar(" .. printCar .. "):" .. string.sub(carids, 1, string.len(carids)-2))
    setElementData(thePlayer, "alke", alke)
end
 addCommandHandler("stats",deneme2)




function deneme3 (thePlayer)
	local properties = ""
	local numproperties = 0
	dbid = getElementData(thePlayer, "dbid")
	for key, value in ipairs(getElementsByType("interior")) do
		local interiorStatus = getElementData(value, "status")
		
		if interiorStatus[4] and interiorStatus[4] == dbid and getElementData(value, "name") then
			local id = getElementData(value, "dbid")
			properties = properties.."\n interior vin: " .. id .. " "
			numproperties = numproperties + 1
			exports.anticheat:changeProtectedElementDataEx(value, "owner_last_login", exports.datetime:now(), true)
		end
	end
		local evler= (" Mülkler (" .. numproperties .. "/"..(getElementData(thePlayer, "maxinteriors") or 10).."):" .. string.sub(properties, 1, string.len(properties)-2))
		setElementData(thePlayer,"evler",evler)


end 
addCommandHandler("stats",deneme3)



