package uk.co.dubit.whackamole.views
{
	import spark.components.Button;
	
	import uk.co.dubit.whackamole.framework.Model;
	import uk.co.dubit.whackamole.framework.View;
	import uk.co.dubit.whackamole.models.MainGame;
	import uk.co.dubit.whackamole.WhackAMoleBase;
	
	public class GameOverViewBase extends View
	{
		public var startButton:Button;
	
		[Bindable]
		public static var score:int;

		protected function onPlayAgainClick() : void
		{
			//Play the game again
			controller.loadMainGame();
		}
		
	}
}