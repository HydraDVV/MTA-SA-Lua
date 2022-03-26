local sx, sy = guiGetScreenSize()
local w, h, w2 = 310, 10, 310
local x, y = sx / 2 - w / 2, sy - h - 90
local waterState = false
local oxigen = getPedOxygenLevel(localPlayer)

renderTimers = {}
function createRenderBreath(id, func)
    if not isTimer(renderTimers[id]) then
        renderTimers[id] = setTimer(func, 0, 0)
    end
end

function destroyRenderBreath(id)
    if isTimer(renderTimers[id]) then
        killTimer(renderTimers[id])
        renderTimers[id] = nil
        collectgarbage("collect")
    end
end

function onJoinEvents()
	setPlayerHudComponentVisible( "breath", false )
end
addEventHandler("onClientPlayerJoin", root, onJoinEvents)
addEventHandler("onClientResourceStart", root, onJoinEvents)

function drawnEvent()
    if getElementData(localPlayer, "loggedin") ~= 1 then return end
    local enabled,x,y,w,h,sizable,turnable = true, 375, sy - 20 - 70, 75, 70, 20, 20
    local w, h = 75, 75
    local oxigen = math.min(1000, getPedOxygenLevel(localPlayer))
    local multipler = (oxigen / 1000)
    dxDrawImage(x, y, w, h, "files/breath.png", 0,0,0, tocolor(120,120,120,255))
    if multipler >= 1 then multipler = 1 end
    if multipler <= 0 then multipler = 0 end
    
    local h = h * (1 - multipler)
    dxDrawImageSection(x, y + h, w, 75 - h, 0, h, w, 75 - h, "files/breath.png")
end

setTimer(
    function()
        if isElementInWater(localPlayer) then
            if not waterState then
                waterState = true
                createRenderBreath("drawnEvent", drawnEvent)
            end
        else
            if waterState then
                waterState = false
                destroyRenderBreath("drawnEvent", drawnEvent)
            end
        end
    end, 350, 0
)