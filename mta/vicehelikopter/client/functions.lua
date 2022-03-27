local tnt1 = {}
local tnt2 = {}
local botTimerSprint = {}
local oldPosition = {}

local getVehicle = false
local getAttach = false
local getId = 0
local markerPos = 1

addEventHandler("onClientGUIClick", getRootElement(),
	function()
		if source == gui[3] then
			showCursor(false)
			guiSetVisible(gui[1], false)
			triggerServerEvent("vcheli:start", localPlayer, getId)
		elseif source == gui[4] then
			showCursor(false)
			guiSetVisible(gui[1], false)
			triggerServerEvent("vcheli:stop", localPlayer)
		end
	end
)

addEventHandler("onClientPlayerDamage", getLocalPlayer(),
	function()
		if getElementData(localPlayer, "vcheli:damage") then
			cancelEvent()
		end
	end
)

addEventHandler("onClientPedDamage", getRootElement(),
	function(attacker)
		if getElementData(attacker, "vcheli:ped") then
			cancelEvent()
		end
	end
)

addEvent("vcheli:gui", true)
addEventHandler("vcheli:gui", getRootElement(),
	function(id)
		getId = id or 999
		showCursor(true)
		guiSetVisible(gui[1], true)
	end
)

addEvent("vcheli:stop", true)
addEventHandler("vcheli:stop", getRootElement(),
	function()
		if isTimer(startTimer) then
			killTimer(startTimer)
			removeEventHandler("onClientRender", getRootElement(), renderTimer)
		end
		if isTimer(fadeTimer) then
			killTimer(fadeTimer)
		end
		if isTimer(botTimer) then
			killTimer(botTimer)
		end
		if isElement(marker) then
			destroyElement(marker)
		end
		if isElement(blip) then
			destroyElement(blip)
		end
		setCameraTarget(localPlayer)
		unbindKey("h", "down", attachTnt)
		for _, v in ipairs(tnt1) do
			destroyElement(v)
		end
		for _, b in ipairs(getElementsByType("ped")) do
			if getElementData(b, "vcheli:ped") then
				destroyElement(b)
			end
		end
		tnt1 = {}
		tnt2 = {}
		botTimerSprint = {}
		oldPosition = {}
		setElementData(localPlayer, "vcheli:damage", false, false)
	end
)

addEvent("vcheli:start", true)
addEventHandler("vcheli:start", getRootElement(),
	function(vehicle)
		markerPos = 1
		getAttach = false
		getVehicle = vehicle
		bindKey("h", "down", attachTnt)
		for i, v in ipairs(tntSpawn) do
			tnt1[i] = createObject(1654, v[1], v[2], v[3])
			tnt2[i] = tnt1[i]
			setElementCollisionsEnabled(tnt1[i], false)
			setElementDimension(tnt1[i], getId)
		end
		for _, b in ipairs(botSpawn) do
			local ped = createPed(27, b[1], b[2], b[3])
			setElementDimension(ped, getId)
			setElementData(ped, "vcheli:ped", {b[1], b[2]}, false)
			givePedWeapon(ped, 9, 1, true)
		end
		botTimer = setTimer(botPosition, 500, 0)
		setElementData(localPlayer, "vcheli:damage", true, false)
		addEventHandler("onClientRender", getRootElement(), renderTimer)
		startTimer = setTimer(function()
			removeEventHandler("onClientRender", getRootElement(), renderTimer)
			triggerEvent("vcheli:stop", localPlayer)
			triggerServerEvent("vcheli:stop", localPlayer)
			outputChatBox("Zaman Doldu. zamanın yoktu", 255, 255, 0)
		end, (time * 60000), 1)
	end
)

