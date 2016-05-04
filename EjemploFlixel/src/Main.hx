package;

import openfl.display.Sprite;
import openfl.Lib;
import flixel.FlxGame;
import openfl.events.Event;
import states.GameState;

/**
 * ...
 * @author MateoCarranza
 */
class Main extends Sprite 
{

	public function new() 
	{
		super();
		
		// Assets:
		// openfl.Assets.getBitmapData("img/assetname.jpg");
		
		//addChild(new FlxGame(800, 480, GameState));
		addEventListener(Event.ADDED_TO_STAGE,init);
	}
	
	private function init(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);
		
		addChild(new FlxGame(800,600, GameState));
	}

}
