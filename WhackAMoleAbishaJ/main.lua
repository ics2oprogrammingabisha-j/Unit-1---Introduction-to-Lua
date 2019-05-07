-- Title: WhackAMole
-- Name: Abishs Jesudas
-- Course: ICS2O/3C
-- This program...
-----------------------------------------------------------------------------------------------------
-- remove the status bar
display.setStatusBar(display.HiddenStatusBar)

-- creating the background
local bkg = display.newRect( 0, 0, display.contentWidth, display.contentHeight ) 

    -- set the backgroung color of my screen
     display.setDefault("background", 0, 0, 0) 

    -- Setting the Postion 
    bkg.anchorx = 0
    bkg.anchorY = 0
    bkg.x = 0
    bkg.y = 0

-- Creating a mole
local mole = display.newImage( "Images/mole.png", 0, 0 )

    --  Setting the Positon
    mole.x = display.contentCenterX
    mole.y = display.contentCenterY

    mole:scale(0.3, 0.3)
    mole.isVisible = false

local Score



---------------------------------------------------------------------------------------------------
-- FUNCTIONS
---------------------------------------------------------------------------------------------------

-- This function that makes the mole appear in a random (x,y) position on the screen mole.x = math
-- before calling the function
function PopUp()

	-- Chosing the random Position on th escreen between 0 and the size of the screen
	mole.x = math.random( 0, display.contentWidth )
    mole.y = math.random( 0, display.contentHeight )

    mole.isVisble = true
    timer.perfromWithDelay( 500, mole ) 

end

-- This function calls the PopUp function after 3 seconds
function PopUpDelay()
    timer.perfromWithDelay( 3000, PopUp )
    
    end

-- This Function makes the mole invisible and the calls the PopDelay function
function Hide()

    -- Changing Visibility 
    mole.isVisble = false

    end


-- This function increments the score only if the mole is clicked. It then displays the new score
function GameStart()
    PopUpDelay
    
-- This function increments the score only if the mole is cliked. It then displays the new score.
function Whacked( event )

    -- If the touch phase just started
    if (event.phase == "began") then
        score = score + 1

    end

end

------------------------------------------------------------------------------------------------------
-- EVENT LISTENERS
------------------------------------------------------------------------------------------------------

-- I added the event listener to the moles so that if the mole is touched , the Whaked function is called
mole.addEventListener( "touched", Whacked )

------------------------------------------------------------------------------------------------------

GameStart()
