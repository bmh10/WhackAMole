package uk.co.dubit.whackamole.models.moles
{
	import uk.co.dubit.whackamole.models.MainGame;
	/**
	 * Implements all Mole types
	 **/
	public class Mole
	{
		//Points per mole
		public var points:int;
		
		//Amount of time each mole is on screen
		public var showtime:int = 1000;
		
		//Number of hits required to kill mole
		public var hitsToKill:int = 1;
		private var hits:int = 0;
		
		[Bindable] public var dead:Boolean = false;
		
		public function Mole ()
		{
			var n:int = Math.random()*100;
			
			//Create certain type of Mole with set probabilities
			if (n < 60)
				setupStandardMole();
			else if (n < 85)
				setupFireMole();
			else
				setupZombieMole();
		}
		
		private function setupStandardMole() : void
		{
			hitsToKill = 1;	
			points = 60;
			//Showtime depends on difficulty
			showtime = MainGame.MOLE_SHOW_DELAY;
		}

		private function setupFireMole() : void
		{
			hitsToKill = 2;
			points = 100;
			showtime = 1800;
		}
		
		private function setupZombieMole() : void
		{
			hitsToKill = 3;
			points = 400;
			showtime = 1200;
		}
		
		public function getMoleType() : String
		{
			switch (hitsToKill) {
				case 1:
					return "standardMole";
				case 2:
					return "fireMole";
				case 3:
					return "zombieMole";
				default:
					return "";
			}
		}
		
		public function hit() : void
		{
			hits++;
			if (hits >= hitsToKill)
				dead = true;
		}
	}
}