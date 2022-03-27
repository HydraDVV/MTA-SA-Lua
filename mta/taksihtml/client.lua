local sx, sy = guiGetScreenSize()
local browser = guiCreateBrowser(0, 0, sx, sy, true, true, false)
guiSetVisible(browser, false)
local theBrowser = guiGetBrowser(browser)

guiSetInputMode("no_binds_when_editing")

addEventHandler("onClientBrowserCreated", theBrowser, 
	function()
		loadBrowserURL(source, "http://mta/local/index.html")
	end
)

addEvent("taxipanel",true)
addEventHandler("taxipanel",root,function()
	guiSetVisible( browser, not guiGetVisible( browser ) )

end)

addEvent("taxi:kapat",true)
addEventHandler("taxi:kapat",root,function()
    guiSetVisible(browser,false)

end)

addEvent("igs",true)
addEventHandler("igs",root,function()
	triggerServerEvent("igs:git", localPlayer, localPlayer)
	guiSetVisible(browser,false)
end)

addEvent("fish",true)
addEventHandler("fish",root,function()
	triggerServerEvent("fish:git", localPlayer, localPlayer)
	guiSetVisible(browser,false)
end)

addEvent("trt",true)
addEventHandler("trt",root,function()
	triggerServerEvent("trt:git", localPlayer, localPlayer)
	guiSetVisible(browser,false)
end)

addEvent("tütün",true)
addEventHandler("tütün",root,function()
	triggerServerEvent("tütün:git", localPlayer, localPlayer)
	guiSetVisible(browser,false)
end)



