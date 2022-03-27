local localPlayer = getLocalPlayer()

questionsBike = { 
	{"Yolun hangi tarafından gitmelisiniz?", "Sol", "Sağ", "Yukardakilerden hepsi.", 2},
	{"Güvenlik ekipmanları(örneğin;Kask) kullanmanın amacı nedir?", "Havalı görünmek.", "Korunmak.", "Dikkat çekmek.", 2},
	{"Kamyonların kör noktası neresidir:", "Gövdenin hemen arkası.", "Kabinin hemen solu.", "Yukarıdakilerden hepsi." , 3},
	{"Trafik levhaları genellikle hangi renkte olur?", "Yeşil.", "Mavi.", "Kırmızı." , 3},
	{"Bir motorsikletin trafiğe çıkabilmesi için en az kaç CC motoru olması gerekmektedir?", "50cc", "125cc", "250cc" , 1},
	{"Duble yollarda sürücü hangi şeritte gitmelidir?", "Herhangi bir şeritte.", "Sol şeritte.", "Sağ şeritte sürüp, sollama yapmak için değiştirmelidir.", 3},
	{"Keskin viraja yavas girilmesinin sebebi nedir?", "Lastikleri korumak icin.", "Onunu gorebilmen icin.", "Eger yolda birisi varsa diye durmak icin.", 3},
	{"Kasklar ne için üretilmiştir?", "Havalı stickerlar yapıştırmak için.", "Yüzünüzü polisten saklamak için", "Başınızı korumak için." , 3},
	{"Bir yangin musluguna kac feet yakinda parkedemezsin?", "10 feet", "15 feet", "20 feet", 2},
	{"Aşağıdakilerden hangi motor büyüklüğündeki bir aracı kullanmak için ehliyet gerekmemektedir?", "50cc", "125cc", "250cc" , 1},
}

guiIntroLabel1B = nil
guiIntroProceedButtonB = nil
guiIntroWindowB = nil
guiQuestionLabelB = nil
guiQuestionAnswer1RadioB = nil
guiQuestionAnswer2RadioB = nil
guiQuestionAnswer3RadioB = nil
guiQuestionWindowB = nil
guiFinalPassTextLabelB = nil
guiFinalFailTextLabelB = nil
guiFinalRegisterButtonB = nil
guiFinalCloseButtonB = nil
guiFinishWindowB = nil

-- variable for the max number of possible questions
local NoQuestions = 10
local NoQuestionToAnswer = 7
local correctAnswers = 0
local passPercent = 50
		
selection = {}

-- functon makes the intro window for the quiz
function createlicenseBikeTestIntroWindow()
	showCursor(true)
	local screenwidth, screenheight = guiGetScreenSize ()
	
	local Width = 450
	local Height = 200
	local X = (screenwidth - Width)/2
	local Y = (screenheight - Height)/2
	
	guiIntroWindowB = guiCreateWindow ( X , Y , Width , Height , "Motor Yazılı Sınavı" , false )
	
	guiCreateStaticImage (0.35, 0.1, 0.3, 0.2, "banner.png", true, guiIntroWindowB)
	
	guiIntroLabel1B = guiCreateLabel(0, 0.3,1, 0.5, [[Motosiklet yazılı sınavına katılacaksınız.
Temel sürüş teorisi hakkında 7 soru sorulacaktır. Sınavı geçmek için
en az %50 puan almanız gerekmektedir.

Bol Şanslar.]], true, guiIntroWindowB)
	
	guiLabelSetHorizontalAlign ( guiIntroLabel1B, "center", true )
	guiSetFont ( guiIntroLabel1B,"default-bold-small")
	
	guiIntroProceedButtonB = guiCreateButton ( 0.4 , 0.75 , 0.2, 0.1 , "Start Test" , true ,guiIntroWindowB)
	
	addEventHandler ( "onClientGUIClick", guiIntroProceedButtonB,  function(button, state)
		if(button == "left" and state == "up") then
		
			-- start the quiz and hide the intro window
			startLicenceBikeTest()
			guiSetVisible(guiIntroWindowB, false)
		
		end
	end, false)
	
