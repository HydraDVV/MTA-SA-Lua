local heli = {}
local playerId = {}

local vehicle = createVehicle(459, spawnCar[1], spawnCar[2], spawnCar[3], 0, 0, spawnCar[4])
setElementFrozen(vehicle, true)
setVehicleDamageProof(vehicle, true)
setVehicleColor(vehicle, 100, 0, 0)

addEventHandler("onVehicleEnter", vehicle,
	function(player)
		triggerClientEvent(player, "vcheli:gui", player, getElementData(player, "vcheli:id"))
	end
)

addEvent("vcheli:start", true)
addEventHandler("vcheli:start", getRootElement(),
	function(id)
		removePedFromVehicle(source)
		heli[source] = createVehicle(501, spawnHeli[1], spawnHeli[2], spawnHeli[3], 0, 0, spawnHeli[4])
		setElementData(heli[source], "vcheli:owner", source)
		setElementDimension(heli[source], id)
		setElementDimension(source, id)
		setElementAlpha(source, 0)
		warpPedIntoVehicle(source, heli[source])
		triggerClientEvent(source, "vcheli:start", source, heli[source])
		addEventHandler("onVehicleStartExit", heli[source],
			function(player)
				triggerClientEvent(player, "vcheli:stop", player)
				local x, y, z = getPointFrontOfElement()
				removePedFromVehicle(player)
				setElementDimension(player, 0)
				setElementPosition(player, x, y, z)
				setElementAlpha(player, 255)
				destroyElement(source)
				heli[player] = nil
			end
		)
		addEventHandler("onVehicleExplode", heli[source],
			function()
				local player = getElementData(source, "vcheli:owner")
				triggerClientEvent(player, "vcheli:stop", player)
				local x, y, z = getPointFrontOfElement()
				removePedFromVehicle(player)
				setElementDimension(player, 0)
				setElementPosition(player, x, y, z)
				setElementAlpha(player, 255)
				destroyElement(source)
				heli[player] = nil
			end
		)
	end
)

addEvent("vcheli:stop", true)
addEventHandler("vcheli:stop", getRootElement(),
	function(give)
		local x, y, z = getPointFrontOfElement()
		removePedFromVehicle(source)
		setElementDimension(source, 0)
		setElementPosition(source, x, y, z)
		setElementAlpha(source, 255)
		if heli[source] then
			destroyElement(heli[source])
			heli[source] = nil
		end
		if give then
			givePlayerMoney(source, give)
		end
	end
)

addEventHandler("onPlayerQuit", getRootElement(),
	function()
		if heli[source] then
			destroyElement(heli[source])
			heli[source] = nil
		end
		for i = 1, getMaxPlayers() do
			if (playerId[i] == source) then
				playerId[i] = nil
				break
			end
		end
	end
)

addEventHandler("onPlayerJoin", getRootElement(),
	function()
		newPlayerID(source)
	end
)

function newPlayerID(player)
	for i = 1, getMaxPlayers() do
		if not (playerId[i]) then
			if isElement(player) then
				playerId[i] = player
				setElementData(player, "vcheli:id", i)
				break
			end
		end
	end
end

function getPointFrontOfElement()
    local x, y, z = getElementPosition(vehicle)
    local rx, ry, rz = getElementRotation(vehicle)
    local x = x + (-4 * (math.sin(math.rad(-rz))))
    local y = y + (-4 * (math.cos(math.rad(-rz))))
	return x, y, z
end