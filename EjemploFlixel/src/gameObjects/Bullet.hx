package gameObjects;

import flixel.FlxG;
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
		//velocity.x = 1000;
		var deltaX:Float = FlxG.mouse.x - x;
		var deltaY:Float = FlxG.mouse.y - y;
		
		var length:Float = Math.sqrt(deltaX * deltaX + deltaY * deltaY);
		
		if (length == 0){
			length = 0.0001;
		}
		deltaX /= length;
		deltaY /= length;
		
		velocity.x = deltaX * 1000;
		velocity.y = deltaY * 1000;
		
	}
}