end

-- done bike up to here

-- function create the question window
function createBikeLicenseQuestionWindow(number)

	local screenwidth, screenheight = guiGetScreenSize ()
	
	local Width = 450
	local Height = 200
	local X = (screenwidth - Width)/2
	local Y = (screenheight - Height)/2
	
	-- create the window
	guiQuestionWindowB = guiCreateWindow ( X , Y , Width , Height , "Soru: "..number.." / "..NoQuestionToAnswer , false )
	
	guiQuestionLabelB = guiCreateLabel(0.1, 0.2, 0.9, 0.2, selection[number][1], true, guiQuestionWindowB)
	guiSetFont ( guiQuestionLabelB,"default-bold-small")
	guiLabelSetHorizontalAlign ( guiQuestionLabelB, "left", true)
	
	
	if not(selection[number][2]== "nil") then
		guiQuestionAnswer1RadioB = guiCreateRadioButton(0.1, 0.4, 0.9,0.1, selection[number][2], true,guiQuestionWindowB)
	end
	
	if not(selection[number][3] == "nil") then
		guiQuestionAnswer2RadioB = guiCreateRadioButton(0.1, 0.5, 0.9,0.1, selection[number][3], true,guiQuestionWindowB)
	end
	
	if not(selection[number][4]== "nil") then
		guiQuestionAnswer3RadioB = guiCreateRadioButton(0.1, 0.6, 0.9,0.1, selection[number][4], true,guiQuestionWindowB)
	end
	
	-- if there are more questions to go, then create a "next question" button
	if(number < NoQuestionToAnswer) then
		guiQuestionNextButtonB = guiCreateButton ( 0.4 , 0.75 , 0.2, 0.1 , "Sıradaki Soru" , true ,guiQuestionWindowB)
		
		addEventHandler ( "onClientGUIClick", guiQuestionNextButtonB,  function(button, state)
			if(button == "left" and state == "up") then
				
				local selectedAnswer = 0
			
				-- check all the radio buttons and seleted the selectedAnswer variabe to the answer that has been selected
				if(guiRadioButtonGetSelected(guiQuestionAnswer1RadioB)) then
					selectedAnswer = 1
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer2RadioB)) then
					selectedAnswer = 2
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer3RadioB)) then
					selectedAnswer = 3
				else
					selectedAnswer = 0
				end
				
				-- don't let the player continue if they havn't selected an answer
				if(selectedAnswer ~= 0) then
					
					-- if the selection is the same as the correct answer, increase correct answers by 1
					if(selectedAnswer == selection[number][5]) then
						correctAnswers = correctAnswers + 1
					end
				
					-- hide the current window, then create a new window for the next question
					guiSetVisible(guiQuestionWindowB, false)
					createBikeLicenseQuestionWindow(number+1)
				end
			end
		end, false)
		
	else
		guiQuestionSumbitButtonB = guiCreateButton ( 0.4 , 0.75 , 0.3, 0.1 , "Cevapları Gönder" , true ,guiQuestionWindowB)
		
		-- handler for when the player clicks submit
		addEventHandler ( "onClientGUIClick", guiQuestionSumbitButtonB,  function(button, state)
			if(button == "left" and state == "up") then
				
				local selectedAnswer = 0
			
				-- check all the radio buttons and seleted the selectedAnswer variabe to the answer that has been selected
				if(guiRadioButtonGetSelected(guiQuestionAnswer1RadioB)) then
					selectedAnswer = 1
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer2RadioB)) then
					selectedAnswer = 2
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer3RadioB)) then
					selectedAnswer = 3
				elseif(guiRadioButtonGetSelected(guiQuestionAnswer4RadioB)) then
					selectedAnswer = 4
				else
					selectedAnswer = 0
				end
				
				-- don't let the player continue if they havn't selected an answer
				if(selectedAnswer ~= 0) then
					
					-- if the selection is the same as the correct answer, increase correct answers by 1
					if(selectedAnswer == selection[number][5]) then
						correctAnswers = correctAnswers + 1
					end
				
					-- hide the current window, then create the finish window
					guiSetVisible(guiQuestionWindowB, false)
					createBikeTestFinishWindow()


				end
			end
		end, false)
	end
