package uk.co.dubit.whackamole.models
{
	/*
	 * Manages player's achievements
	 */
	public class Achievements
	{
		[Bindable]public static var apprentice:Boolean = false;
		[Bindable]public static var master:Boolean = false;
		[Bindable]public static var moleMassacre:Boolean = false;
		[Bindable]public static var fireman:Boolean = false;
		[Bindable]public static var apocolyptica:Boolean = false;
		[Bindable]public static var softTouch:Boolean = false;
		
		private var mainGame:MainGame;
		
		public function Achievements(mg:MainGame)
		{
			mainGame = mg;
		}
		
		public function checkAchievements() : void
		{
			//Apprentice -  Kill over 15 moles during a single game 
			if (mainGame.molesKilled > 15)
				apprentice = true;
			
			//Master Kill more than 40 zombie moles in a single game
			if (mainGame.zombieMolesKilled > 40)
				master = true;
			
			//Mole massacre - Kill over 55 moles during a game
			if (mainGame.molesKilled > 55)
				moleMassacre = true;
			
			//Fireman - Kill more than 10 fire moles in a single game
			if (mainGame.fireMolesKilled > 10)
				fireman = true;
			
			//Apocolyptica - Kill more than 5 zombie moles in a game
			if (mainGame.zombieMolesKilled > 5)
				apocolyptica = true;
			
			//Soft touch - Miss more than 30 moles during a game
			if (mainGame.misses > 30)
				softTouch = true;
		}
		
	}
}