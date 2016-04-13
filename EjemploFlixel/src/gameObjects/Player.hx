package gameObjects;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import openfl.Assets;

/**
 * ...
 * @author MateoCarranza
 */
class Player extends FlxSprite
{
	static private inline var ACCELERATION:Float = 1000;
	
	var gun:Gun;
	

	public function new(?X:Float=0, ?Y:Float=0, aGun:Gun) 
	{
		super(X, Y);
		makeGraphic(50, 50);
		maxVelocity.set(400, 400);
		drag.set(500, 500);
		gun = aGun;
		loadGraphic(Assets.getBitmapData("img/hitman.png"),false,49,43);
		
	}
	
	override function update(elapsed:Float):Void
	{
		acceleration.set();
		if (FlxG.keys.pressed.LEFT){
			acceleration.x -= ACCELERATION;
		}
		if (FlxG.keys.pressed.RIGHT){
			acceleration.x += ACCELERATION;
		}
		if (FlxG.keys.pressed.DOWN){
			acceleration.y += ACCELERATION;
		}
		if (FlxG.keys.pressed.UP){
			acceleration.y -= ACCELERATION;
		}
		if (FlxG.keys.justPressed.SPACE){
			gun.shoot(x, y);
		}
		
		super.update(elapsed);
	}

}