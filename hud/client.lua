local sX, sY = guiGetScreenSize()
local px, py = (sX/1366), (sY/768)
local font = exports["fonts"]:getFont("RobotoB",9)
local font2 = exports["fonts"]:getFont("RobotoB",15)
local font3 = exports["fonts"]:getFont("FontAwesome",11)
local font4 = exports["fonts"]:getFont("FontAwesome",15)
local git = exports.fonts:getIcon('fa-print',25)

anim = 400

--function statspanel ()
--if yerinegeldi == 0 then 
	--anim = anim - 10
	--if anim == 0 then
		--yerinegeldi = 1
	--end
--end
--if gidiyor == 0 then 
	--anim = anim + 10
	--if anim == 400 then
		--gidiyor = 1
	--end
--end
--local saat = getElementData (localPlayer,"hoursplayed")
--local jobs = exports["jobs"]:getJobTitleFromID(job)
--local coco =  getElementData(localPlayer,"alke")
--local agirlik = getElementData(localPlayer, "agirlik")
--local localPlayerName = getPlayerName(getLocalPlayer())
--local ev  = getElementData(localPlayer,"evler") 
--local bakiyeMiktari = getElementData(localPlayer, "bakiye").." TL"


--if getElementData(localPlayer,"license.car") == 0 then 
    --ehliyet = "Yok"
--elseif getElementData(localPlayer,"license.car") == 1 then 
    --ehliyet = "Var"
--end
--- 1 BÖLGE 
--dxDrawRoundedRectangle ( px*1110+anim, py*157, px*250, py*130, 8 ,tocolor ( 10, 10, 10, 200 ) )
--dxDrawRoundedRectangle ( px*1110+anim, py*157, px*40, py*130, 8 ,tocolor ( 10, 10, 10, 255 ) )
--dxDrawImage(px*1113+anim, py*210, px*35, py*25,"icons/parmakizi.png", 0, 0, 0, tocolor(255,255,255), false) --- parmak izi 
--dxDrawText (localPlayerName..  " Karakter B.", px*1160+anim, py*170, px*137,py*35, tocolor ( 255, 255, 255, 255 ), 1, font2 ) --- ehliyet
--dxDrawText ( "Sürücü Belgesi : "..ehliyet, px*1160+anim, py*195, px*137,py*35, tocolor ( 255, 255, 255, 255 ), 1, font3 ) --- Saat
--dxDrawText ( "Total Oynama Saati: "..saat, px*1160+anim, py*208, px*137,py*35, tocolor ( 255, 255, 255, 255 ), 1, font3 ) --- Saat
--dxDrawText ( "Doğum Tarihi: "..exports.global:getPlayerDoB(localPlayer), px*1160+anim, py*221, px*137,py*35, tocolor ( 255, 255, 255, 255 ), 1, font3 ) --- Dogum Günü
--dxDrawText ( ""..agirlik, px*1156+anim, py*234, px*137,py*35, tocolor ( 255, 255, 255, 255 ), 1, font3 ) --- Dogum Günü
--dxDrawText ( "Meslek: "..jobs, px*1160+anim, py*248, px*137,py*35, tocolor ( 255, 255, 255, 255 ), 1, font3 ) --- Saat
--dxDrawText ( "rhinoCoin: "..bakiyeMiktari, px*1160+anim, py*261, px*137,py*35, tocolor ( 255, 255, 255, 255 ), 1, font3 ) --- Saat


--dxDrawRoundedRectangle ( px*1110+anim, py*290, px*250, py*80, 8 ,tocolor ( 10, 10, 10, 200 ) )
--dxDrawRoundedRectangle ( px*1110+anim, py*290, px*40, py*80, 8 ,tocolor ( 10, 10, 10, 255 ) )
--dxDrawImage(px*1105+anim, py*300, px*50, py*50,"icons/araba.png", 0, 0, 0, tocolor(255,255,255), false) --- araba 
--dxDrawText (coco, px*1160+anim, py*300, px*137,py*35, tocolor ( 255, 255, 255, 255 ), 1, font3 ) --- arabalar
--dxDrawRoundedRectangle ( px*1230+anim, py*290, px*40, py*80, 8 ,tocolor ( 10, 10, 10, 255 ) )
--dxDrawText (ev, px*1280+anim, py*300, px*137,py*35, tocolor ( 255, 255, 255, 255 ), 1, font3 ) --- arabalar
--dxDrawImage(px*1237+anim, py*311, px*25, py*25,"icons/home.png", 0, 0, 0, tocolor(255,255,255), false) --- araba 



