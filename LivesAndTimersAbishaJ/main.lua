-- Title: LivesAndTimers
-- Name: Your Name
-- Course: ICS2O/3C
-- This program...
 
 -- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 102/255, 255/255, 255/255)

---------------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
---------------------------------------------------------------------------------------------------

-- create local variables
local questionObject
local correctObject
local incorrectObject
local NumericTextField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer
local incorrectAnswer

-- variables for the timer
local totalSeconds = 15
local secondsLeft = 15
local clockText
local countDownTimer

local lives = 3
local heart1 
local heart2
local heart3

---------------------------------------------------------------------------------------------------
--SOUNDS
---------------------------------------------------------------------------------------------------

-- Correct sound
local correctSound = audio.loadSound( "Sounds/correctSound.mp3" ) -- Setting a variable to an mp3 file
local correctSoundChannel

---------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------------------------------------------------------

local function UpdateTime()

	-- decrement the number of seconds
	secondsLeft = secondsLeft - 1

	-- display the number of seconds left in the clock object
	clockText.text = secondsLeft .. ""

	if (secondsLeft == 0 ) then
		-- reset the number of seconds left in the clock object
		secondsLeft = totalSeconds
		lives = lives - 1

		-- *** IF THERE ARE NO MORE LIVES LEFT, PLAY A LOSE SOUND, SHOWA YOU LOSE IMAGE
		-- AND CANCEL THE TIMER REMOVE THE THRID HEART BY MAKING IT INVISIBLE
		if (lives == 2) then
			heart2.isVisible = false
		elseif (lives == 1) then
			heart1.isVisible = false
		end

		-- *** CALL THE FUNCTION TO ASK A NEW QUESTION

	end
end

-- function that calls the timer
local function StartTimer()
	-- ceate a countdown timer that loops infinetly
	countDownTimer = timer.performWithDelay( 1000, UpdateTime, 0)
end

-------------------------------------------------------------------------------------------------

local function AskQuestion()
	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(0, 20)
	randomNumber2 = math.random(0, 20)

	correctAnswer = randomNumber1 + randomNumber2

	-- create question in text object 
	questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = " 

end

local function HideCorrect()
	correctObject.isVisible = false
	incorrectObject.isVisible = false
	AskQuestion()

end

local function HideIncorrect()
	incorrectObject.isVisible = false
	correctObject.isVisible = false
	AskQuestion()

end

local function NumericFieldListener( event )

	-- User begins editing "NumericField"
	if ( event.phase == "began" ) then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

	    -- when the answer is submitted (eneter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if tye users answer and the correct answer are the same:
		if (userAnswer == correctAnswer) then 
			correctObject.isVisible = true

			correctSoundChannel = audio.play(correctSound)
			
			incorrectObject.isVisible = false
			timer.performWithDelay(2000, HideCorrect)

		else 
			incorrectObject.isVisible = true
			correctObject.isVisible = false
			timer.performWithDelay(2000, HideIncorrect)
		end
	end
end

-----------------------------------------------------------------------------------------------------
--OBJECT CREATION
-----------------------------------------------------------------------------------------------------

-- create the lives to display on the screen
heart2 = display.newImageRect("Images/heart.png", 100, 100)
heart2.x = display.contentWidth * 7 / 8
heart2.y = display.contentHeight * 1 / 7

heart1 = display.newImageRect("Images/heart.png", 100, 100)
heart1.x = display.contentWidth * 6 / 8 
heart1.y = display.contentHeight * 1 / 7

heart3 = display.newImageRect("Images/heart.png", 100, 100)
heart3.x = display.contentWidth * 5 / 8
heart3.y = display.contentHeight * 1 / 7

-- display a question and sets the colour 
questionObject = display.newText( "", display.contentWidth/3, display.contentHeight/2, nil, 50 )
questionObject:setTextColor(0/255, 0/255, 0/355)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
correctObject:setTextColor(255/255, 0/255, 255/255)
correctObject.isVisible = false

incorrectObject = display.newText( "Incorrect!", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
incorrectObject:setTextColor(178/255, 102/255, 255/255)
incorrectObject.isVisible = false

-- ceate TextObject 
clockText = display.newText( "", display.contentWidth/2, display.contentHeight*2/3, nil, 50 )
clockText:setTextColor(0/255, 0/255, 0/255)
clockText.isVisible = true

-- Create numeric feild 
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

--add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

------------------------------------------------------------------------------------------------------
--FUNCTION CALLS
------------------------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()
StartTimer()
