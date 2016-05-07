package gameObjects;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tile.FlxTilemap;
import openfl.Assets;

/**
 * ...
 * @author MateoCarranza
 */
class Enemy extends FlxSprite
{

	private var speed:Float = 100;
	private var time:Float;
	var gun:Gun;
	private var tileMap:FlxTilemap;
	
	public function new(?X:Float=0, ?Y:Float=0, aGun:Gun, map:FlxTilemap) 
	{
		super(X, Y);
		loadGraphic(Assets.getBitmapData("img/survivor1_gun.png"), true, 49, 43);
		time = 0;
		gun = aGun;
		tileMap = map;
		//width = 26;
		//height = 53;
		//offset.set(14, 2);
		
	}
	
	override public function update(elapsed:Float):Void
	{

		super.update(elapsed);
		
		var player = GlobalGameData.instance.getPlayer();
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
		
		var Xdistance:Float = GlobalGameData.instance.getPlayer().x - this.x;
		var Ydistance:Float = GlobalGameData.instance.getPlayer().y - this.y;
		this.angle = Math.atan2(Ydistance, Xdistance) * 180 / Math.PI;
		time += elapsed;
		var enemyPoint = new FlxPoint(x, y);
		var mirkoPoint = new FlxPoint(GlobalGameData.instance.getPlayer().x,GlobalGameData.instance.getPlayer().y);
		if (tileMap.ray(enemyPoint, mirkoPoint) && length <= 300 && time >=1.3){
			gun.shoot(x, y, mirkoPoint.x, mirkoPoint.y);
			time = 0;
		}
		/*
		if (time >= 2){
			gun.shoot(x, y, GlobalGameData.instance.getPlayer().x, GlobalGameData.instance.getPlayer().y);
			time = 0;
		}
		*/
		
	}
	
	
	public function damage() 
	{
		this.kill();
		GlobalGameData.instance.enemyKilled(100);

	}
	

	
}