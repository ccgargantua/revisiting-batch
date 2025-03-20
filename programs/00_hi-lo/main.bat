@echo off

echo Welcome%! Try to guess the number I am thinking of!

echo What range do you want me to use%?
set /p lowerBounds=Type the lower bound: 
:tooLowLoop
	set /p upperBounds=Now type the upper bound: 
	if %upperBounds% LEQ %lowerBounds% (
		echo Nice try, the upper bound needs to be higher than the lower bound%!
		goto tooLowLoop
	)

set /a randomness=(%RANDOM% * %RANDOM% + (%RANDOM% %% %RANDOM%)) / %RANDOM%

set /a answer=(%randomness% %% (upperBounds - lowerBounds + 1)) + lowerBounds
echo I am thinking of a number between %lowerBounds% and %upperBounds%...

set /a numGuesses=0
:guessLoop
	set /a numGuesses=(%numGuesses% + 1)
	set /p guess=Guess: 
	if %guess% LSS %answer% (
		echo Higher%!
		goto guessLoop
	) else (
		if %guess% GTR %answer% (
			echo Lower%!
			goto guessLoop
		)
	)

echo Awesome, you won! And it only took you %numGuesses% guess, too!
