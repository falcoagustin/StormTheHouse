

import flixel.FlxGame;
import openfl.display.Sprite;
import openfl.Lib;
import openfl.events.Event;
import states.MainMenu;



/**
 * ...
 * @author MateoCarranza
 */
class Main extends Sprite 
{

	public function new() 
	{
		super();
		addEventListener(Event.ADDED_TO_STAGE,init);
	}

	private function init(e:Event):Void 
	{
		removeEventListener(Event.ADDED_TO_STAGE, init);

		addChild(new FlxGame(800,600, MainMenu));
	}

}
