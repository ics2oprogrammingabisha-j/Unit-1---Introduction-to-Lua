-- Title: MovingObjects
-- Name: Abisha Jesudas
-- Course: ICS2O/3C
-- This program moves a beetleship across the screen and then makes it fade out.
-- I added another object that moves in a different direction as well as a backgrond image 

-- hide the status bar 
display.setStatusBar(display.HiddenStatus)

-- global variables
scrollSpeed = 3

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- charecter image width and height 
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0 

-- set the initial x and y postion of bettleship
bettleship.x = 0
bettleship.y = display.contentHeight/3 

-- function: