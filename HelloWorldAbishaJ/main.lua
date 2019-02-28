-----------------------------------------------------------------------------------------
--
-- main.lua
-- Title: HelloWorld
-- Name: Abisha Jesudas
-- Course: ICS2O/3C
-- This program displays Hello to the simulator and to the command terminal.
-----------------------------------------------------------------------------------------

-- print "Hello, World" to the command terminal
print ("***Helloooooooooooooo!")

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background color
display.setDefault("background", 229/255, 204/255, 255/255)

-- create a local variable
local textObject 

-- display text on the screen at positon x = 500 and y = 350 width
-- a default font styleand font size of 60
textObject = display.newText( "Hello, Abisha!", 500, 350, nil, 50 )

-- sets the color to the text
textObject:setTextColor(255/255, 255/255, 255/255)
