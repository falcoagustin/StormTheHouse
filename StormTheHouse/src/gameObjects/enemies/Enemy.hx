package gameObjects.enemies;

import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.tile.FlxTilemap;
import flixel.util.FlxPath;
import gameObjects.weapons.Weapon;

/**
 * ...
 * @author MateoCarranza
 */
class Enemy extends FlxSprite
{
	
	private var speed:Float ;
	private var timeSinceAtack:Float;
	private var timeSinceLastSeen:Float;
	var weapon:Weapon;
	private var tileMap:FlxTilemap;
	private var enemyWidth:Float = 51;
	private var enemyHeight:Float = 43;
	private var mirko:Mirko;
	private var previousPoint:FlxPoint;
	private var defaultPath:Array<FlxPoint>;
	private var isOnDefaultPath:Bool;
	var accuracy: Int;
	private var maximumDistanceToMirko:Int;
	private var timeToAtack:Float;
	private var mirkoPoint: FlxPoint;
	private var enemyPoint: FlxPoint;
	private var deltaX:Float;
	private var deltaY:Float;
	private var length:Float;

	public function new(?X:Float = 0, ?Y:Float = 0, aWeapon:Weapon, map:FlxTilemap, delfaultPathRcv: Array<FlxPoint>) 
	{
		super(X, Y);
		timeSinceAtack = 0;
		mirko = GlobalGameData.instance.getPlayer();
		tileMap = map;
		this.path = new FlxPath();
		previousPoint = new FlxPoint(X, Y);
		this.defaultPath = delfaultPathRcv;
		moveToStart();
		this.path.onComplete = startPath;
		weapon = aWeapon;
		isOnDefaultPath = true;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		timeSinceAtack += elapsed;
		timeSinceLastSeen += elapsed;
		var mirko = GlobalGameData.instance.getPlayer();
		enemyPoint = new FlxPoint(x, y);
		mirkoPoint = new FlxPoint(mirko.x, mirko.y);
		deltaX = mirko.x - x;
		deltaY = mirko.y - y;
		length = Math.sqrt(deltaX * deltaX + deltaY * deltaY);
		
		if (length == 0){
			length = 0.0001;
		}
		
		shootIfOnSightAndTime();
		
		moveToMirkoIfTimeOrDefaultPath();

		setAngleAndPreviousPoint();

	}
	
	private function moveToMirko():Void{
		mirko = GlobalGameData.instance.getPlayer();
		var mirkoWidth:Float = 49;
		var mirkoHeight:Float = 43;
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
			FlxPoint.get(defaultPath[0].x, defaultPath[0].y));
		if (pathPoints != null) 
		{
			this.path.start(pathPoints, 120);
		}
		else
		{
			startDefaultPath();
		}

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
	
	private function shootIfOnSightAndTime()
	{
		if (tileMap.ray(enemyPoint, mirkoPoint) && length <= maximumDistanceToMirko){
			timeSinceLastSeen = 0;
			if(timeSinceAtack > timeToAtack){
				weapon.atack(x, y, mirkoPoint.x,mirkoPoint.y, accuracy);
				timeSinceAtack = 0;
			}
		}
	}
	
	private function moveToMirkoIfTimeOrDefaultPath(){
		if(speed != 80){ // chanchada para ir hacia mirko si es un zombie
			if (timeSinceLastSeen < 2)
			{
				moveToMirko();
				isOnDefaultPath = false;
			}
			
			else if(!isOnDefaultPath)
			{
				//moveToStart();
				//this.path.onComplete = startPath;
				//isOnDefaultPath = true;
			}
		}
		else
		{
			moveToMirko();
		}
	}
	
	private function setAngleAndPreviousPoint()
	{
		var Xdistance:Float = this.x - previousPoint.x;
		var Ydistance:Float = this.y - previousPoint.y ;
		this.angle = Math.atan2(Ydistance, Xdistance) * 180 / Math.PI;
		previousPoint.set(x, y);
	}
	
	
}
