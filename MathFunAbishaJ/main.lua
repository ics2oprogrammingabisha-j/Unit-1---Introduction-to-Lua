-- Title: MathFun
-- Name: Your Name
-- Course: ICS2O/3C
-- This program...

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- sets the background colour
display.setDefault("background", 255/255, 178/255, 102/255)

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
local randomOperator

---------------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
---------------------------------------------------------------------------------------------------

local function AskQuestion()

	-- generate a random Operator beetween 1 and 4
	randomOperator = math.random(1,4)

	-- generate 2 random numbers 
	randomNumber1 = math.random(10, 20)
	randomNumber2 = math.random(0, 10)

	-- if random the random Operator is 1 do addition
	if (randomOperator == 1) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber2

		-- create the question in the text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber2 .. " = " 

	-- if the random Operator is 2 then do subtraction
	elseif (randomOperator == 2) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 - randomNumber2

		-- create the question in the text object
		questionObject.text = randomNumber1 .. " - " .. randomNumber2 .. " = " 

    -- if the random Operator is 3 then do multiplication
	elseif (randomOperator == 3) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 * randomNumber2

		-- create the question in the text object
		questionObject.text = randomNumber1 .. " × " .. randomNumber2 .. " = " 

     -- if the random Operator is 4 then do multiplication
	elseif (randomOperator == 4) then

		-- calculate the correct answer
		correctAnswer = randomNumber1 / randomNumber2

		-- create the question in the text object
		questionObject.text = randomNumber1 .. " / " .. randomNumber2 .. " = " 
	end
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


-- Create numeric feild 
numericField = native.newTextField( display.contentWidth/2, display.contentHeight/2, 150, 80)
numericField.inputType = "number"

--add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

------------------------------------------------------------------------------------------------------
--FUNCTION CALLS
------------------------------------------------------------------------------------------------------

-- call thr function to ask the question
AskQuestion()