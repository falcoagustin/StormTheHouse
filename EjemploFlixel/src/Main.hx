package;

import openfl.display.Sprite;
import openfl.Lib;
import flixel.FlxGame;
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
		
		addChild(new FlxGame(800,480, GameState));
	}

}
