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
		makeGraphic(5, 5, FlxColor.YELLOW);

	}

	override function reset(xOrigin:Float, yOrigin:Float):Void
	{
		super.reset(xOrigin, yOrigin);
		//velocity.x = 1000;
		//var deltaX:Float = FlxG.mouse.x - x;
		//var deltaY:Float = FlxG.mouse.y - y;


	}
	
	public function resetAndShoot(xOrigin:Float, yOrigin:Float, xDestiny:Float, yDestiny:Float):Void
	{
		reset(xOrigin, yOrigin);
		var deltaX:Float = xDestiny - x;
		var deltaY:Float = yDestiny - y;

		var length:Float = Math.sqrt(deltaX * deltaX + deltaY * deltaY);

		if (length == 0){
			length = 0.0001;
		}
		deltaX /= length;
		deltaY /= length;

		velocity.x = deltaX * 3000;
		velocity.y = deltaY * 3000;
	}
}