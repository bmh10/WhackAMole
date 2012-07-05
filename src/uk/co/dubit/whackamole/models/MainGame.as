package uk.co.dubit.whackamole.models
{
	import flash.events.TimerEvent;
	import flash.events.Event; 
	import flash.utils.Timer;
	
	import mx.collections.ArrayCollection;
	
	import flash.media.Sound;
	import flash.net.URLRequest;
	
	import uk.co.dubit.whackamole.framework.Model;
	import uk.co.dubit.whackamole.models.moles.Mole;

	/**
	 * Contains all the logic for the game itself; controls
	 * the addition of moles, keeps track of the player's
	 * score
	 * 
	 **/
	public class MainGame extends Model
	{
		[Bindable]
		public var moleHoles:ArrayCollection = new ArrayCollection();
		
		[Bindable]
		public var score:int = 0;
		
		//0=easy, 1=medium, 2=hard
		public static var difficulty:int;
		
		//Game stats
		public var achievements:Achievements;
		public var molesKilled:int = 0;
		public var fireMolesKilled:int = 0;
		public var zombieMolesKilled:int = 0;
		public var misses:int = 0;
		
		private var gameTimer:Timer;
		
		//Rate at which moles appear
		private var GAME_TIMER_DELAY:int; 
		//Time moles stay on screen
		public static var MOLE_SHOW_DELAY:int;
		private const TOTAL_MOLES:int = 60;
		[Bindable]public var molesRemaining:int = TOTAL_MOLES;

		public function MainGame()
		{
			//Set up the game timer; when it fires a new mole is added
			difficultySetup();
			gameTimer = new Timer(GAME_TIMER_DELAY, TOTAL_MOLES);
			gameTimer.addEventListener(TimerEvent.TIMER, onGameTimer);
			gameTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onGameTimerComplete);
			achievements = new Achievements(this);
		}
		
		private function difficultySetup() : void
		{
			switch (difficulty) {
				//Easy
				case 0:
					GAME_TIMER_DELAY = 600;
					MOLE_SHOW_DELAY = 1300;
					break;
				//Medium
				case 1:
					GAME_TIMER_DELAY = 400;
					MOLE_SHOW_DELAY = 1000;
					break;
				//Hard
				case 2:
					GAME_TIMER_DELAY = 200;
					MOLE_SHOW_DELAY = 600;
					break;
				default:
					GAME_TIMER_DELAY = 400;
					MOLE_SHOW_DELAY = 1000;
					break;
			}
		}
		
		public function start() : void
		{
			//There are currently nine MoleHoles; create and
			//add them to the moleHoles ArrayCollection
			for(var i:int = 0; i < 9; i++)
			{
				var moleHole:MoleHole = new MoleHole();
				
				//A moleHole needs a reference to the game
				//so it can react appropriately to clicks
				moleHole.mainGame = this;
				moleHoles.addItem(moleHole);
			}
			
			gameTimer.start();
		}
		
		public function addScore(points:int) : void
		{
			score += points;
		}
			
		private function getFreeMoleHole() : MoleHole
		{
			//Pick a random hole until we find one without
			//an mole already in there
			var moleHole:MoleHole = null;
			
			while(moleHole == null || moleHole.mole)
			{
				moleHole = moleHoles[ Math.floor(Math.random() * moleHoles.length) ];
			}
			
			return moleHole;
		}
		
		private function onGameTimer(event:TimerEvent) : void
		{
			//Every time the timer fires, add a new mole
			var moleHole:MoleHole = getFreeMoleHole();
			moleHole.populate(new Mole());
			molesRemaining--;
		}
		
		private function onGameTimerComplete(event:TimerEvent) : void
		{
			achievements.checkAchievements();
			controller.loadGameOver(score);
		}
	}
}