end


-- funciton create the window that tells the
function createBikeTestFinishWindow()

	local score = math.floor((correctAnswers/NoQuestionToAnswer)*100)

	local screenwidth, screenheight = guiGetScreenSize ()
		
	local Width = 450
	local Height = 200
	local X = (screenwidth - Width)/2
	local Y = (screenheight - Height)/2
		
	-- create the window
	guiFinishWindowB = guiCreateWindow ( X , Y , Width , Height , "Sınav Sonu.", false )
	
	if(score >= passPercent) then
	
		guiCreateStaticImage (0.35, 0.1, 0.3, 0.2, "pass.png", true, guiFinishWindowB)
	
		guiFinalPassLabelB = guiCreateLabel(0, 0.3, 1, 0.1, "Tebrikler! Sınavın bu kısmını başarıyla geçtiniz.", true, guiFinishWindowB)
		guiSetFont ( guiFinalPassLabelB,"default-bold-small")
		guiLabelSetHorizontalAlign ( guiFinalPassLabelB, "center")
		guiLabelSetColor ( guiFinalPassLabelB ,0, 255, 0 )
		
		guiFinalPassTextLabelB = guiCreateLabel(0, 0.4, 1, 0.4, "Sınavdan %"..score.." aldınız, sınavı geçmek için gereken %"..passPercent..". Tebrikler!" ,true, guiFinishWindowB)
		guiLabelSetHorizontalAlign ( guiFinalPassTextLabelB, "center", true)
		
		guiFinalRegisterButtonB = guiCreateButton ( 0.35 , 0.8 , 0.3, 0.1 , "Devam Et" , true ,guiFinishWindowB)
		
		-- if the player has passed the quiz and clicks on register
		addEventHandler ( "onClientGUIClick", guiFinalRegisterButtonB,  function(button, state)
			if(button == "left" and state == "up") then
				-- set player date to say they have passed the theory.
				

				initiateBikeTest()
				-- reset their correct answers
				correctAnswers = 0
				toggleAllControls ( true )
				triggerEvent("onClientPlayerWeaponCheck", source)
				--cleanup
				destroyElement(guiIntroLabel1B)
				destroyElement(guiIntroProceedButtonB)
				destroyElement(guiIntroWindowB)
				destroyElement(guiQuestionLabelB)
				destroyElement(guiQuestionAnswer1RadioB)
				destroyElement(guiQuestionAnswer2RadioB)
				destroyElement(guiQuestionAnswer3RadioB)
				destroyElement(guiQuestionWindowB)
				destroyElement(guiFinalPassTextLabelB)
				destroyElement(guiFinalRegisterButtonB)
				destroyElement(guiFinishWindowB)
				guiIntroLabel1B = nil
				guiIntroProceedButtonB = nil
				guiIntroWindowB = nil
				guiQuestionLabelB = nil
				guiQuestionAnswer1RadioB = nil
				guiQuestionAnswer2RadioB = nil
				guiQuestionAnswer3RadioB = nil
				guiQuestionWindowB = nil
				guiFinalPassTextLabelB = nil
				guiFinalRegisterButtonB = nil
				guiFinishWindowB = nil
				
				correctAnswers = 0
				selection = {}
				
				showCursor(false)
			end
		end, false)
		
	else -- player has failed, 
	
		guiCreateStaticImage (0.35, 0.1, 0.3, 0.2, "fail.png", true, guiFinishWindowB)
	
		guiFinalFailLabelB = guiCreateLabel(0, 0.3, 1, 0.1, "Üzgünüz, sınavı geçemediniz.", true, guiFinishWindowB)
		guiSetFont ( guiFinalFailLabelB,"default-bold-small")
		guiLabelSetHorizontalAlign ( guiFinalFailLabelB, "center")
		guiLabelSetColor ( guiFinalFailLabelB ,255, 0, 0 )
		
		guiFinalFailTextLabelB = guiCreateLabel(0, 0.4, 1, 0.4, "Sınavdan %"..math.ceil(score).." aldınız, sınav geçme puanı %"..passPercent.."." ,true, guiFinishWindowB)
		guiLabelSetHorizontalAlign ( guiFinalFailTextLabelB, "center", true)
		
		guiFinalCloseButtonB = guiCreateButton ( 0.2 , 0.8 , 0.25, 0.1 , "Kapat" , true ,guiFinishWindowB)
		
		-- if player click the close button
		addEventHandler ( "onClientGUIClick", guiFinalCloseButtonB,  function(button, state)
			if(button == "left" and state == "up") then
				destroyElement(guiIntroLabel1B)
				destroyElement(guiIntroProceedButtonB)
				destroyElement(guiIntroWindowB)
				destroyElement(guiQuestionLabelB)
				destroyElement(guiQuestionAnswer1RadioB)
				destroyElement(guiQuestionAnswer2RadioB)
				destroyElement(guiQuestionAnswer3RadioB)
				destroyElement(guiQuestionWindowB)
				destroyElement(guiFinalPassTextLabelB)
				destroyElement(guiFinalRegisterButtonB)
				destroyElement(guiFinishWindowB)
				guiIntroLabel1B = nil
				guiIntroProceedButtonB = nil
				guiIntroWindowB = nil
				guiQuestionLabelB = nil
				guiQuestionAnswer1RadioB = nil
				guiQuestionAnswer2RadioB = nil
				guiQuestionAnswer3RadioB = nil
				guiQuestionWindowB = nil
				guiFinalPassTextLabelB = nil
				guiFinalRegisterButtonB = nil
				guiFinishWindowB = nil
				
				selection = {}
				correctAnswers = 0
				
				showCursor(false)
			end
		end, false)
	end
	
