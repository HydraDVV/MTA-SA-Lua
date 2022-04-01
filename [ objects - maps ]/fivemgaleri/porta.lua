--##################################--
--# criado por RF Mapper >>Rafa Mapper<<|#--
--##################################--
                               ------------PORTÃO ENTRADA-------------

local portao1 = createObject(18553, 1768.3361816406, -1769.947265625, 12.710599899292, 0, 0, 180 ) 

local ponto = createMarker(1767.6470947266,-1769.9012451172,13.71063709259,"cylinder",2,255,255,255,0)



function Aberto(p)
moveObject(portao1, 2500, 1766.4385986328, -1769.947265625, 12.710599899292, 0, 0, 0) 
outputChatBox ( "", p, 0,255,0 ) 
end


addEventHandler( "onMarkerHit", ponto, Aberto )

function Fechado(p)
moveObject(portao1, 2500, 1768.3361816406, -1769.947265625, 12.710599899292, 0, 0, 0) 
end

addEventHandler( "onMarkerLeave", ponto, Fechado )

----------------------------------------------------------------------------------------------------

local portao2 = createObject(18553, 1770.3559570313, -1769.9476318359, 12.710599899292, 0, 0, 180 ) 

local ponto = createMarker(1767.6470947266,-1769.9012451172,13.71063709259,"cylinder",2,255,255,255,0)



function Aberto(p)
moveObject(portao2, 2500, 1772.2629394531, -1769.9476318359, 12.710599899292, 0, 0, 0) 
outputChatBox ( "", p, 0,255,0 ) 
end


addEventHandler( "onMarkerHit", ponto, Aberto )

function Fechado(p)
moveObject(portao2, 2500, 1770.3559570313, -1769.9476318359, 12.710599899292, 0, 0, 0) 
end

addEventHandler( "onMarkerLeave", ponto, Fechado )

--------------------------------------------------------------------------------------------------------------------

                                           -----------------ADMINISTRAÇÃO-------------------------
local porta1 = createObject(3089, 1761.3525390625, -1772.3100585938, 14.039600372314, 0, 0, 270 ) 

local ponto = createMarker(1761.3525390625, -1772.3100585938, 14.039600372314,"cylinder",2,255,255,255,0)



function Aberto(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("Admin")) then 
moveObject(porta1, 2500, 1761.3525390625, -1770.8188476563,14.039600372314, 0, 0, 0) 
outputChatBox ( "", p, 0,255,0 ) 
end
end

addEventHandler( "onMarkerHit", ponto, Aberto )

function Fechado(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("Admin")) then
moveObject(porta1, 2500, 1761.3525390625, -1772.3100585938, 14.039600372314, 0, 0, 0) 
end
end

addEventHandler( "onMarkerLeave", ponto, Fechado )

---------------------------------------------------------------------------------------------------------------------------------

local porta2 = createObject(3089, 1761.3449707031, -1786.7583007813, 14.039600372314, 0, 0, 90 ) 

local ponto = createMarker(1761.3449707031, -1786.7583007813, 14.039600372314,"cylinder",2,255,255,255,0)



function Aberto(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("Admin")) then 
moveObject(porta2, 2500, 1761.3449707031, -1788.2563476563,14.039600372314, 0, 0, 0) 
outputChatBox ( "", p, 0,255,0 ) 
end
end

addEventHandler( "onMarkerHit", ponto, Aberto )

function Fechado(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("Admin")) then
moveObject(porta2, 2500, 1761.3449707031, -1786.7583007813, 14.039600372314, 0, 0, 0) 
end
end

addEventHandler( "onMarkerLeave", ponto, Fechado )	

-------------------------------------------------------------------------------------------------------------------------------

local garagemadmin = createObject(3037, 1769.34765625, -1791.4732666016, 14.909099578857, 0, 0, 90 ) 



function Aberto(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("Admin")) then 
moveObject(garagemadmin, 3000, 1769.34765625, -1791.4732666016,10.505999565125, 0, 0, 0) 
outputChatBox ( "", p, 0,255,0 ) 
end
end

addCommandHandler( "abrir", Aberto )

function Fechado(p)
if isObjectInACLGroup("user."..getAccountName(getPlayerAccount(p)), aclGetGroup("Admin")) then
moveObject(garagemadmin, 3000, 1769.34765625, -1791.4732666016, 14.909099578857, 0, 0, 0) 
end
end

addCommandHandler( "fechar", Fechado )

--------------------------------------------------------------------------------------------------------------------------														   													   