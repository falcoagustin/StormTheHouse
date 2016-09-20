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
	}
	
	public function resetAndShoot(xOrigin:Float, yOrigin:Float, xDestiny:Float, yDestiny:Float):Void
	{
		reset(xOrigin, yOrigin);
		var deltaX:Float = xDestiny - x;
		var deltaY:Float = yDestiny - y;

		var angle = Math.atan2(deltaY, deltaX) * 180 / Math.PI;
		
		
		var length:Float = Math.sqrt(deltaX * deltaX + deltaY * deltaY);

		if (length == 0){
			length = 0.0001;
		}
		deltaX /= length;
		deltaY /= length;

		velocity.x = deltaX * 2000;
		velocity.y = deltaY * 2000;
	}
}