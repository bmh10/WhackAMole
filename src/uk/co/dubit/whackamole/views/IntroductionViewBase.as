package uk.co.dubit.whackamole.views
{
	import spark.components.Button;
	
	import uk.co.dubit.whackamole.framework.View;
	import uk.co.dubit.whackamole.models.MainGame;
	
	public class IntroductionViewBase extends View
	{
		public var easyButton:Button;
		public var mediumButton:Button;
		public var hardButton:Button;
		
		protected function onEasyButtonClick() : void
		{
			MainGame.difficulty = 0;
			controller.loadMainGame();
		}
		
		protected function onMediumButtonClick() : void
		{
			MainGame.difficulty = 1;
			controller.loadMainGame();
		}
		
		protected function onHardButtonClick() : void
		{
			MainGame.difficulty = 2;
			controller.loadMainGame();
		}
	}
}