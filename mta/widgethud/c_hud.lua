local width, height = 250,26
local sx, sy = guiGetScreenSize()
local px,py = 1600,900
local x,y =  (sx/px), (sy/py)
local toBeDrawnWidth = width

if sx == 1680 then 
    size = 1
elseif sx == 1940 then 
    size = 0.8 
end

local awesome = exports.ed_fonts:getFont('FontAwesome', 11)
local robotoB = exports.ed_fonts:getFont('RobotoB', 11)
local robotoB1 = exports.ed_fonts:getFont('RobotoB', 9.5)
local robotoB32 = exports.ed_fonts:getFont('RobotoB', 30)

local clockIcon = exports.ed_fonts:getIcon('fa-clock-o')
local playerIcon = exports.ed_fonts:getIcon('fa-users')
local wallet = exports.ed_fonts:getIcon('fa-dollar')


local posXOffset, posYOffset = 15, 30
local r,g,b = 255,255,255

function renderHud()
	if getElementData(getLocalPlayer(),'loggedin') == 1 then
	    if getElementData(localPlayer, "hudkapat") then return end
	    if getElementData(localPlayer, "radaracik") then return end
        dxDrawRoundedRectangle(sx-toBeDrawnWidth-5+posXOffset-214, 5+posYOffset-3, toBeDrawnWidth+posYOffset+140, height+5, tocolor(0, 0, 0, 120), 10)

        --dxDrawText(clockIcon,sx-toBeDrawnWidth-5+posXOffset-214, 5+posYOffset+3, toBeDrawnWidth, height, tocolor ( 0, 0, 0, 220 ), 1, awesome, "left", "top", false, false, false, true)
        dxDrawText(clockIcon,sx-toBeDrawnWidth-5+posXOffset-203, 5+posYOffset+4, toBeDrawnWidth, height, tocolor ( 207, 210, 210, 220 ), 1, awesome, "left", "top", false, false, false, true)

        --dxDrawText(""..os.date('%H:%M').."   "..os.date('%d/%m/%Y').."",sx-toBeDrawnWidth-5+posXOffset-189, 5+posYOffset+3, toBeDrawnWidth, height, tocolor ( 0, 0, 0, 220 ), 1, robotoB, "left", "top", false, false, false, true)
        dxDrawText("#ffffff"..os.date('%H:%M').."  #Cfd2d2"..os.date('%d/%m/%Y').."",sx-toBeDrawnWidth-5+posXOffset-180, 5+posYOffset+3, toBeDrawnWidth, height, tocolor ( 207, 210, 210, 220 ), 1, robotoB, "left", "top", false, false, false, true)

        --dxDrawText("ID "..getElementData(localPlayer, "playerid").."",sx-toBeDrawnWidth-5+posXOffset-19, 5+posYOffset+3, toBeDrawnWidth, height, tocolor ( 0,0,0, 220 ), 1, robotoB, "left", "top", false, false, false, true)
        dxDrawText("ID #ffffff"..getElementData(localPlayer, "playerid").."",sx-toBeDrawnWidth-5+posXOffset-20, 5+posYOffset+3, toBeDrawnWidth, height, tocolor ( 207, 210, 210, 220 ), 1, robotoB, "left", "top", false, false, false, true)

        --dxDrawText(playerIcon,sx-toBeDrawnWidth-10+posXOffset+49, 5+posYOffset+3, toBeDrawnWidth, height, tocolor ( 0 ,0 ,0, 220 ), 1, awesome, "left", "top", false, false, false, true)
        dxDrawText(playerIcon,sx-toBeDrawnWidth-10+posXOffset+50, 5+posYOffset+3, toBeDrawnWidth, height, tocolor ( 207, 210, 210, 220 ), 1, awesome, "left", "top", false, false, false, true)

       --dxDrawText(""..#getElementsByType("player").."/512",sx-toBeDrawnWidth-5+posXOffset+76, 5+posYOffset+3, toBeDrawnWidth, height, tocolor ( 0,0,0, 220 ), 1, robotoB, "left", "top", false, false, false, true)
        dxDrawText("#ffffff"..#getElementsByType("player").."#Cfd2d2/512",sx-toBeDrawnWidth-5+posXOffset+75, 5+posYOffset+3, toBeDrawnWidth, height, tocolor ( 207, 210, 210, 220 ), 1, robotoB, "left", "top", false, false, false, true)

        dxDrawImage(sx-toBeDrawnWidth-1+posXOffset+124, 5+posYOffset-25, 75, 75, "files/logo.png" )
        local thirst = getElementData(localPlayer, "thirst") or 100
        local hunger = getElementData(localPlayer, "hunger") or 100

        thirstperc, hungerperc = thirst*3.6, hunger*3.6

        dxDrawCircle(sx-toBeDrawnWidth-1+posXOffset+158, 5+posYOffset+70, 26.5, 0, 360, tocolor(0,0,0, 255))
        dxDrawCircle(sx-toBeDrawnWidth-1+posXOffset+158, 5+posYOffset+70, 24, 0, 360, tocolor(135, 31, 61, 180))
        dxDrawCircle(sx-toBeDrawnWidth-1+posXOffset+158, 5+posYOffset+70, 24, 0, thirstperc, tocolor(182, 54, 91, 180)) -- thirst
        dxDrawImage(sx-toBeDrawnWidth-1+posXOffset+145, 5+posYOffset+60, 25, 20, "files/thirst.png" )


        dxDrawCircle(sx-toBeDrawnWidth-1+posXOffset+158, 5+posYOffset+130, 26.5, 0, 360, tocolor(0,0,0, 255))
        dxDrawCircle(sx-toBeDrawnWidth-1+posXOffset+158, 5+posYOffset+130, 24, 0, 360, tocolor(132,102,76, 180))
        dxDrawCircle(sx-toBeDrawnWidth-1+posXOffset+158, 5+posYOffset+130, 24, 0, hungerperc, tocolor(176,114,73, 180)) -- hunger
        dxDrawImage(sx-toBeDrawnWidth-1+posXOffset+145, 5+posYOffset+120, 25, 20, "files/hunger.png" )

        local theVehicle = getPedOccupiedVehicle(localPlayer)
        local money = exports.ed_global:formatMoney(exports.ed_global:getMoney(localPlayer))
        if theVehicle then
            local vehs = math.floor(getElementSpeed(theVehicle, "kmh"))
            local fuel = getElementData(theVehicle, "fuel") or 100
            fuel = math.floor(fuel)
            local speedText = getFormatSpeed(vehs)

            fueltext = "100"
            if (fuel <= 10) then
                fueltext = "10"
            elseif (fuel <= 20) then
                fueltext = "20"
            elseif (fuel <= 30) then
                fueltext = "30"
            elseif (fuel <= 40) then
                fueltext = "40"
            elseif (fuel <= 50) then
                fueltext = "50"
            elseif (fuel <= 60) then
                fueltext = "60"
            elseif (fuel <= 70) then
                fueltext = "60"
            elseif (fuel <= 80) then
                fueltext = "60"
            elseif (fuel <= 90) then
                fueltext = "90"
            elseif (fuel <= 100) then
                fueltext = "100"
            end

            dxDrawText(speedText, x*1440, y*830, x*134, y*19, tocolor(255,255,255, 255), size, robotoB32, "left", "top",false, false, false, true)

            dxDrawText(" km/h", x*1520, y*850, x*134, y*19, tocolor(255, 255, 255 ,255), size, robotoB, "left", "top",false, false, false, true)

            --dxDrawText("#Cfd2d2%#ffffff"..fuel, x*1358.5, y*822, x*134, y*19, tocolor(255, 255, 255 ,255), size, robotoB1, "left", "top",false, false, false, true)

            dxDrawImage(x*1365, y*840, 25, 25, "files/fuel/"..fueltext..".png", 0, 0, 0, tocolor(255, 255, 255, 255))

            dxDrawImage(x*1400, y*820, 150, 50, "files/hudspeed.png", 0, 0, 0, tocolor(255, 255, 255, 255))
        else
            if sx == 1920 then
                if getElementData(localPlayer, "injured") then 
                    pvpIMG = "skull"
                else 
                    pvpIMG = "angel"
                end
                length = dxGetTextWidth(money, 1, robotoB)
                dxDrawRoundedRectangle(x*1488, y*850, length+65, 32, tocolor(0, 0, 0, 150), 5)
                dxDrawImage ( x*1498, y*855, 20, 20, 'files/wallet.png', 0, -120)
                dxDrawText(""..money.."$", x*1527, y*857, x*134, y*19, tocolor(255, 255, 255 ,255), 1, robotoB, "left", "top")
                dxDrawImage( x*1450+5, y*850, 30, 30, 'files/'..pvpIMG..'.png')
            else
                if getElementData(localPlayer, "injured") then 
                    pvpIMG = "skull"
                else 
                    pvpIMG = "angel"
                end
                length = dxGetTextWidth(money, 1, robotoB)
                dxDrawRoundedRectangle(x*1448, y*850, length+65, 32, tocolor(0, 0, 0, 150), 5)
                dxDrawImage ( x*1458, y*855, 20, 20, 'files/wallet.png', 0, -120)
                dxDrawText(""..money.."$", x*1490, y*857, x*134, y*19, tocolor(255, 255, 255 ,255), 1, robotoB, "left", "top")
                dxDrawImage( x*1400+5, y*850, 30, 30, 'files/'..pvpIMG..'.png')
            end
        end 
    end
end
setTimer(renderHud,5,0)

function getFormatSpeed(unit)
    if unit < 10 then
        unit = "#Cfd2d200#ffffff" .. unit
    elseif unit < 100 then
        unit = "#Cfd2d20#ffffff" .. unit
    elseif unit >= 1000 then
        unit = "999"
    end
    return unit
end


function getElementSpeed(element,unit)
    if (unit == nil) then unit = 0 end
    if (isElement(element)) then
        local x,y,z = getElementVelocity(element)
        if (unit=="mph" or unit==1 or unit =='1') then
            return math.floor((x^2 + y^2 + z^2) ^ 0.49 * 100)
        else
            return math.floor((x^2 + y^2 + z^2) ^ 0.49 * 100 * 1.609344)
        end
    else
        return false
    end
end

function dxDrawRoundedRectangle(x, y, rx, ry, color, radius)
    rx = rx - radius * 2
    ry = ry - radius * 2
    x = x + radius
    y = y + radius

    if (rx >= 0) and (ry >= 0) then
        dxDrawRectangle(x, y, rx, ry, color)
        dxDrawRectangle(x, y - radius, rx, radius, color)
        dxDrawRectangle(x, y + ry, rx, radius, color)
        dxDrawRectangle(x - radius, y, radius, ry, color)
        dxDrawRectangle(x + rx, y, radius, ry, color)

        dxDrawCircle(x, y, radius, 180, 270, color, color, 7)
        dxDrawCircle(x + rx, y, radius, 270, 360, color, color, 7)
        dxDrawCircle(x + rx, y + ry, radius, 0, 90, color, color, 7)
        dxDrawCircle(x, y + ry, radius, 90, 180, color, color, 7)
    end
end

function test()
    if not exports.ed_integration:isPlayerDeveloper(localPlayer) then return end
    setElementData(localPlayer, "pvp", false)
    setElementData(localPlayer, "pvpsure", 0)
end
addCommandHandler("pvpkapa", test)