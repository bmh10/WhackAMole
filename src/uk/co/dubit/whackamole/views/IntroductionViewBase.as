package uk.co.dubit.whackamole.views
{
	import flash.display.DisplayObject;
	import flash.media.*;
	
	import spark.components.Button;
	
	import uk.co.dubit.whackamole.WhackAMoleBase;
	import uk.co.dubit.whackamole.framework.View;
	import uk.co.dubit.whackamole.models.MainGame;
	
	public class IntroductionViewBase extends View
	{
		public var startButton:Button;
		public var helpButton:Button;
		public var backButton:Button;
		public var easyButton:Button;
		public var mediumButton:Button;
		public var hardButton:Button;
		
		//0=mainMenu, 1=diffucultyMenu, 2=InfoMenu
		[Bindable]
		public var menuIndex:int = 0;
		
		public var snd:Sound = new IntroductionView.sndCls() as Sound; 
		public static var sndChannel:SoundChannel;
		
		public function IntroductionViewBase() : void
		{
			playSound();
		}
		
		public function playSound():void
		{
			sndChannel = snd.play(0, 100);
			WhackAMoleBase.soundOn = true;
		}   
		
		public function stopSound():void
		{
			sndChannel.stop();
			WhackAMoleBase.soundOn = false;
		}   
		
		protected function onPlayButtonClick() : void
		{
			menuIndex = 1;
		}
		
		protected function onHelpButtonClick() : void
		{
			menuIndex = 2;
		}
		
		protected function onBackButtonClick() : void
		{
			menuIndex = 0;
		}
		
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

