package uk.co.dubit.whackamole.models.moles
{
	/**
	 * The only type of mole at the moment;
	 * one hit kills it
	 * 
	 **/
	public class Mole
	{
		//Points per mole
		public var points:int;
		
		//Amount of time each mole is on screen
		public var showtime:int = 1000;
		[Bindable] public var dead:Boolean = false;
		
		//Number of hits required to kill mole
		public var hitsToKill:int = 1;
		private var hits:int = 0;
		
		public function Mole (st:int=0)
		{
			var n:int = Math.random()*100;
			
			if (n < 60)
				setupStandardMole(st);
			else if (n < 85)
				setupFireMole();
			else
				setupZombieMole();
		}
		
		private function setupStandardMole(st:int) : void
		{
			hitsToKill = 1;	
			points = 60;
			showtime = st;
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