end
 
 -- function starts the quiz
 function startLicenceBikeTest()
 
	-- choose a random set of questions
	chooseBikeTestQuestions()
	-- create the question window with question number 1
	createBikeLicenseQuestionWindow(1)
 
 end
 
 
 -- functions chooses the questions to be used for the quiz
 function chooseBikeTestQuestions()
 
	-- loop through selections and make each one a random question
	for i=1, 10 do
		-- pick a random number between 1 and the max number of questions
		local number = math.random(1, NoQuestions)
		
		-- check to see if the question has already been selected
		if(testBikeQuestionAlreadyUsed(number)) then
			repeat -- if it has, keep changing the number until it hasn't
				number = math.random(1, NoQuestions)
			until (testBikeQuestionAlreadyUsed(number) == false)
		end
		
		-- set the question to the random one
		selection[i] = questionsBike[number]
	end
 end
 
 
 -- function returns true if the queston is already used
 function testBikeQuestionAlreadyUsed(number)
 
	local same = 0
 
	-- loop through all the current selected questions
	for i, j in pairs(selection) do
		-- if a selected question is the same as the new question
		if(j[1] == questionsBike[number][1]) then
			same = 1 -- set same to 1
		end
		
	end
	
	-- if same is 1, question already selected to return true
	if(same == 1) then
		return true
	else
		return false
	end
 end

---------------------------------------
------ Practical Driving Test ---------
---------------------------------------
 
