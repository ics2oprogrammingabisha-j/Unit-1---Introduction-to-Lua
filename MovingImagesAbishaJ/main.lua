-- Title: MovingObjects
-- Name: Abisha Jesudas
-- Course: ICS2O/3C
-- This program moves a beetleship across the screen and then makes it fade out.
-- I added another object that moves in a different direction as well as a backgrond image 

-- hide the status bar 
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- charecter image width and height 
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 6

-- set the initial x and y postion of bettleship
beetleship.x = 0
beetleship.y = display.contentHeight/3 

-- function: Moveship 
-- Input: this function accepts an event listener
-- Output none 
-- Description : this funtion adds the srroll speed to the x-value of the ship 
local function Moveship(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out.
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveShip)

-- global variables
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- charecter image width and height 
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 6

-- set the initial x and y postion of bettleship
beetleship.x = 0
beetleship.y = display.contentHeight/3 

-- function: Moveship 
-- Input: this function accepts an event listener
-- Output none 
-- Description : this funtion adds the srroll speed to the x-value of the ship 
local function Moveship(event)
	-- add the scroll speed to the x-value of the ship
	beetleship.x = beetleship.x + scrollSpeed
	-- change the transparency of the ship every time it moves so that it fades out.
end