--end

--function komut ()
--addEventHandler("onClientRender",root,statspanel)
--playSound("sound.mp3")
--yerinegeldi = 0
--anim = 400
--setTimer(function()
--gidiyor = 0
--end,12000,1)
--setTimer(function()
--removeEventHandler("onClientRender",root,statspanel)
--end,15000,1)

--end 
--addCommandHandler("stats",komut)



function dxDrawRoundedRectangle(x, y, width, height, radius, color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y+radius, width-(radius*2), height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawCircle(x+radius, y+radius, radius, 180, 270, color, color, 16, 1, postGUI)
    dxDrawCircle(x+radius, (y+height)-radius, radius, 90, 180, color, color, 16, 1, postGUI)
    dxDrawCircle((x+width)-radius, (y+height)-radius, radius, 0, 90, color, color, 16, 1, postGUI)
    dxDrawCircle((x+width)-radius, y+radius, radius, 270, 360, color, color, 16, 1, postGUI)
    dxDrawRectangle(x, y+radius, radius, height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y+height-radius, width-(radius*2), radius, color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+width-radius, y+radius, radius, height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y, width-(radius*2), radius, color, postGUI, subPixelPositioning)
end


function bindSomeHotKey()
	bindKey("F5", "down", function()
		if getElementData(localPlayer, "vehicle_hotkey") == "0" then 
			return false
		end
		triggerServerEvent('realism:seatbelt:toggle', localPlayer, localPlayer)
	end) 

	bindKey("x", "down", function() 
		if getElementData(localPlayer, "vehicle_hotkey") == "0" then 
			return false
		end
		triggerServerEvent('vehicle:togWindow', localPlayer)
	end)
end
addEventHandler("onClientResourceStart", resourceRoot, bindSomeHotKey)

local screenSize = Vector2( guiGetScreenSize() )

function getScreenRotationFromWorldPosition( targetX, targetY, targetZ )
    -- Get camera position and rotation
    local camX, camY, _, lookAtX, lookAtY = getCameraMatrix()
    local camRotZ = math.atan2 ( ( lookAtX - camX ), ( lookAtY - camY ) )

    -- Calc direction to
    local dirX = targetX - camX
    local dirY = targetY - camY

    -- Calc rotation to
    local dirRotZ = math.atan2(dirX,dirY)

    -- Calc relative rotation to
    local relRotZ = dirRotZ - camRotZ

    -- Return rotation in degrees
    return math.deg(relRotZ)
end

setTimer(
         function()
			for key, value in ipairs(getElementsByType("player"), root, true) do
				local rot = getPedCameraRotation(value)
				local x, y, z = getElementPosition(value)
				local sx, sy = getScreenFromWorldPosition ( x, y, z )
				local sxx, syy = guiGetScreenSize()
				local vx = x + math.sin(math.rad(rot)) * 10
				local vy = y + math.cos(math.rad(rot)) * 10
				local _, _, vz = getWorldFromScreenPosition ( sxx, syy, 1 )
				if getElementData(value, "kafa") == 1 then
				
				else
				setPedAimTarget(value, vx, vy, vz )
				setPedLookAt(value, vx, vy, vz)
			end
			end
         end
, 90, 0)

function deneme ()
	if getElementData(getLocalPlayer(), "kafa") == 1 then
	 setElementData(localPlayer, "kafa", 0)
	 outputChatBox("#822828"..exports["pool"]:getServerName()..":#ffffff Kafa çevirme açıldı.", 0, 255, 0, true)
	else
	setElementData(getLocalPlayer(), "kafa", 1)
	outputChatBox("#822828"..exports["pool"]:getServerName()..":#ffffff Kafa çevirme kapatıldı.", 255, 0, 0, true)
	end
end
addCommandHandler("kafacevir", deneme)


function isActive()
	return getElementData(localPlayer, "hide_hud") ~= "0"
end




--[[ 
addEventHandler("onClientPreRender", root, 
	function()
		for key, value in ipairs(getElementsByType("player"), root, true) do
			x, y, z, lx, ly, lz = triggerServerEvent("getPedLookAt", value) -- value, 
			setPedAimTarget(value, x, y, z )
			setPedLookAt(value, x, y, z)
		end
	end
)]]
