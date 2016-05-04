package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import openfl.Assets;
/**
 * ...
 * @author MateoCarranza
 */
class ChivitoBoy extends FlxSprite
{

	public function new(?X:Float=0, ?Y:Float=0) 
	{
		super(X, Y);
		loadGraphic(Assets.getBitmapData(AssetPaths.hero__png), true, 45, 60);
		animation.add("run", [2, 3, 4, 5, 6, 7, 8, 9], 30);
		animation.add("stand", [10]);
		animation.add("jump", [1]);
		animation.add("fall", [0]);
		animation.add("wallHang", [11]);
		animation.play("stand");
		
		drag.x = 500;
		offset.y = 20;
		width = 40;
		height = 41;
		maxVelocity.x = 400;
		acceleration.y = 1500;
		
	}
	
	override public function update(elapsed:Float):Void 
	{
		
		
		acceleration.x = 0;
		if (FlxG.keys.pressed.LEFT)
		{
			animation.play("run");
			acceleration.x -= 1000;
			flipX = false;
		}
		if (FlxG.keys.pressed.RIGHT) 
		{
			animation.play("run");
			acceleration.x += 1000;
			flipX = true;
		}
		
		handleJump();

		
		if (velocity.x == 0 && isTouching(FlxObject.DOWN) && velocity.y == 0)
		{
			animation.play("stand");
		}
		if ((isTouching(FlxObject.RIGHT) || isTouching(FlxObject.LEFT)) && !isTouching(FlxObject.DOWN)){
			animation.play("wallHang");
			flipX = !flipX;
		}
		
		if (velocity.y > 0 && !isTouching(FlxObject.DOWN)){
			animation.play("fall");
		}
		
		super.update(elapsed);
	}
	
	function handleJump():Void{
		
		if (FlxG.keys.justPressed.SPACE && isTouching(FlxObject.DOWN))
		{
			velocity.y =- 600;
			animation.play("jump");
			
		}
		else if (FlxG.keys.justPressed.SPACE && isTouching(FlxObject.LEFT))
		{
			velocity.x = 300;
			velocity.y =- 600;
			animation.play("jump");
			
		}
		else if (FlxG.keys.justPressed.SPACE && isTouching(FlxObject.RIGHT))
		{
			velocity.x = -300;
			velocity.y =- 600;
			animation.play("jump");
		}

		
		
	}
}