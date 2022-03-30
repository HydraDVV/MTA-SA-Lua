sandalye_one = createObject(487.78125, -16.8408203125, 1000.6796875, 991.85)
setElementInterior(sandalye_one,17)
setElementDimension(sandalye_one,125)
setElementRotation(sandalye_one, 0, 0, 359.83795166016)

sandalye_two = createObject(2350,1963.412109375, 1021.6865234375, 991.85)
setElementInterior(sandalye_two,10)
setElementDimension(sandalye_two,162)
setElementRotation(sandalye_two, 0, 0, 245.365783691406)

sandalye_three = createObject(2350,1963.4736328125, 1018.74609375,991.85)
setElementInterior(sandalye_three,10)
setElementDimension(sandalye_three,162)
setElementRotation(sandalye_three, 0, 0, 120.365783691406)

ped_one=createPed(172,1961.9697265625, 1020.134765625, 992.46875,268)
setElementInterior(ped_one,10)
setElementDimension(ped_one,162)
setElementFrozen(ped_one,true)

Pozisyon: 487.78125, -16.8408203125, 1000.6796875
Rotasyon: 0, 0, 359.83795166016
Dimension: 125
Interior: 17

local x,y=guiGetScreenSize()
numbers={2,3,4,5,6,7,8}
numbers_kurp={6,7,8,9,10,11,12,13,14}

panel={
	state=nil,
	click=0,
	kurpiyer=0,
	kurpiyer_sakla=0,
	sen=0,
	bahis_miktari=0,
	durum="Bahis Bekleniyor",
	suan_state=nil,
	bahis_ucreti_ne_kadar=1000,
}

