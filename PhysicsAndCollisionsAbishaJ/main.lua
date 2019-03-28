-- Title: PhysicsAndCollisions
-- Name: Abisha Jesudas
-- Course: ICS2O/3C
-- This program...

-- remove the status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics
local physics = require("phisics")

-- start physics
phisics.start()
-----------------------------------------------------------------------
--Objects
-----------------------------------------------------------------------
-- Ground
local ground = display.newImage("Images/ground.png", 0, 0)

-- Change the width to be the same as the screen
ground.width = contentWidth

-- Add to physics 
physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

-----------------------------------------------------------------------


-- set the x and y position
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65