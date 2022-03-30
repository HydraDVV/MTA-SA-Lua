addEvent("c_para_kes",true)
function para_kes(thePlayer,state,miktar)
if state=="kes" then
	exports.titan_global:takeMoney(thePlayer,miktar)
elseif state=="ekle" then
	exports.titan_global:giveMoney(thePlayer,miktar)
elseif state=="Berabere" then
	exports.titan_global:giveMoney(thePlayer,miktar)
end
end
addEventHandler("c_para_kes",getRootElement(),para_kes)