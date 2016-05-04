package gameObjects;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import openfl.Assets;

/**
 * ...
 * @author MateoCarranza
 */
class Jason extends FlxSprite
{

	private var speed:Float=100;
	
	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic(Assets.getBitmapData("img/jason.png"), true, 55, 70);
		width = 26;
		height = 53;
		offset.set(14, 2);
		animation.add("left", [1]);
		animation.add("right", [3]);
		animation.add("down", [0]);
		animation.add("up", [2]);
		//false es para no loopear la img, 7 es el frame rate
		animation.add("death", [4, 5, 6, 7, 7, 7, 7, 7], 3, false); 
		animation.add("revive", [4,5,6,7,7,7,7,7,6,5,4], 3,false); 
		//donde comienza la animacion
		animation.play("down");
		
	}
	
	override public function update(elapsed:Float):Void
	{
		if (animation.curAnim.name == "revive"){
			
			super.update(elapsed);
			velocity.set(0, 0);
			allowCollisions = FlxObject.NONE;
			return;
		}
		
		
		super.update(elapsed);
		
		allowCollisions = FlxObject.ANY;
		var player = GlobalGameData.player;
		var deltaX:Float = player.x - x;
		var deltaY:Float = player.y - y;
		
		var length:Float = Math.sqrt(deltaX * deltaX + deltaY * deltaY);
		if (length == 0){
			length = 0.0001;
		}
		deltaX /= length;
		deltaY /= length;
		
		speed = 100;
		velocity.x = deltaX * speed;
		velocity.y = deltaY * speed;
		
		if (Math.abs(velocity.x) > Math.abs(velocity.y))
		{
			if (velocity.x > 0)
			{
				animation.play("right");
			}
			if (velocity.x < 0)
			{
				animation.play("left");
			}
		}
		else{
			if (velocity.y > 0)
			{
				animation.play("down");
			}
			else{
				animation.play("up");
			}
		}
	}
	
	public function damage(float:Float) 
	{
		animation.play("revive");
		//velocity.set(0, 0);
		allowCollisions = FlxObject.NONE;
		

	}
	

	
}