local sx, sy = guiGetScreenSize()
local browser = guiCreateBrowser(0, -10, sx, sy, true, true, false)
guiSetVisible(browser, false)
local theBrowser = guiGetBrowser(browser)
guiSetInputMode("no_binds_when_editing")
addEventHandler("onClientBrowserCreated", theBrowser, 
    function()
    loadBrowserURL(source, "http://mta/local/index.html")
    end
)



addCommandHandler("arabam",function()
	if getElementData(localPlayer, "arabam:acamaz") then
	 outputChatBox("[X] #FFFFFFYalnızca 60 dakikada bir ilan verebilirsiniz.",255,0,0,true)
	else
    guiSetVisible( browser, not guiGetVisible( browser ) )
	end
end)

----------------------------------------------------


addEvent("arabam.send",true)
addEventHandler("arabam.send",root,function(sa, as, ss, dd)

	guiSetVisible( browser, not guiGetVisible( browser ) )
	triggerServerEvent("arabamdc", localPlayer, sa, as, ss, dd)
		setElementData(localPlayer, "arabam:acamaz", true)
	setTimer(function()
	    setElementData(localPlayer, "arabam:acamaz", nil)
    end, 3600000, 1)	


end)






----------------------------------------------------






addEvent("arabam.close",true)
addEventHandler("arabam.close",root,function()
	showCursor(false)
	guiSetVisible( browser, not guiGetVisible( browser ) )
end)