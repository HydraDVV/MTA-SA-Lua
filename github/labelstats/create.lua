local scrWidth, scrHeight = guiGetScreenSize()
local FPSLimit, lastTick, framesRendered, FPS = 100, getTickCount(), 0, 0
local font = dxCreateFont('font.ttf', 10)

function dxDrawShadowText(text, x1, y1, x2, y2, color, scale, font, alignX, alignY)
    dxDrawText(text, x1 - 1, y1, x2 - 1, y2, tocolor(0, 0, 0, 150), scale, font, alignX, alignY)
    dxDrawText(text, x1 + 1, y1, x2 + 1, y2, tocolor(0, 0, 0, 150), scale, font, alignX, alignY)
    dxDrawText(text, x1, y1 - 1, x2, y2 - 1, tocolor(0, 0, 0, 150), scale, font, alignX, alignY)
    dxDrawText(text, x1, y1 + 1, x2, y2 + 1, tocolor(0, 0, 0, 150), scale, font, alignX, alignY)
    dxDrawText(text, x1 - 2, y1, x2 - 2, y2, tocolor(0, 0, 0, 150), scale, font, alignX, alignY)
    dxDrawText(text, x1 + 2, y1, x2 + 2, y2, tocolor(0, 0, 0, 150), scale, font, alignX, alignY)
    dxDrawText(text, x1, y1 - 2, x2, y2 - 2, tocolor(0, 0, 0, 150), scale, font, alignX, alignY)
    dxDrawText(text, x1, y1 + 2, x2, y2 + 2, tocolor(0, 0, 0, 150), scale, font, alignX, alignY)
    dxDrawText(text, x1, y1, x2, y2, color, scale, font, alignX, alignY)
end

function _render()
    local currentTick = getTickCount()
    local elapsedTime = currentTick - lastTick
    if elapsedTime >= 1000 then
        FPS = framesRendered
        lastTick = currentTick
        framesRendered = 2
    else
        framesRendered = framesRendered + 1
    end
    if FPS > FPSLimit then
        FPS = FPSLimit
    end
    local ping = getPlayerPing(localPlayer)
    local hours = getRealTime().hour
    local minutes = getRealTime().minute
    local monthday = getRealTime().monthday
    local month = getRealTime().month
    month = month + 1
    dxDrawShadowText(""..tostring(FPS).." FPS | "..ping.." MS", 0, 0, scrWidth, scrHeight - 40, tocolor(200, 200, 200, 200), 1, font, "center", "bottom")
    dxDrawShadowText(""..hours..":"..minutes.." | "..monthday.."."..month..".21", 0, 0, scrWidth, scrHeight - 25, tocolor(200, 200, 200, 200), 1, font, "center", "bottom")
end
addEventHandler('onClientRender',root,_render,true,"low-10")