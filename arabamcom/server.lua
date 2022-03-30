local timers = {}
local advertisementMessages = { "samp", "arıyorum", "aranır", "istiyom", "istiyorum", "SA-MP", "oyuncak", "boncuk", "silah", "@everyone", "@here", "https://discord.gg/mzh3Pt79M6",  "https://discord.gg/mzh3Pt79M6", "mp", "ak", "roleplay", "ananı", "sikeyim", "sikerim", "orospu", "evladı", "Kye", "arena", "Arina", "rina", "vendetta", "vandetta", "shodown", "Vedic", "vedic","ventro","Ventro", "server", "sincityrp", "ls-rp", "sincity", "tri0n3", "mta", "mta-sa", "query", "Query", "inception", "p2win", "pay to win" }
function arabamdc(sa, as, ss, dd)
		if sa and as and ss and dd == "" then
		 outputChatBox("[-]#ffffff Eksik doldurmuşsunuz.", source, 255, 0, 0, true)
		return end
		
		ff = sa..""..as..""..ss..""..dd
		for k,v in ipairs(advertisementMessages) do
			local found = string.find(string.lower(ff), "%s" .. tostring(v))
			local found2 = string.find(string.lower(ff), tostring(v) .. "%s")
			if (found) or (found2) or (string.lower(ff)==tostring(v)) then
				exports.global:sendMessageToAdmins("AdmWrn: " .. tostring(getPlayerName(source)) .. " arabam reklam verirken tehlikeli kelimelere rastlandı.")
				exports.global:sendMessageToAdmins("AdmWrn: Reklam mesajı: " .. tostring(ff))
				outputChatBox("[-]#ffffff Reklam verirken hatalı kelimelere rastlandı, silip tekrar reklam atınız.", source, 255, 0, 0, true)
				return
			end
		end
		
	if exports.global:hasMoney(source, 5000) then
		exports.global:takeMoney(source,5000)
		local playerItems = exports["items"]:getItems(source)
		local phoneNumber = "-"
		for index, value in ipairs(playerItems) do
			if value[1] == 2 then
				phoneNumber = value[2]
			end
		end	
		outputChatBox("[+] #FFFFFFİlanın Discord Adresinde Paylaşıldı.",source,0,255,0,true)
	exports["odrin-discord"]:sendMessage("arabam","**-------------------------------------------------------**\n** Satılık "..sa.."**\n\n**Satıcı:** "..getPlayerName(source).."\n\n**İletişim Bilgileri:** "..phoneNumber.."\n\n**Araba hakkında detaylı bilgi:** "..as.."\n\n**Araba Fiyatı:** "..ss.."₺\n\n**Araba Resmi:** "..dd.."\n**-------------------------------------------------------**")
	end



end
addEvent("arabamdc", true)
addEventHandler("arabamdc", root, arabamdc)