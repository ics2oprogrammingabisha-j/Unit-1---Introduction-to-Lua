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

local Girl3 = display.newImageRect("Images/Girl3.png", 150, 150)
local Girl3Width = Girl3.width
local Girl3Height = Girl3.height
-- my boolean variables to keep track of which object I touched first
local alreadyTouchedGirl1 = false
local alreadyTouchedGirl2 = false 

-- set the initial xand y position of myImage
Girl1.x = 500
Girl1.y = 550

Girl2.x = 200
Girl2.y = 200

Girl3.x = 750
Girl3.y = 210

-- Function: Girl2Listener
-- Input: touch listener
-- Output: none 
-- Description: when blue girl is touched, move her 
local function Girl1Listener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedGirl2 == false) then
			  alreadyTouchedGirl1 = true
     end 
	end

    if ( (touch.phase == "moved") and (alreadyTouchedGirl1 == true) ) then
       Girl1.x = touch.x
       Girl1.y = touch.y
    end
    
    if (touch.phase == "ended") then
        alreadyTouchedGirl1 = false
        alreadyTouchedGirl2 = false
    end
end

local function Girl2Listener(touch)

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
        alreadyTouchedGirl2 = false

    end
  if (touch.phase == "began") then
    if (alreadyTouchedGirl1 == false) then
        alreadyTouchedGirl2 = true
     end 
  end

    if ( (touch.phase == "moved") and (alreadyTouchedGirl3 == true) ) then
       Girl3.x = touch.x
       Girl3.y = touch.y
    end
    
    if (touch.phase == "ended") then
        alreadyTouchedGirl1 = true
        alreadyTouchedGirl2 = true
    end

end

-- add the respective listeners to each object  
Girl1:addEventListener("touch", Girl1Listener)
Girl2:addEventListener("touch", Girl2Listener)
Girl3:addEventListener("touch", Girl3Listener)