testBikeRoute = {
	{ 2559.6176757812, -2579.8041992188, 13.62343788147 },	-- Start, DoL Parking 
	{ 2536.4482421875, -2604.6884765625, 13.397678375244 },	-- San Andreas Boulevard DoL near Exit
	{ 2536.09375, -2644.3095703125, 14.54719543457 }, -- San Andreas Boulevard DoL Exiting turning left
	{ 2538.7724609375, -2688.1630859375, 13.398153305054 }, 	-- Constituion Ave
	{ 2571.70703125, -2688.0849609375, 13.398476600647 }, -- Constituion Ave, turn to St. Lawrence Blvd
	{ 2597.3779296875, -2687.5146484375, 13.39723777771 }, -- 5pavlov
	{ 2599.046875, -2672.0283203125, 13.397356033325 }, 	-- St. Lawrence Blvd, going to Panopticon Ave
	{ 2606.3046875, -2661.958984375, 13.398233413696 }, 	-- saglı sollu 1
	{ 2600.7138671875, -2654.2685546875, 13.398015975952 }, 	-- saglı sollu 2
	{ 2606.63671875, -2647.7724609375, 13.396721839905 },	-- saglı sollu 3
	{ 2600.052734375, -2641.3037109375, 13.3980751037 },	-- saglı sollu 4
	{ 2606.4248046875, -2635.88671875, 13.398281097412 },	-- saglı sollu 5 son
	{ 2597.103515625, -2625.8173828125, 13.397064208984 },		-- St. Lawrence Blvd
	{ 2591.6962890625, -2667.6953125, 13.39767742157 },	-- Turning on to City Hall Road
	{ 2598.181640625, -2685.466796875, 13.397680282593 },	-- City Hall Road
	{ 2585.4892578125, -2687.453125, 13.398679733276 },	-- City Hall Road
	{ 2578.302734375, -2669.287109375, 13.398906707764 },	-- City Hall Road
	{ 2549.9560546875, -2666.3232421875, 13.399152755737 },	-- City Hall Road
	{ 2557.4111328125, -2676.5302734375, 13.420404434204 },	-- gerigeri 1
	{ 2557.564453125, -2667.9130859375, 13.398354530334 },	-- City Hall Road
	{ 2548.744140625, -2649.8046875, 13.398368835449 }, 	-- City Hall Road turning towards IGS
	{ 2548.8486328125, -2629.9482421875, 13.397291183472 }, 	-- 
	{ 2553.2548828125, -2649.25, 13.398552894592 }, 	-- 
	{ 2548.759765625, -2638.748046875, 13.397624015808 }, 	-- IGS
	{ 2562.3388671875, -2644.62109375, 13.397414207458 }, 	-- IGS
	{ 2573.1259765625, -2631.1240234375, 13.398529052734 }, -- IGS
	{ 2547.294921875, -2617.466796875, 13.39805316925 }, 			-- Mulholland parking, Turn to East Vinewood Blvd
	{ 2545.4599609375, -2590.330078125, 13.317090034485 },	-- son
}

testBike = { [468]=true } -- Mananas need to be spawned at the start point.

local blip = nil
local marker = nil

function initiateBikeTest()
	triggerServerEvent("theoryBikeComplete", getLocalPlayer())
	local x, y, z = testBikeRoute[1][1], testBikeRoute[1][2], testBikeRoute[1][3]
	blip = createBlip(x, y, z, 0, 2, 0, 255, 0, 255)
	marker = createMarker(x, y, z, "checkpoint", 4, 0, 255, 0, 150) -- start marker.
	addEventHandler("onClientMarkerHit", marker, startBikeTest)
	
	outputChatBox("#FF9933You are now ready to take your practical driving examination. Collect a DoL test bike and begin the route.", 255, 194, 14, true)
	
end

