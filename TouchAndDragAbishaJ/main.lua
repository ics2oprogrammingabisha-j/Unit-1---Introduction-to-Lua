-- Title: TouchAndDrag
-- Name: Abisha Jesudas
-- Course: ICS2O/3C
-- This program displays images that react to a person's finger.

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- local Varibles. I am still trying to get the x-value to be set properly
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)
local Girl1 = display.newImageRect("Images/Girl1.png", 150, 150)
local Girl1Width = Girl1.width
local Girl1Height = Girl1.height 

local Girl2 = display.newImageRect("Images/Girl2.png", 150, 150)
local Girl2Width = Girl2.width
local Girl2Height = Girl2.height

-- my boolean variables to keep track of which object I touched first
local alreadyTouchedGirl1 = false
local alreadyTouchedGirl2 = false 

-- set the initial xand y position of myImage
Girl1.x = 400
Girl1.y = 500

Girl2.x = 300
Girl2.y = 200

-- Function: Girl2Listener
-- Input: touch listener
-- Output: none 
-- Description: when blue girl is touched, move her 
local function Girl1Listener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedGirl1 == false) then
			  alreadyTouchedGirl2 = true
     end 
	end

    if ( (touch.phase == "moved") and (alreadyTouchedGirl2 == true) ) then
       Girl2.x = touch.x
       Girl2.y = touch.y
    end
    
    if (touch.phase == "ended") then
        alreadyTouchedGirl1 = false
        alreadyTouchedGirl1 = false
    end
end

-- add the respective listeners to each object
Girl2:addEventListener("touch", Girl2Listener)  
Girl1:addEventListener("touch", Girl1Listener)     