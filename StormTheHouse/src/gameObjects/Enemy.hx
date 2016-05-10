package gameObjects;

import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tile.FlxTilemap;
import flixel.util.FlxPath;
import openfl.Assets;

/**
 * ...
 * @author MateoCarranza
 */
class Enemy extends FlxSprite
{

	private var speed:Float = 100;
	private var timeSinceShoot:Float;
	private var timeSinceLastSeen:Float;
	var gun:Gun;
	private var tileMap:FlxTilemap;
	private var enemyWidth:Float = 51;
	private var enemyHeight:Float = 43;
	private var mirko:Mirko;
	private var previousPoint:FlxPoint;
	private var defaultPath:Array<FlxPoint>;
	private var isOnDefaultPath:Bool;
	
	public function new(?X:Float=0, ?Y:Float=0, aGun:Gun, map:FlxTilemap) 
	{
		super(X, Y);
		loadGraphic(Assets.getBitmapData("img/survivor1_gun.png"), true, 49, 43);
		timeSinceShoot = 0;
		timeSinceLastSeen = 5;
		gun = aGun;
		tileMap = map;
		mirko = GlobalGameData.instance.getPlayer();
		this.path = new FlxPath();
		defaultPath = setDefaultPath();
		previousPoint = new FlxPoint(X, Y);
		moveToStart();
		this.path.onComplete = startPath;
		
		isOnDefaultPath = true;
		
	}
	
	private function setDefaultPath():Array<FlxPoint>
	{
		var firstPoint = new FlxPoint(64 * 5 + 32, 64 * 6 + 32);
		var secondPoint = new FlxPoint(64 * 13 + 32, 64 * 6 + 32);
		var thirdPoint = new FlxPoint(64 * 13 + 32, 64 * 10 + 32);
		var fourthPoint = new FlxPoint(64 * 5 + 32, 64 * 10 + 32);
		
		
		var path = new Array<FlxPoint>();
		path.push(firstPoint);
		path.push(secondPoint);
		path.push(thirdPoint);
		path.push(fourthPoint);
		
		return path;
	}
	
	override public function update(elapsed:Float):Void
	{

		super.update(elapsed);
		timeSinceShoot += elapsed;
		timeSinceLastSeen += elapsed;
		var mirko = GlobalGameData.instance.getPlayer();
		var enemyPoint = new FlxPoint(x, y);
		var mirkoPoint = new FlxPoint(mirko.x, mirko.y);
		var deltaX:Float = mirko.x - x;
		var deltaY:Float = mirko.y - y;
		var length:Float = Math.sqrt(deltaX * deltaX + deltaY * deltaY);
		
		if (length == 0){
			length = 0.0001;
		}
		
		if (tileMap.ray(enemyPoint, mirkoPoint) && length <= 300){
			timeSinceLastSeen = 0;
			if(timeSinceShoot > 1.3){
				gun.shoot(x, y, mirkoPoint.x, mirkoPoint.y);
				timeSinceShoot = 0;
			}
		}
		
		if (timeSinceLastSeen < 2)
		{
			moveToMirko();
			isOnDefaultPath = false;
		}
		
		else if(!isOnDefaultPath)
		{
			moveToStart();
			this.path.onComplete = startPath;
			isOnDefaultPath = true;
		}

		var Xdistance:Float = this.x - previousPoint.x;
		var Ydistance:Float = this.y - previousPoint.y ;
		this.angle = Math.atan2(Ydistance, Xdistance) * 180 / Math.PI;
		previousPoint.set(x, y);
		
	}
	
	private function startPath(path:FlxPath):Void
	{
		startDefaultPath();
	}
	
	private function startDefaultPath():Void
	{
		this.path.start(defaultPath, 120, FlxPath.LOOP_FORWARD);
	}
	
	
	public function damage() 
	{
		this.kill();
		GlobalGameData.instance.enemyKilled(100);

	}
	
	private function moveToMirko():Void
	{
		mirko = GlobalGameData.instance.getPlayer();
		var mirkoWidth:Float = 49;
		var mirkoHeight:Float = 43;
		// Find path to goal from unit to goal
		var pathPoints:Array<FlxPoint> = tileMap.findPath(
			FlxPoint.get(x + width / 2, y + height / 2),
			FlxPoint.get(mirko.x + mirkoWidth / 2, mirko.y + mirkoHeight / 2));
		if (pathPoints != null) 
		{
			this.path.start(pathPoints, 170);
		}
		else 
		{
		}
	}
	
	private function moveToStart():Void
	{
		var pathPoints:Array<FlxPoint> = tileMap.findPath(
			FlxPoint.get(x + width / 2, y + height / 2),
			FlxPoint.get(64 * 5 + 32, 64 * 6 + 32));
		if (pathPoints != null) 
		{
			this.path.start(pathPoints, 120);
		}

	}
	

	
}