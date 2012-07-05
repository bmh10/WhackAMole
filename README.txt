Welcome to Dubit's very own Whack-a-mole game. It's a very simple little game designed to let you show off your coding skills. We would like to add a number of simple extensions to this game as numbered below.

You are strongly encouraged to add any comments about your implementation of a feature to the related section, explaining your reasoning and any difficulties you encountered. Have the best go you can at at least tasks 1-4, and send us the repository when you are done. Feel free to play around, refactor stuff as you see fit, and embellish the project with cool stuff.

The project was created with Flash Builder, but can be compiled using mxmlc without issue. You'll need the Flex 4.1 SDK.

Thanks, and good luck!



1. Add a game over/scores screen
--------------------------------

This should appear after the game is over and the moles have stopped appearing. It should contain text telling the player the game is over and a label displaying the player's score.

It should also include a button labelled 'Play again' that will start a new game for the player



Your comments: To make the game over screen I made a GameOverView class in the View folder which manages the display of the game over screen. I also added the method loadGameOver(score:int) to WackAMoleBase.as which is called when the timer runs out during a game. The score from the game is passed into the GameOver view so that it can be displayed to the player. The main difficulties I encountered were to do with how the project is structured and getting used the the MVC design pattern and also learning how ActionScript works.



2. Add difficulty levels
------------------------

Modify the Introduction screen to allow the user to choose one of three difficulty levels: easy, medium and hard. Make the main game easier or more difficult based on the user's choice. The difficulty level should modify both the rate at which the moles appear and the time they spend on screen before disappearing.



Your comments: I made a static integer called 'difficulty' in the MainGame class. In the IntroductionViewBase class there are methods which are called when a difficulty is selected to start the appropriate game. For example, if the user selects 'easy' the method 'onEasyButtonClick()' is called which sets the difficulty to 0 then loads a new game. While the main game is loading I call a method called difficultySetup() which sets the rate at which moles appear and the time they spend on the screen depending on the current difficulty level. In the Mole class I then ensured that the 'showtime' for each mole was the show time set in the Main Game class.



3. Add new types of mole
------------------------

Currently there is only one type of mole that uses the standard_mole.png asset. Create two more types of mole with the following properties:

Fire Mole
  Points awarded for killing: 100
  Time showing on screen (ms): 1800
  Asset to use: fire_mole.png
  Number of clicks required to kill: 2

Zombie Mole
  Points awarded for killing: 400
  Time showing on screen (ms): 1200
  Asset to use: zombie_mole.png
  Number of clicks required to kill: 3

When spawning a new mole, have a 60% chance of creating a standard mole, a 25% chance of creating a fire mole, and a 15% chance of creating a zombie mole.



Your comments: I wanted to make the Mole class abstract then have concerte implementations of each type of mole extending the abstract class however abstract classes not supported by ActionScript (or at least I could not find a suitable method of implementing them). Instead I just kept one Mole class and wrote a setup method for each type of Mole. On initialization a random number is used to randomly generate a certain type of Mole, with each type being generated with the probabilities stated above. I modified the hit() method so that a mole only dies when the number of hits required to kill it has been achieved or surpassed. The mole images for each type are loaded in the MoleHoleItemRendered.mxml class and are set to visible only when the mole in a mole hole has a type which matches a specific image.



4. Build in achievements/awards
-------------------------------

This task requires creating a feature from scratch, and as such it gives you the most freedom to decide how to accomplish it.

Acheivements have become a standard feature of games over the past few years. They are awarded to the player when they meet a certain set of criteria. For example, the user might be awarded an achievement for breaking a score threshold for the first time. Add the following acheivements into the game, and have them appear in the section titled 'Achievements' to the right of the main game area:


Achievement name: Apprentice
Criteria required: Kill over 15 moles during a single game 

Achievement name: Master
Criteria required: Kill more than 40 zombie moles in a single game

Achievement name: Mole massacre
Criteria required: Kill over 55 moles during a game

Achievement name: Fireman
Criteria required: Kill more than 10 fire moles in a single game

Achievement name: Apocolyptica
Criteria required: Kill more than 5 zombie moles in a game

Achievement name: Soft touch
Criteria required: Miss more than 30 moles during a game



Your comments: I created a new class called Achievements which contains a static boolean for each achievement. At the end of each game in the onGameTimerComplete() method I call achievements.checkAchievements() which uses the stats collected in that game to check if any achievements have been won. I could have put the checkAchievements() method in the MainGame class however I felt it best to keep most of the code to do with achievements in the same class. Once an achievement has been won the player keeps it even when a new game is started. In MainGame I use various variables to store game stats. All statistics are updated in the MoleHole class. Stats to do with number of moles killed are updated in the hit() method and the statistic which counts the number of moles missed is updated in onShowTimerComplete(). At the start of each new game the stat counters are reset to zero.
In MainGameView.mxml green ticks are embedded next to each achievement but they are only visible once the achievement has been unlocked.

N.B. Not sure if there is meant to be a difference between 'during a single game' and 'in a game' so assumed they mean the same thing.
Also the Master achievement is probably impossible to achieve as in an average game of 60 moles only 9 will be zombie moles.


--Additional features--

 - Menu system - implemented a small menu system which changes state depending on which option is chosen. This is implemented in IntroductionViewBase and uses a menu index to keep track of the menu state.

 - Used images as buttons - implemented in IntroductionView.mxml and other places. Used 'upSkin' and 'overSkin' attributes to change appearance of button when user hovers over it. Also used 'visible' attribute to ensure button is only drawn when required.

 - Added a mole countdown in main game - this is updated in the function onGameTimer() in the MainGame class.

 - Added colours and gradient fills - implemented in the .mxml view files.

 - Added sound and ability to enable/disable it in main menu.