function attachTnt()
	if isElement(getVehicle) and not getAttach then
		local id = 0
		local distance = 1.2
		local object = false
		local x1, y1, z1 = getElementPosition(getVehicle)
		for i, v in ipairs(tnt2) do
			local x2, y2, z2 = getElementPosition(v)
			local result = getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2)
			if result < distance then
				distance = result
				object = v
				id = i
			end
		end
		if object then
			getAttach = object
			attachElements(object, getVehicle, 0, 0, -0.5)
			table.remove(tnt2, id)
			marker = createMarker(markerSpawn[markerPos][1], markerSpawn[markerPos][2], markerSpawn[markerPos][3] - 1, "cylinder", 1, 255, 0, 0, 100)
			setElementDimension(marker, getId)
			blip = createBlipAttachedTo(marker, 0, 2, 255, 0, 0)
			outputChatBox("Patlayıcılar Yakalandı. İşaretli noktaya kurun", 0, 255, 0)
			addEventHandler("onClientMarkerHit", marker,
				function(player)
					local x, y, z = getElementPosition(source)
					detachElements(getAttach, getVehicle)
					setElementPosition(getAttach, x, y, z + 0.5)
					destroyElement(source)
					destroyElement(blip)
					markerPos = markerPos + 1
					getAttach = false
					if markerPos <= #markerSpawn then
						outputChatBox("Patlayıcı Seti. Bir tane daha al", 0, 255, 0)
					else
						removeEventHandler("onClientRender", getRootElement(), renderTimer)
						killTimer(startTimer)
						fixVehicle(getVehicle)
						fadeCamera(false, 3)
						fadeTimer = setTimer(function()
							setCameraMatrix(cameraPos[1], cameraPos[2], cameraPos[3], markerSpawn[1][1], markerSpawn[1][2], markerSpawn[1][3])
							setElementPosition(getVehicle, cameraPos[1], cameraPos[2], cameraPos[3] + 100)
							setElementFrozen(getVehicle, true)
							fadeCamera(true, 3)
							markerPos = 1
							fadeTimer = setTimer(function()
								setCameraMatrix(cameraPos[1], cameraPos[2], cameraPos[3], markerSpawn[markerPos][1], markerSpawn[markerPos][2], markerSpawn[markerPos][3])
								createExplosion(markerSpawn[markerPos][1], markerSpawn[markerPos][2], markerSpawn[markerPos][3], 10, true, 2, false)
								markerPos = markerPos + 1
								if markerPos > #markerSpawn then
									killTimer(botTimer)
									killTimer(fadeTimer)
									fadeCamera(false, 3)
									fadeTimer = setTimer(function()
										triggerEvent("vcheli:stop", localPlayer)
										triggerServerEvent("vcheli:stop", localPlayer, money)
										fadeCamera(true, 3)
										outputChatBox("Görev Tamamlandı!", 0, 255, 0)
									end, 3000, 1)
								end
							end, 2000, 0)
						end, 3000, 1)
					end
				end
			)
		else
			outputChatBox("Patlayıcılar Çok Uzakta!. Daha Yakına Uç", 255, 255, 0)
		end
	end
end

function botPosition()
	local px, py, pz = getElementPosition(getVehicle)
	for _, b in ipairs(getElementsByType("ped", root, true )) do
		local botPos = getElementData(b, "vcheli:ped")
		if botPos then
			if not isPedDead(b) then
				local bx, by, bz = getPedBonePosition(b, 8)
				if isLineOfSightClear(px, py, pz, bx, by, bz, true, false, false, true) then
					local distance = getDistanceBetweenPoints3D(px, py, pz, bx, by, bz)
					if distance < 30 then
						local r = findRotation(bx, by, px, py)
						if isTimer(botTimerSprint[b]) then
							killTimer(botTimerSprint[b])
						end
						botTimerSprint[b] = setTimer(function() end, 4000, 1)
						oldPosition[b] = {px, py}
						setPedRotation(b, r)
						setPedControlState(b, "sprint", true)
						setPedControlState(b, "forwards", true)
						if distance < 10 then
							setPedAimTarget(b, px, py, pz)
							setPedControlState(b, "fire", true)
						else
							setPedControlState(b, "fire", false)
						end
					else
						setPedControlState(b, "fire", false)
						if isTimer(botTimerSprint[b]) then
							local r = findRotation(bx, by, oldPosition[b][1], oldPosition[b][2])
							setPedRotation(b, r)
							setPedControlState(b, "forwards", true)
							setPedControlState(b, "sprint", true)
						else
							if getDistanceBetweenPoints3D(bx, by, 0, botPos[1], botPos[2], 0) > 1 then
								local r = findRotation(bx, by, botPos[1], botPos[2])
								setPedRotation(b, r)
								setPedControlState(b, "forwards", true)
								setPedControlState(b, "sprint", true)
							else
								setPedControlState(b, "forwards", false)
								setPedControlState(b, "sprint", false)
							end
						end
					end
				else
					setPedControlState(b, "fire", false)
					if isTimer(botTimerSprint[b]) then
						local r = findRotation(bx, by, oldPosition[b][1], oldPosition[b][2])
						setPedRotation(b, r)
						setPedControlState(b, "forwards", true)
						setPedControlState(b, "sprint", true)
					else
						if getDistanceBetweenPoints3D(bx, by, 0, botPos[1], botPos[2], 0) > 1 then
							local r = findRotation(bx, by, botPos[1], botPos[2])
							setPedRotation(b, r)
							setPedControlState(b, "forwards", true)
							setPedControlState(b, "sprint", true)
						else
							setPedControlState(b, "forwards", false)
							setPedControlState(b, "sprint", false)
						end
					end
				end
			end
		end
	end
end

function renderTimer()
dxDrawText("Tuş H", 0, 400, sx, 85, tocolor(255, 255, 255, 255), 2, "default-bold", "center", "bottom")
	if isTimer(startTimer) then
		local remaining = getTimerDetails(startTimer)
		local remaining = remaining / 1000
		if remaining < 60 then
			dxDrawText("Kalan "..math.floor(remaining).." Kalan Saniye.", 0, 400, sx, 50, tocolor(255, 255, 255, 255), 2, "default-bold", "center", "bottom")
		else
			dxDrawText("Kalan "..math.floor(remaining / 60).." Dakika.", 0, 400, sx, 50, tocolor(255, 255, 255, 255), 2, "default-bold", "center", "bottom")
		end
	end
end

function findRotation(x1, y1, x2, y2)
	local t = -math.deg(math.atan2(x2 - x1 , y2 - y1))
	if t < 0 then t = t + 360 end
	return t
end