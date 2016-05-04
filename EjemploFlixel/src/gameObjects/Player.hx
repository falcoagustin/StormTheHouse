package gameObjects;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import openfl.Assets;
import openfl.events.MouseEvent;

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
		if (FlxG.keys.pressed.A){
			acceleration.x -= ACCELERATION;
		}
		if (FlxG.keys.pressed.D){
			acceleration.x += ACCELERATION;
		}
		if (FlxG.keys.pressed.S){
			acceleration.y += ACCELERATION;
		}
		if (FlxG.keys.pressed.W){
			acceleration.y -= ACCELERATION;
		}
		if (FlxG.mouse.get_justPressed()){
			gun.shoot(x, y);
		}
		
		
		var Xdistance:Float = FlxG.game.mouseX - this.x;
		var Ydistance:Float = FlxG.game.mouseY - this.y;
		this.angle = Math.atan2(Ydistance, Xdistance) * 180 / Math.PI;
		
		super.update(elapsed);
	}
	
	public function mouseProcess(mouse:MouseEvent) : Void
{
    
	
}

}