function startBikeTest(element)
	if element == getLocalPlayer() then
		local vehicle = getPedOccupiedVehicle(getLocalPlayer())
		local id = getElementModel(vehicle)
		if not (testBike[id]) then
			outputChatBox("#FF9933You must be riding a DoL test bike when passing through the checkpoints.", 255, 0, 0, true ) -- Wrong  type.
		else
			destroyElement(blip)
			destroyElement(marker)
			
			local vehicle = getPedOccupiedVehicle ( getLocalPlayer() )
			setElementData(getLocalPlayer(), "drivingTest.marker", 2, false)

			local x1,y1,z1 = nil -- Setup the first checkpoint
			x1 = testBikeRoute[2][1]
			y1 = testBikeRoute[2][2]
			z1 = testBikeRoute[2][3]
			setElementData(getLocalPlayer(), "drivingTest.checkmarkers", #testBikeRoute, false)

			blip = createBlip(x1, y1 , z1, 0, 2, 255, 0, 255, 255)
			marker = createMarker( x1, y1,z1 , "checkpoint", 4, 255, 0, 255, 150)
				
			addEventHandler("onClientMarkerHit", marker, UpdateBikeCheckpoints)
				
			outputChatBox("#FF9933You will need to complete the route without damaging the test bike. Good luck and drive safe.", 255, 194, 14, true)
		end
	end
end

function UpdateBikeCheckpoints(element)
	if (element == localPlayer) then
		local vehicle = getPedOccupiedVehicle(getLocalPlayer())
		local id = getElementModel(vehicle)
		if not (testBike[id]) then
			outputChatBox("You must be on a DoL test bike when passing through the check points.", 255, 0, 0) -- Wrong car type.
		else
			destroyElement(blip)
			destroyElement(marker)
			blip = nil
			marker = nil
				
			local m_number = getElementData(getLocalPlayer(), "drivingTest.marker")
			local max_number = getElementData(getLocalPlayer(), "drivingTest.checkmarkers")
			
			if (tonumber(max_number-1) == tonumber(m_number)) then -- if the next checkpoint is the final checkpoint.
				outputChatBox("#FF9933Park your bike at the #FF66CCin the parking lot #FF9933to complete the test.", 255, 194, 14, true)
				
				local newnumber = m_number+1
				setElementData(getLocalPlayer(), "drivingTest.marker", newnumber, false)
					
				local x2, y2, z2 = nil
				x2 = testBikeRoute[newnumber][1]
				y2 = testBikeRoute[newnumber][2]
				z2 = testBikeRoute[newnumber][3]
				
				marker = createMarker( x2, y2, z2, "checkpoint", 4, 255, 0, 255, 150)
				blip = createBlip( x2, y2, z2, 0, 2, 255, 0, 255, 255)
				
				
				addEventHandler("onClientMarkerHit", marker, EndBikeTest)
			else
				local newnumber = m_number+1
				setElementData(getLocalPlayer(), "drivingTest.marker", newnumber, false)
						
				local x2, y2, z2 = nil
				x2 = testBikeRoute[newnumber][1]
				y2 = testBikeRoute[newnumber][2]
				z2 = testBikeRoute[newnumber][3]
						
				marker = createMarker( x2, y2, z2, "checkpoint", 4, 255, 0, 255, 150)
				blip = createBlip( x2, y2, z2, 0, 2, 255, 0, 255, 255)
				
				addEventHandler("onClientMarkerHit", marker, UpdateBikeCheckpoints)
			end
		end
	end
end

function EndBikeTest(element)
	if (element == localPlayer) then
		local vehicle = getPedOccupiedVehicle(getLocalPlayer())
		local id = getElementModel(vehicle)
		if not (testBike[id]) then
			outputChatBox("You must be on a DoL test bike when passing through the check points.", 255, 0, 0)
		else
			local vehicleHealth = getElementHealth ( vehicle )
			if (vehicleHealth >= 800) then
				----------
				-- PASS --
				----------
				outputChatBox("After inspecting the vehicle we can see no damage.", 255, 194, 14)
				triggerServerEvent("acceptBikeLicense", getLocalPlayer())
			
			else
				----------
				-- Fail --
				----------
				outputChatBox("After inspecting the vehicle we can see that it's damage.", 255, 194, 14)
				outputChatBox("You have failed the practical driving test.", 255, 0, 0)
			end
			
			destroyElement(blip)
			destroyElement(marker)
			blip = nil
			marker = nil
		end
	end
end