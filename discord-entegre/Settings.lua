Webhooks = {
	["general"] = {
		link = "https://discord.com/api/webhooks/858813704459517962/hDJftdlKv67czT3wf6R2dnGWWjm5TOfCFhiCoEdRnnD6AiARpkSv3m-vdEA0q9JIi0za",
		avatar = "", -- if u want to empty, enter nil
		username = "44LOG"
	},
	["tweet"] = {
		link = "https://discord.com/api/webhooks/863082054018007068/dN-ieHEsdrEhlJgYEN5ePsAjdcl42QwThDkXUlNJPDePE4L8lpV-bKFJvxVLrjQbaZjT",
		avatar = "", -- if u want to empty, enter nil
		username = "Twitter"
	},
	["ic"] = {
		link = "https://discord.com/api/webhooks/858813831723483149/4w8mrl_tuMkJ8IJ0h8blzzXjcyB-e1CbHmNgmHPqkXtZNs7yJYwQyJxQ4xqG9ESeve1p",
		avatar = "", -- if u want to empty, enter nil
		username = "44IC"
	},
	["ooc"] = {
		link = "https://discord.com/api/webhooks/858814256091103292/1Gy9YZIes6FXDamEia9ghpucjPPcrd6IX10iuwUh2ZD6icfgY7XB97s_yqqKi7-Q7p1I",
		avatar = "", -- if u want to empty, enter nil
		username = "44OOC"
	},
	["oocduyuru"] = {
		link = "https://discord.com/api/webhooks/866760518398902292/XLy6rNhTxmOtX_bNWto0LFrlCx4DS0fEuFHBlMY0qBg54HshMPIFo5ZO9_ltY_3fH1ki",
		avatar = "", -- if u want to empty, enter nil
		username = "Oyun İçi Duyuru"
	},
	["admin-log"] = {
	    link = "https://discord.com/api/webhooks/858814474080354324/inWrieBbLRYVlSdX6AnxXDV0XQzM50c0L7revH9SwvwqniunH3TKRXGiHaFOa5MTPHaMs",
	    avatar = "", -- if u want to empty, enter nil
	    username = "44ADM"
	},
	["twitter"] = {
	    link = "https://discord.com/api/webhooks/841837586904514582/SO9b-vmzz6YXKmL65FpJ5e-Z91jMn1su8tCVn9nnYAt3V6se-ZDOyHHmh4VAZLdoang0",
	    avatar = "", -- if u want to empty, enter nil
	    username = "Twitter"
	},
	["pm"] = {
		link = "https://discord.com/api/webhooks/858814628036870157/hM-TTLmQMoC3ope4PwUuLoJynhRtI5eRbHX-WGW6j5XbFrLAi5PWezC2uoa3E-Cv_93b",
		avatar = "", -- if u want to empty, enter nil
		username = "Pm-log"
	},
	["komut-log"] = {
		link = "https://discord.com/api/webhooks/866761426738348072/mBWn1kjonSR9FBOW4wXgSQARJ_K3yodbCUGWPTyqQ1afFQq8HpTCeCOdg01y0on6E3EY",
		avatar = "", -- if u want to empty, enter nil
		username = "Komut Log"
	},
	["faction"] = {
		link = "https://discord.com/api/webhooks/858814829547880458/EvKF2m6A5v5_Y0DkS7c_N1ARtDMObXbaTeeYWwPYOAXbb-SDrVRMyMg1dHbLHO9FFR9T",
		avatar = "", -- if u want to empty, enter nil
		username = "Faction-log"
	},	
	["arabam"] = {
		link = "https://discord.com/api/webhooks/947482359853379616/nbhnMR9TU6iTLyTzIHX2E0IWQjtMDNF8AHpk4Fx_05tdQAZSBOExDB8ZjRkv5-xHskuf",
		avatar = "", -- if u want to empty, enter nil
		username = "Arabam.COM"
	},	
	["ooc-chat-log"] = {
		link = "https://discord.com/api/webhooks/866761680058843146/47kLCSNkkP2HRElpR4VPxKLKsAHj8PbMbc8P8ylDAT7QuTsz2StORZIoAfqMM2ypQR-Y",
		avatar = "", -- if u want to empty, enter nil
		username = "OOC-Chat-Log"
	},	
	["ahealsethp"] = {
		link = "https://discord.com/api/webhooks/866761835892703293/jwp5J4ecwIWGhLU0lH4vDp6PybjOuOleNiL2990SNSUjdCf6A6d7lYPFYtJHdHr0fBlP",
		avatar = "", -- if u want to empty, enter nil
		username = "AhealSetHP Bot"
	},	
	["medo"] = {
		link = "https://discord.com/api/webhooks/866762041406783528/9S1TIvnkPPnd1T-QO50XXDDsPMNMPMExlUSrxmc7FhPjUXRVheeHcAaiPia_HHV4idma",
		avatar = "", -- if u want to empty, enter nil
		username = "Me Do Emote"
	},	
}

CallbackUtils = {
	Utils.sendChat("general"), -- Chat flow will be transferred on the channel called ["general"]
	Utils.joinQuit("general"),
	Utils.commandFlow("general")
	-- Utils.tweet("general")
}