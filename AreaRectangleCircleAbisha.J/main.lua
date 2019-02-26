-----------------------------------------------------------------------------------------
-- Title: AreaOfRectangleAndCircle
-- Name: Abisha Jesudas
-- Course: ICS2O/3C
-- This program displayed a colored rectangle with a border of a different color.
-- It also calculates the rectangle's area an displays it on the screen. 
-- Then I added the  code to draw a circle of a given radius that is colored and
-- a border of a different color . I used the radius to calculate the 
-- area an displayed this on the screen. 

-- create my local variables
local areaText
local textsize = 50
local myRectangle
local widthOfRectangle =350
local heightOfRectangle =200
local AreaOfRectangle

-- set the background colour of my screen. Remember hat colors are beetween 0 and 1.
display.setDefault("background", 153/255, 255/255, 204/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0,0, widthOfRectangle, heightOfRectangle) 

-- anchor the rectangle that is the top left corner of the screen and sets its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 20
myRectangle.y = 20

-- set the width of trghe border
myRectangle.strokeWidth = 20

-- set the coulor of the rectangle
myRectangle:setFillColor(255/255, 255/255, 255/255)

-- set the colour of the border
myRectangle:setStrokeColor(0, 0, 0)

--calculate the area 
AreaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen. Take into consideration th e size of the 
-- font when positioning it on the screen
areaText = display.newText("The area of this rectangle wit a width of \n" ..
    widthOfRectangle .. " and a height " .. heightOfRectangle .. " is " ..
    AreaOfRectangle .. " pixels².", 0, 0, Arial, textSize)

-- anchor the text and set its (x,y) position 
areaText.anchorX = 0
areaText.anchorY = 0
areaText.x = 20
areaText.y = display.contentHeight/2

-- set the colour of the newText
areaText:setTextColor(1, 1, 1)

-- draw the circle that half the width and height of the screen size.
myCircle = display.newCircle(0, 0, radiusOfCircle)

-- anchor the rectangle in th etop right corner of the screen and set its (x,y) position 
myCircle.anchorX = 0
myCircle.anchorY = 0
myCircle.x = 700
myCircle.y = 20

-- set th e