-- Title: PhysicsAndCollisions
-- Name: Abisha Jesudas
-- Course: ICS2O/3C
-- This program...
------------------------------------------------------------------------
-- remove the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("physics")

-- start physics
physics.start()
-----------------------------------------------------------------------
--Objects
-----------------------------------------------------------------------
-- Ground
local ground = display.newImage("Images/ground.png", 0, 0)
    ground.x = display.contentWidth/2
    ground.y = display.contentHeight( 0, 1024)

    -- Change the width to be the same as the screen
    ground.width = contentWidth

    -- Add to physics 
    physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

-----------------------------------------------------------------------
-- display the image of the beam
local beam = display.newImage("beam.png", 0, 50)

    -- set the x and y position
    beam.x = display.contentCenterX/5
    beam.y = display.contentCenterY*1.65

    beam.x = display.contentWidth/2
    beam.y = display.contentHeight/1

    -- rotate the beam-60 degrees so its tilt is on an angle
    beam:rotate(45)

    -- send it so that the back layer
    beam:toBack()

    -- add to physics
    physics.addBody(beam, "static", {friction=0.5, bounce=0.3})

    -- create bkg
    local bkg = display.newImage("physics/bkg.png", 0, 0)

   -- set the x and y position
   bkg.x = display.contentCenterX
   bkg.y = display.contentCenterY



   -- send to th eback
   bkg:toBack()

--------------------------------------------------------------------------------
-- FUNCTIONS
--------------------------------------------------------------------------------

-- create the first ball
local function firstball()
	-- creating the first ball
	local ball1 = display.newImage("Physics/super_ball.png", 0, 0)

	-- add to physics 
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=25})
end

--------------------------------------------------------------------------------

local function secondBall()
    local ball2 = display.newImage("Physics/super_ball.png", 0, 0)
    
    -- add to physics 
    physics.addBody(ball2, {density=1.0, friction=0.5, bounce=0.3, radius=25})	
end

--------------------------------------------------------------------------------
--TIMER DELAYS - call each function afetr the given millisecond
--------------------------------------------------------------------------------
timer.preformWithDelay( 0, firstBall)
timer.preformWithDelay( 0, secondBall)

