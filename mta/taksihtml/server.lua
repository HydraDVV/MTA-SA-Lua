function igsgit (self)
    if not exports.global:hasMoney(self,50) then
    outputChatBox("[-] #ffffffTaksi Ücreti 50TL Dostum",self,255,0,0,true)
	return end
	exports.global:takeMoney(self,50)
	outputChatBox("[+] #ffffffBaşarıyla Benzinlik Konumuna Geldin",self,0,255,0,true)
	setElementPosition(self, 1902.462890625, -1757.7568359375, 13.546875)
	setElementInterior(self, 0)
	setElementDimension(self, 0)

end
addEvent("igs:git",true)
addEventHandler("igs:git",root,igsgit)


function fishgit (self)
    if not exports.global:hasMoney(self,50) then
    outputChatBox("[-] #ffffffTaksi Ücreti 50TL Dostum",self,255,0,0,true)
	return end
	exports.global:takeMoney(self,50)
	outputChatBox("[+] #ffffffBaşarıyla Balıkçılık Konumuna Geldin",self,0,255,0,true)
	setElementPosition(self, 370.4736328125, -2012.66796875, 7.671875)
	setElementInterior(self, 0)
	setElementDimension(self, 0)

end
addEvent("fish:git",true)
addEventHandler("fish:git",root,fishgit)

function trtgit (self)
    if not exports.global:hasMoney(self,50) then
    outputChatBox("[-] #ffffffTaksi Ücreti 50TL Dostum",self,255,0,0,true)
	return end
	exports.global:takeMoney(self,50)
	outputChatBox("[+] #ffffffBaşarıyla TRT Konumuna Geldin",self,0,255,0,true)
	setElementPosition(self, 643.4970703125, -1361.3818359375, 13.592099189758)
	setElementInterior(self, 0)
	setElementDimension(self, 0)

end
addEvent("trt:git",true)
addEventHandler("trt:git",root,trtgit)

function tutungit (self)
    if not exports.global:hasMoney(self,50) then
    outputChatBox("[-] #ffffffTaksi Ücreti 50TL Dostum",self,255,0,0,true)
	return end
	exports.global:takeMoney(self,50)
	outputChatBox("[+] #ffffffBaşarıyla Tütün Konumuna Geldin",self,0,255,0,true)
	setElementPosition(self, 1902.462890625, -1757.7568359375, 13.546875)
	setElementInterior(self, 0)
	setElementDimension(self, 0)

end
addEvent("tütün:git",true)
addEventHandler("tütün:git",root,tutungit)

