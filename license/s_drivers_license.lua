mysql = exports.mysql

function giveCarLicense(usingGC)
	
	local theVehicle = getPedOccupiedVehicle(source)
	setElementData(source, "realinvehicle", 0, false)
	removePedFromVehicle(source)
	if theVehicle then 
		respawnVehicle(theVehicle)
		setElementData(theVehicle, "handbrake", 1, false)
		setElementFrozen(theVehicle, true)
	end
	setElementData(source, "license.car", 1)
	dbExec(mysql:getConnection(), "UPDATE characters SET car_license='1' WHERE charactername='" .. (getPlayerName(source)) .. "' LIMIT 1")
	exports.hud:sendBottomNotification(source, "Department of Motor Vehicles", "Congratulations! You've passed your driving examination!" )
	exports.global:giveItem(source, 133, getPlayerName(source):gsub("_"," "))
	executeCommandHandler("stats", source, getPlayerName(source))
end
addEvent("acceptCarLicense", true)
addEventHandler("acceptCarLicense", getRootElement(), giveCarLicense)

function passTheory()
	setElementData(source,"license.car.cangetin",true, false)
	setElementData(source,"license.car",3) -- Set data to "theory passed"
	dbExec(mysql:getConnection(), "UPDATE characters SET car_license='3' WHERE charactername='" .. (getPlayerName(source)) .. "' LIMIT 1")
end
addEvent("theoryComplete", true)
addEventHandler("theoryComplete", getRootElement(), passTheory)

function checkDoLCars(player, seat)
	-- aka civilian previons
	if getElementData(source, "owner") == -2 and getElementData(source, "faction") == -1 and getElementModel(source) == 410 then
		if getElementData(player,"license.car") == 3 then
			if getElementData(player, "license.car.cangetin") then
				exports.hud:sendBottomNotification(player, "Department of Motor Vehicles", "You can use 'J' to start the engine and /handbrake to release the handbrake." )
			else
				exports.hud:sendBottomNotification(player, "Department of Motor Vehicles", "This vehicle is for the Driving Test only, please see the NPC inside first." )
				if not exports["integration"]:isPlayerHeadAdmin(player) then
					cancelEvent()
				end
			end
		elseif seat > 0 then
			exports.hud:sendBottomNotification(player, "Department of Motor Vehicles", "This vehicle is for the Driving Test only." )
		else
			exports.hud:sendBottomNotification(player, "Department of Motor Vehicles", "This vehicle is for the Driving Test only." )
			cancelEvent()
		end
	end
end
addEventHandler( "onVehicleStartEnter", getRootElement(), checkDoLCars)