function c_blackjack_arayuz()
dxDrawRoundedRectangle(x*0.8400,y*0.3850,x*0.1400,y*0.2400,14,tocolor(0,0,0,222))
dxDrawText("Blackjack",x*0.8450,y*0.3750,x*0.8450,y*0.3750,tocolor(210,210,210,255),1,"beckett")
dxDrawText("Kurpiyer",x*0.8500,y*0.4200,x*0.8500,y*0.4200,tocolor(210,210,210,255),1,"default-bold")
dxDrawText(panel.kurpiyer,x*0.9500,y*0.4200,x*0.9500,y*0.4200,tocolor(111,111,111,255),1,"default-bold")
dxDrawText("Sen",x*0.8500,y*0.4600,x*0.8500,y*0.4600,tocolor(210,210,210,255),1,"default-bold")
dxDrawText(panel.sen,x*0.9500,y*0.4600,x*0.9500,y*0.4600,tocolor(111,111,111,255),1,"default-bold")
dxDrawRoundedRectangle(x*0.8150,y*0.4960,x*0.0200,y*0.0350,9,tocolor(0,0,0,222))
dxDrawRoundedRectangle(x*0.7930,y*0.4960,x*0.0200,y*0.0350,9,tocolor(0,0,0,222))
dxDrawText("+",x*0.8200,y*0.4950,x*0.8200,y*0.4950,tocolor(132,255,44,100),2,"default-bold")
if oyuncuMousesiRectangledeyse(x*0.8150,y*0.4960,x*0.0200,y*0.0350) then
if getKeyState("mouse1") and panel.click+200 <= getTickCount() then panel.click = getTickCount()
if panel.durum=="Bahis Bekleniyor" then else return end
panel.bahis_miktari=panel.bahis_miktari+panel.bahis_ucreti_ne_kadar
end
end
dxDrawText("-",x*0.7995,y*0.4920,x*0.7995,y*0.4920,tocolor(255,50,50,100),2,"default-bold")
if oyuncuMousesiRectangledeyse(x*0.7930,y*0.4960,x*0.0200,y*0.0350) then
if getKeyState("mouse1") and panel.click+200 <= getTickCount() then panel.click = getTickCount()
if panel.bahis_miktari <= 0 then panel.bahis_miktari=0 return end
if panel.durum=="Bahis Bekleniyor" then else return end
panel.bahis_miktari=panel.bahis_miktari-panel.bahis_ucreti_ne_kadar
end
end
dxDrawText("Bahis Miktarı",x*0.8500,y*0.5000,x*0.8500,y*0.5000,tocolor(210,210,210,255),1,"default-bold")
dxDrawText("$"..panel.bahis_miktari.."",x*0.9370,y*0.5000,x*0.9370,y*0.5000,tocolor(111,111,111,255),1,"default-bold")
dxDrawText("Durum",x*0.8500,y*0.5400,x*0.8500,y*0.5400,tocolor(210,210,210,255),1,"default-bold")
dxDrawText(panel.durum,x*0.9050,y*0.5400,x*0.9100,y*0.5400,tocolor(111,111,111,255),1,"default-bold")
dxDrawRoundedRectangle(x*0.8500,y*0.5770,x*0.0530,y*0.0380,9,tocolor(45, 41, 38,222))
dxDrawRoundedRectangle(x*0.9170,y*0.5770,x*0.0530,y*0.0380,9,tocolor(45, 41, 38,222))
dxDrawText("Hazır",x*0.8650,y*0.5850,x*0.8650,y*0.5850,tocolor(210,210,210,255),1,"default-bold")
dxDrawText("Kart Çek",x*0.9270,y*0.5850,x*0.9270,y*0.5850,tocolor(210,210,210,255),1,"default-bold")
if oyuncuMousesiRectangledeyse(x*0.9170,y*0.5770,x*0.0530,y*0.0380) then
if getKeyState("mouse1") and panel.click+200 <= getTickCount() then panel.click = getTickCount()
if panel.durum=="Kartlar dağıtıldı!" then
if panel.sen > 21 then
exports["titan_infobox"]:addBox("info", "Daha Fazla Kart Çekemezsin.")
else
exports["titan_infobox"]:addBox("success", "Bir Kart Çektin.")
c_kart_al = math.random(1,#numbers)
belirlenen_kart = numbers[c_kart_al]
panel.sen=panel.sen+belirlenen_kart
if panel.sen > 22 then 
panel.sen=22
end
end
end
end
elseif oyuncuMousesiRectangledeyse(x*0.8500,y*0.5770,x*0.0530,y*0.0380) then
if getKeyState("mouse1") and panel.click+200 <= getTickCount() then panel.click = getTickCount()
if panel.durum=="Bahis Bekleniyor" then
if panel.bahis_miktari >= panel.bahis_ucreti_ne_kadar then 
else 
exports["titan_infobox"]:addBox("warning", "Lütfen bir bahis miktarı seçin!")
return 
end
if exports.titan_global:hasMoney(localPlayer,panel.bahis_miktari) then 
else
exports["titan_infobox"]:addBox("warning", "Seçtiğiniz Bahis miktari kadar paranız bulunmamakta!")
return 
end
if panel.suan_state==nil then else return end
panel.suan_state=true
triggerServerEvent("c_para_kes",getLocalPlayer(),getLocalPlayer(),"kes",panel.bahis_miktari)
exports["titan_infobox"]:addBox("success", "$"..panel.bahis_miktari.." bahis yatırdın.")
exports["titan_infobox"]:addBox("info", "Kartlar Dağıtılıyor...")
chip_one = createObject(1906,1962.802734375, 1020.5, 992.46875)
setElementInterior(chip_one,10)
setElementDimension(chip_one,162)
chip_two = createObject(1906,1963.0126953125, 1019.9375, 992.46875)
setElementInterior(chip_two,10)
setElementDimension(chip_two,162)
chip_three = createObject(1905,1963.0341796875, 1020.36328125, 992.46875)
setElementInterior(chip_three,10)
setElementDimension(chip_three,162)
panel.durum="Round başladı!"
c_number_sen = math.random(1,#numbers)
belirlenen = numbers[c_number_sen]
panel.sen=belirlenen
setPedAnimation(ped_one,"casino","cards_raise")
setTimer(function()
c_number_kurpiyer = math.random(1,#numbers_kurp)
belirlenen_kur = numbers_kurp[c_number_kurpiyer]
panel.kurpiyer=belirlenen_kur
setPedAnimation(ped_one,false)
end,3000,1)
setTimer(function()
c_number_sen = math.random(1,#numbers)
belirlenen = numbers[c_number_sen]
panel.sen=panel.sen+belirlenen
panel.kurpiyer_sakla=panel.kurpiyer
panel.kurpiyer="??"
panel.durum="Kartlar dağıtıldı!"
setPedAnimation(ped_one,"casino","cards_raise")
setTimer(function() setPedAnimation(ped_one,false) end,1300,1)
end,6000,1)
end
if panel.durum=="Kartlar dağıtıldı!" then else return end
panel.durum="Kartlar Açılıyor!"
exports["titan_infobox"]:addBox("warning", "Kurpiyer Kartları Açıyor!")
setPedAnimation(ped_one,"casino","cards_win")
setTimer(function()
c_number_kurpiyer = math.random(1,#numbers)
belirlenen_kur = numbers[c_number_kurpiyer]
belirlenmis_kurpiyer=panel.kurpiyer_sakla+belirlenen_kur
if belirlenmis_kurpiyer <= 16 or belirlenmis_kurpiyer >= 20 then belirlenmis_kurpiyer=math.random(19,21) end
panel.kurpiyer=belirlenmis_kurpiyer
setPedAnimation(ped_one,false)
if panel.kurpiyer==panel.sen then
triggerServerEvent("c_para_kes",getLocalPlayer(),getLocalPlayer(),"Berabere",panel.bahis_miktari)
exports["titan_infobox"]:addBox("info", "Berabere (Kurpiyer: "..panel.kurpiyer.." Sen: "..panel.sen..")")
exports["titan_infobox"]:addBox("success", "$"..panel.bahis_miktari.." bahisini geri aldın.")
elseif panel.sen > 21 and panel.kurpiyer < 21 then
exports["titan_infobox"]:addBox("info", "Kaybettin! (Kurpiyer: "..panel.kurpiyer.." Sen: "..panel.sen..")")
elseif panel.kurpiyer >= panel.sen then
exports["titan_infobox"]:addBox("info", "Kaybettin! (Kurpiyer: "..panel.kurpiyer.." Sen: "..panel.sen..")")
elseif panel.kurpiyer > 21 and panel.sen < 21 then
eklenecek=panel.bahis_miktari*2
triggerServerEvent("c_para_kes",getLocalPlayer(),getLocalPlayer(),"ekle",eklenecek)
exports["titan_infobox"]:addBox("info", "Kurpiyer Battı! (Kurpiyer: "..panel.kurpiyer.." Sen: "..panel.sen..")")
elseif panel.sen >= panel.kurpiyer then
eklenecek=panel.bahis_miktari*2
exports["titan_infobox"]:addBox("info", "Kazandın! (Kurpiyer: "..panel.kurpiyer.." Sen: "..panel.sen..")")
triggerServerEvent("c_para_kes",getLocalPlayer(),getLocalPlayer(),"ekle",eklenecek)
end
end,3000,1)
setTimer(function()
panel.durum=""
panel.kurpiyer_sakla=0
panel.kurpiyer=0
panel.sen=0
panel.bahis_miktari=0
panel.durum="Bahis Bekleniyor"
panel.suan_state=nil
destroyElement (chip_one)
destroyElement (chip_two)
destroyElement (chip_three)
end,5000,1)
end
end
end

function sandalye_tiklama(button,state,absX,absY,wx,wy,wz,element)
if (button=="right") and (state=="down") then
if isPedInVehicle(localPlayer) then return end
if panel.state==true then panel.state=nil removeEventHandler("onClientRender",getRootElement(),c_blackjack_arayuz) end
if element==sandalye_one or element==sandalye_two or element==sandalye_three then else return end
if panel.state==nil then
panel.state=true
addEventHandler("onClientRender",getRootElement(),c_blackjack_arayuz)
end
end
end
addEventHandler("onClientClick",getRootElement(),sandalye_tiklama)

function oyuncuMousesiRectangledeyse(m_x,m_y,m_w,m_h)
if isCursorShowing() then else return end
local mouseX,mouseY = getCursorPosition()
m_eX,m_eY = guiGetScreenSize()
local neredeX,neredeY = mouseX*m_eX,mouseY*m_eY
if neredeX > m_x and neredeX < m_x + m_w and neredeY > m_y and neredeY < m_y + m_h then return true end
end

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