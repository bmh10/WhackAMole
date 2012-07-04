package uk.co.dubit.whackamole.models
{
	public class Achievements
	{
//		Achievement name: Apprentice
//		Criteria required: Kill over 15 moles during a single game 
//		
//		Achievement name: Master
//		Criteria required: Kill more than 40 zombie moles in a single game
//		
//		Achievement name: Mole massacre
//		Criteria required: Kill over 55 moles during a game
//		
//		Achievement name: Fireman
//		Criteria required: Kill more than 10 fire moles in a single game
//		
//		Achievement name: Apocolyptica
//		Criteria required: Kill more than 5 zombie moles in a game
//		
//		Achievement name: Soft touch
//		Criteria required: Miss more than 30 moles during a game
		
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
			if (mainGame.molesKilled > 15)
				apprentice = true;
			
			if (mainGame.zombieMolesKilled > 40)
				master = true;
			
			if (mainGame.molesKilled > 55)
				moleMassacre = true;
			
			if (mainGame.fireMolesKilled > 10)
				fireman = true;
			
			if (mainGame.zombieMolesKilled > 5)
				apocolyptica = true;
			
			if (mainGame.misses > 30)
				softTouch = true;
		}
		
	}
}