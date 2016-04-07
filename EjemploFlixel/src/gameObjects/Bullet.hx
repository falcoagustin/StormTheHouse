package gameObjects;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;

/**
 * ...
 * @author MateoCarranza
 */
class Bullet extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(0, 0);
		makeGraphic(5, 5, FlxColor.RED);
		
	}
	
	override function reset(X:Float, Y:Float):Void
	{
		super.reset(X, Y);
		velocity.x = 1000;
		
	}
}